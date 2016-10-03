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

10.times do |n|
  title = Faker::Lorem.words(rand(5...9)).join(' ')
  description = Faker::Lorem.paragraph(rand(10...26))
  user = User.find(rand(1...User.count+1)).ip_needs.build(title: title, description: description).save
end

10.times do |n|
  title = Faker::Lorem.words(rand(5...16)).join(' ')
  description = Faker::Lorem.paragraph(rand(10...26))
  user = User.find(rand(1...User.count+1)).ip_offers.build(title: title, description: description).save
end

