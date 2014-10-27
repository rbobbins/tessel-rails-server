An API-only simple Rails app. 
Intended to be the backend for the iOS app featured here: https://github.com/rbobbins/tessel-beacon-demo

Features
========
* POST to `/api/tessels/`  - register a new tessel; returns a UUID
* POST to `/api/tessels/:tessel_id/checkins` - saves the device_id/tessel_id combination, along with timestamp (required params: {checkin: {device_id: SOME_UUID_FOR_THE_DEVICE_THATS_POSTING })
* GET `/api/tessels/:tessel_id/checkins` - returns a list of checkins associated with this tessel


Installation
============

* `git clone https://github.com/rbobbins/tessel-rails-server.git`
* `brew install postgres` - assuming you're on a Mac, and don't have postgres already
* Follow Homebrew's instructions for running Postgres
* `bundle install`

Deploy (to Heroku)
======
1. Follow the instructions here: https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up] to install the Heroku toolbelt
1. Follow the instructions here: https://devcenter.heroku.com/articles/getting-started-with-ruby#deploy-the-app to deploy your app
1. `heroku run rake db:migrate` - creates the application's database
