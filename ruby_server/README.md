For test purposes I needed a REST service that does the following:

Accepts HTTP GET or POST to URI /records/relay on port 3000 (or whatever port is configured for the server).
For instance, user can access http://localhost:3000/records/relay with a web browser.

Uses that access as a trigger to POST a set of XML files saved on disk to another host.
Sends the xml files on to http://anotherhost:3001/records/create (or whatever port that server is on)

Also accepts a DELETE to /records/destroy on port 3000 and communicates that on to another server where 
it triggers an action that will delete the records in a mongodb that were generated from the XML files.
