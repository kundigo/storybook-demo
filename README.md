# Technical Requirements

This project uses:
* Ruby 2.6.3 or higher (version indicated in .ruby-version file).
   * Use rbenv to manage ruby versions: [instalation instruction](https://github.com/rbenv/rbenv#homebrew-on-macos)
   * `rbenv install 2.6.3`
* docker - [installation instructions](https://docs.docker.com/docker-for-mac/install/)
* bundler - `gem install bundler`
* rails - `gem install rails`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)

# Working locally

## First Installation

    cd /path/to/projects/folder
    git clone git@github.com:kundigo/storybook_demo.git storybook_demo
    cd storybook_demo
    gem install bundler
    gem install foreman
    bundle install   # installs the gems, it may take a while the first time
    yarn install     # installs the javascript dependencies, it may take a while the first time
    cp config/database.yml.sample config/database.yml     # create local database config file
                                                          # if needed please edit the file before going to the next step
                                                          # you should provide details for development and test db
    cp .env.sample .env                                   # create your local env file
                                                          # don't forget to update the file
    foreman run docker-compose up -d
    foreman run bundle exec rails db:create:all
    foreman run bundle exec rails db:migrate
    foreman run bundle exec rails db:test:prepare
    foreman run bundle exec rails db:seed
    foreman run docker-compose kill db


### Running the project

Start the app:

     ./start.dev.sh   # this script will launch the foreman with the right Procfile

Now you can go to http://localhost:7000 (or whatever port number you have used in your `.end` file) and play with the app.


In order to run the console  you need to use this command in order to have the env variables from then `.env` file automatically loaded.

     foreman run bundle exec rails c

Same goes for the rake tasks or generators:

     foreman run bundle exec rails g ...
     foreman run bundle exec rails db:migrate
