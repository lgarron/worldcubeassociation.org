# worldcubeassociation.org [![Build Status](https://travis-ci.org/thewca/worldcubeassociation.org.svg?branch=master)](https://travis-ci.org/thewca/worldcubeassociation.org) [![Coverage Status](https://coveralls.io/repos/github/thewca/worldcubeassociation.org/badge.svg?branch=master)](https://coveralls.io/github/thewca/worldcubeassociation.org?branch=master)

This repository contains all of the code that runs on [worldcubeassociation.org](https://www.worldcubeassociation.org/).

## Setup

- Clone this repo! (And navigate into it)
  ```
  git clone https://github.com/thewca/worldcubeassociation.org
  cd worldcubeassociation.org
  ```
- Ensure you have the correct [Ruby version](./.ruby-version) installed. We recommend using a Ruby version manager like [rvm](https://rvm.io/rvm/install) or [rbenv](https://github.com/rbenv/rbenv). They should both read the `.ruby-version` file to use the correct version (`rvm current` or `rbenv version` to confirm).
- Ensure [Bundler 2](https://bundler.io/v2.0/guides/bundler_2_upgrade.html) is installed
  - To update from bundler 1:
    ```
    gem update --system
    bundle update --bundler
    ```
  - Or, if you haven't installed bundler previously:
    ```
    gem update --system
    gem install bundler
    ```
- Set up git pre-commit hook. Optional, but very useful.
  ```shell
  (cd WcaOnRails; bundle install && bin/yarn && bundle exec overcommit --install)
  ```
  If some changes are made to this hook, you will have to update it running this command from the repository's root directory: `BUNDLE_GEMFILE=WcaOnRails/Gemfile bundle exec overcommit --sign`.

## Run directly with Ruby (lightweight, but only runs the Rails portions of the site)

- Install [MySQL 8.0](https://dev.mysql.com/doc/refman/8.0/en/linux-installation.html), and set it up with a user with username "root" with an empty password.
  If it poses problems, try the following:
  ```shell
  # Run MySQL CLI as administrator and set an empty password for the root user:
  sudo mysql -u root
  ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
  ```
- Install dependencies and load development database.
  1. `cd WcaOnRails/`
  2. [Install yarn](https://yarnpkg.com/en/docs/install) if you hadn't
  3. `bundle install && bin/yarn`
  4. `bin/rake db:load:development` - Download and import the [developer's database export](https://github.com/thewca/worldcubeassociation.org/wiki/Developer-database-export).
  5. `bin/rails server` - Run rails. The server will be accessible at localhost:3000
- Run tests. Setup instructions follow `before_script` in `.travis.yml`.
  1. `RAILS_ENV=test bin/rake db:reset` - Set up test database.
  2. `RAILS_ENV=test bin/rake assets:precompile` - Compile some assets needed for tests to run.
  3. `bin/rspec` - Run tests.
- [Mailcatcher](http://mailcatcher.me/) is a good tool for catching emails in development.

## Run in Docker (WIP)

- `cd WcaOnRails`
- `make run`
- `make shell` - Open a shell.
- **Inside of the shell**: `bin/rake db:load:development` - Load the developer's database export. This will take a while!
  - `bin/rake db:reset` - A bit faster than loading the developer's database
    export, this should only take ~4 minutes, but it's not nearly as
    interesting as the developer's database export.
- **Inside of the shell**: `bin/rails server --binding=0.0.0.0`
  - Note: Sometimes this will fail, complaining about dependencies. At this
    point you could either rebuild the containers (`make build`), which can be
    slow, or you could just run `bin/yarn` or a `bin/bundle` as needed.
- **Optional, but will speed up Javascript development quite a bit**:
  `bin/webpack-dev-server` in a new `make shell`.

## Run in Vagrant (gets everything working, but is very slow, recommended only if you need to run the PHP portions of the website)

- Install [Vagrant](https://www.vagrantup.com/), which requires
  [VirtualBox](https://www.virtualbox.org/).
- `vagrant up all` - Once the VM finishes initializing (which can take some time),
  the website will be accessible at [http://localhost:2331](http://localhost:2331).
  - Note: There are some minor [issues with development on Windows](https://github.com/thewca/worldcubeassociation.org/issues/393).
- All emails will be accessible at `http://localhost:2332`.
- Please take a look at this [wiki page](https://github.com/thewca/worldcubeassociation.org/wiki/Misc.-important-commands-to-know) for more detailed informations about the application's internals.

# Production

See [Spinning up a new server](https://github.com/thewca/worldcubeassociation.org/wiki/Spinning-up-a-new-server) and
[Merging and deploying](https://github.com/thewca/worldcubeassociation.org/wiki/Merging-and-deploying).
