# README

# What is this?
A simple sample app in Rails for the Messaging App project at branch.co

# How do I get started?

## Prerequisites
We assume you already have the following installed already:
- Ruby 2.4.4 or higher (we tested with 2.4.4)
- Postgres (we used Postgres 10.4, but newer or older versions should also
  work). Installation instructions for all platforms can be found
  [here](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup). Alternatively,
  a simple SQLite database could also work.

## Setup

  * Install homebrew

    ~~~
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ~~~
  * Install rvm / ruby (https://rvm.io/) or rbenv. If using `rbenv`:

    ~~~
    brew install rbenv ruby-build
    rbenv install 2.4.4
    rbenv global 2.4.4
    ~~~

    Close terminal and restart.

  * Install bundler

    ~~~
    gem install bundler
    ~~~

    If this fails, add this to ~/.bash_profile before installing bundler:

    ~~~
    eval "$(rbenv init -)"
    ~~~
  * Install [Postgres.app](http://postgresapp.com/) or `brew install postgresql`. If using `Postgres.app` you will need to install the `pg` gem as follows:

    ~~~
    gem install pg --version 0.21.0 -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.6/bin/pg_config
    ~~~

    Make sure Postgres is running before proceeding: : `ps x | grep /bin/postgres` should
    return something along the lines of `/usr/local/opt/postgresql/bin/postgres
    -D /usr/local/var/postgres`. If it isn't, follow installation and
    troubleshooting instructions above.


  * Clone the repo and navigate into the top-level directory.

  * Create the database: `createdb branch-messaging-app` (depending on how
    you installed Postgres, the `createdb` tool may not be in your PATH. If you
    installed Postgres.app, you can point directly at
    `/Applications/Postgres.app/Contents/Versions/latest/bin/createdb`)
  * Run the setup script: `rake db:seed`
  * Start the server: `rails s`
  * Navigate to http://localhost:3000/customers to see the agent
  interface.
  * Navigate to http://localhost:3000/customers/test to submit customer messages.


