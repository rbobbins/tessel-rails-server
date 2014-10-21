An API-only simple Rails app. 
Intended to be the backend for the iOS app featured here: https://github.com/rbobbins/tessel-beacon-demo

Features
========

* Can POST to /api/tessel/register, which saves a unique UUID
* Can POST to /api/tessel/ping, which saves a combination of 3 UUID's (the tessel's, the device that has detected the tessel, an identifier for the checkin itself)

Installation
============

* `git clone https://github.com/rbobbins/tessel-rails-server.git`
* `brew install postgres #assuming you're on a Mac, and don't have postgres already` 
* Follow Homebrew's instructions for running Postgres
* `bundle install`
