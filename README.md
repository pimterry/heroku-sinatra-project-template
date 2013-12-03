UnnamedApp
==========

This repo contains a template for a Sinatra project on Heroku, with Travis, Vagrant & New Relic all in place, and a solid
test framework for adding unit, component and integration tests.

This is simplest to use with a traditional Heroku application (data model all on Heroku, providing a series of web pages
from the model data and a set of templates with some light supporting logic), but is also a good base for all sorts of
other applications; I'm using it as the base for [Comparably](https://github.com/pimterry/comparably), for example, which
doesn't have a normal relational DB at all, instead shifting the whole setup to Neo4J, relatively painlessly.

Instructions
------------

* To set this up, do a quick search and replace on:

  * 'UnnamedApp': this should be replaced with your application name
  * 'TODO': Follow the various instructions given

* Customize the site to your heart's content

* Once you're ready to run it, run `vagrant up` to set up a vagrant environment, `vagrant ssh` to log into it,
and `foreman start` to run the web service.

* Make sure it definitely all works quickly with `rake local_test` to run all the tests

* To test whether your locally deployed running site works, install PhantomJS (or set WEBDRIVER_URL to another webdriver
 instance) and run `rake local_integration`

* To deploy:

  * On travis-ci.org, create a build for your repository
  * On heroku, create two sites: a test site and a live site
  * Install travis's local tools (`gem install travis`) and run `travis setup heroku` to fill out your heroku details in travis.yml
  * Add your encrypted github OAuth key to travis.yml by running `travis encrypt GH_OAUTH_TOKEN=YOURKEY --add`
  * Push to your github repo, and watch the travis build pipeline run the tests, release the test site, integration test
 the test site, and release the live site

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/pimterry/heroku-sinatra-project-template/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

