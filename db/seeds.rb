user = User.create!(first_name: "Cjay", last_name: "Billones", email: "billonesciprian08@yahoo.com", 
                  password: "password", password_confirmation: "password", admin: true, activated: true,
                  activated_at: Time.zone.now)

user = User.create!(first_name: "Dyosa", last_name: "Andaca", email: "mariaaprilrose@gmail.com",
                  password: "password", password_confirmation: "password", activated: true,
                  activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  first_name = name.split[0]
  last_name = name.split[1]
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name:  first_name,
               last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

