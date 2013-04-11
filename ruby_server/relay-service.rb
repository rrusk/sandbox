#!/usr/bin/env ruby
# A simple WEBrick web server
#
require 'webrick'
require 'net/http/post/multipart'

include WEBrick # import WEBrick namespace

config={}
config.update(:Port => 3000)
config.update(:DocumentRoot => './')
server = HTTPServer.new(config)

# Mount servlets
server.mount_proc('/') { |req, resp|
  resp.body = '<a href="/records/destroy">Delete</a> test patient records<br><a href="/records/relay">Create</a> test patient records'
}
server.mount_proc('/records/destroy') { |req, resp|
  uri = URI.parse("http://localhost:3001/records/destroy")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Delete.new(uri.request_uri)
  response = http.request(request)
  resp.body = response.body
}
class RecordRelayServlet < HTTPServlet::AbstractServlet
  def do_GET(request, response)
    Dir.glob('/vagrant/files/*.xml') do |xml_file|
      url = URI.parse('http://localhost:3001/records/create')
      File.open(xml_file) do |xml|
        req = Net::HTTP::Post::Multipart.new url.path, "content" => UploadIO.new(xml, "text/xml", "temp_scoop_document.xml")
        res = Net::HTTP.start(url.host, url.port) do |http|
          http.request(req)
        end
      end

      #render :text => res.message, :status => res.code
      response.body=res.message
    end
    raise HTTPStatus::OK
  end
  alias :do_POST :do_GET # accept POST request
end
server.mount('/records/relay', RecordRelayServlet)

# Trap signals to shutdown cleanly.
['INT', 'TERM'].each do |signal|
  trap(signal) {server.shutdown}
end

# Start the server
server.start
