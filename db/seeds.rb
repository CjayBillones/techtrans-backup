# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(first_name: "Cjay", last_name: "Billones", email: "billonesciprian08@yahoo.com", 
                  password: "password", password_confirmation: "password" )

user = User.create(first_name: "Dyosa", last_name: "Andaca", email: "mariaaprilrose@gmail.com",
                  password: "password", password_confirmation: "password")
