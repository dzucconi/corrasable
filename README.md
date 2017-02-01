# Corrasable

[![Build Status](https://travis-ci.org/dzucconi/corrasable.svg?branch=master)](https://travis-ci.org/dzucconi/corrasable)

[Corrasable](https://github.com/dzucconi/corrasable) is a web service that packages together tools like [Lingua](http://www.pressure.to/ruby/) and [The CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict).

Better documentation forthcoming. Refer to [available routes](https://github.com/dzucconi/corrasable/blob/master/config/routes.rb) in the meantime.

## Getting Setup

Install MongoDB if you don't already have it:

```
brew update
brew install mongodb
```

Clone the repo and bundle:

```
git clone git@github.com:dzucconi/corrasable.git
cd corrasable
bundle install
```

Start the server:

```
foreman run -f Procfile.dev
```

Set up the database (this could take a while):

```
bundle exec rake bootstrap:seed
```

## Deploying your own instance

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/dzucconi/corrasable/tree/master)

Due to issues with the running length of the initial database import, the bootstrap Rake task will not run automatically post-install. It's recommended that you push a local mongodump to the production database once it's set up.
