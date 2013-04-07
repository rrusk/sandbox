The README for a Mirth Rest Adapter used to demonstrate to the Scoop project
how we use Rails.

To install Ruby and rvm, install them using:
$ \curl -L https://get.rvm.io | bash -s stable --rails --autolibs=enabled --ruby=1.9.2

Create a default gemset to keep all the gems for this project together
$ rvm use 1.9.2@hquery --create --default

Before going on you may want to add the following to ~/.gemrc:

install: --no-rdoc --no-ri
update: --no-rdoc --no-ri

Then install Rails with:
$ gem install rails -v 3.2.5

Install the gems:
$ bundle install

Run the server with:
$ rails server

