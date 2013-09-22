UnnamedApp
==========

This repo contains a template for a Sinatra project on Heroku, with Travis, Vagrant & New Relic all in place, and a solid
test framework for adding unit, component and integration tests.

This is simplest to use with a traditional Heroku application (data model all on Heroku, providing a series of web pages
from the model data and a set of templates with some light supporting logic), but is also a good base for all sorts of
other applications; I'm using it as the base for [Comparably](https://github.com/pimterry/comparably), for example, which
doesn't have a normal relational DB at all, instead shifting the whole setup to Neo4J, relatively painlessly.

To set this up, do a quick search and replace on:

* 'UnnamedApp': this should be replaced with your application name
* 'TODO': Follow the various instructions given

Once you've customized the template, run `vagrant up` to set up a vagrant environment, `vagrant ssh` to log into it,
and `foreman start` to run the web service.