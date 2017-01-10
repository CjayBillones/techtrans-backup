# README

### Ruby and Rails Version
* Ruby 2.3.0
* Rails 5.0.0.1

### Setting Up
###### Installation
1. Install git
2. Install Ruby and Ruby on Rails by following the tutorial [here](https://gitlab.com/up-csi/dev-resources/blob/master/learn_ruby_on_rails.md).

###### Development
1. Clone the [repository](https://gitlab.com/billonesciprian08/ipttu-website.git) to your local machine by executing `git clone https://gitlab.com/billonesciprian08/ipttu-website.git`
2. Go to the project directory.
3. Once inside the project directory, run `bundle install`.
4. Setup the database by running the following commands:
    * `bundle exec rake db:create` or `rails db:create` to create the database
    * `bundle exec rake db:migrate` or `rails db:migrate` to setup the database migrations
    * `bundle exec rake db:seed` or `rails db:seed` to populate the database
5. Run your local server by running `bin/rails server`.
