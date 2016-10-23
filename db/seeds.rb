require 'csv'

industry = Industry.create(
                    industry_name: "UP Center for Student Innovations",
                    contact_email: "dcs.innovate@gmail.com",
                    contact_number: "(+63) 995 3769 223")

academe = Academe.create(
                    academe_name: "UP Diliman",
                    unit: "Office of the Vice-Chancellor for Research and Development",
                    department: "Intellectual Property Technology Transfer Unit"
                  )

user = User.create!(
                  first_name: "Cjay",
                  last_name: "Billones",
                  email: "billonesciprian08@yahoo.com", 
                  password: "password", password_confirmation: "password", admin: true, activated: true,
                  activated_at: Time.zone.now,
                  accounts_id: 1,
                  accounts_type: "Industry")

user = User.create!(
                  first_name: "Dyosa",
                  last_name: "Andaca",
                  email: "mariaaprilrose@gmail.com",
                  password: "password", password_confirmation: "password", activated: true,
                  activated_at: Time.zone.now,
                  accounts_id: 1,
                  accounts_type: "Academe")

10.times do |n|
  name  = Faker::Name.name
  first_name = name.split[0]
  last_name = name.split[1]
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(
                first_name: first_name,
                last_name: last_name,
                email: email,
                password:              password,
                password_confirmation: password,
                activated: true,
                activated_at: Time.zone.now)
end

ip_offers_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-offers-seeds.csv'))
csv = CSV.parse(ip_offers_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  user = User.find(rand(1...User.count+1)).ip_offers.build(title: row['Title'], description: row['Overview'],
          photo: ActionDispatch::Http::UploadedFile.new(
          :filename => File.basename(image_file),
          :tempfile => image_file,
          :type => MIME::Types.type_for(image_path).first.content_type
        )).save
end

10.times do |n|
  title = Faker::Lorem.words(rand(5...9)).join(' ')
  description = Faker::Lorem.paragraph(rand(10...26))
  user = User.find(rand(1...User.count+1)).ip_needs.build(title: title, description: description).save
end