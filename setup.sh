#!/bin/bash
bundle exec rake db:drop db:create db:migrate
#
if [ $# -eq 0 ] || [ $1 = "development" ]; then
  bundle exec rake db:seed RAILS_ENV=development
elif [ $1 = "test" ]; then
  bundle exec rake db:seed RAILS_ENV=test
elif [ $1 = "production" ]; then
  bundle exec rake db:seed RAILS_ENV=production
else
  echo "Error: Invalid argument"
  echo "Usage: ./setup.sh [development | test | production]"
fi