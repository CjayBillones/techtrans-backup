rails db:drop db:create db:migrate

if [ $# -eq 0 ] || [ $1 = "development" ]; then
  rails db:seed RAILS_ENV=development
elif [ $1 = "test" ]; then
  rails db:seed RAILS_ENV=$1
elif [ $1 = "production" ]; then
  rails db:seed RAILS_ENV=$1
else
  echo "Error: Invalid argument. Only accepts one of the following: [development | test | production]"
fi
