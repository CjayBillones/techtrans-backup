require 'csv'

#11.times do |n|
  industry = Industry.create!(
                      industry_name: "UP Center for Student Innovations",
                      contact_email: "dcs.innovate@gmail.com",
                      contact_number: "(+63) 995 3769 223") if !Industry.find_by_contact_email("dcs.innovate@gmail.com")

  academe = Academe.create!(
                      user_type: "Student",
                      id_number: "2012-27860",
                      contact_number: "(+63) 995 3769 223",
                    ) if !Academe.find_by_id_number("2012-27860")
#end

user = User.create!(
                  first_name: "Cjay",
                  last_name: "Billones",
                  email: "industry1@gmail.com", 
                  password: "password", password_confirmation: "password", admin: true, activated: true,
                  activated_at: Time.zone.now,
                  accounts_id: 1,
                  accounts_type: "Industry") if !User.find_by_email("industry1@gmail.com")

user = User.create!(
                  first_name: "Dyosa",
                  last_name: "Andaca",
                  email: "academe1@gmail.com",
                  password: "password", password_confirmation: "password", activated: true,
                  activated_at: Time.zone.now,
                  accounts_id: 1,
                  accounts_type: "Academe") if !User.find_by_email("academe1@gmail.com")

#10.times do |n|

#  name  = Faker::Name.name
#  first_name = name.split[0]
#  last_name = name.split[1]
#  email = "example-#{n+1}@railstutorial.org"
#  password = "password"
  
#  if n%2 == 0 do
#    User.create!(
#                  first_name: first_name,
#                  last_name: last_name,
#                  email: email,
#                  password:              password,
#                  password_confirmation: password,
#                  activated: true,
#                  activated_at: Time.zone.now,
#                  accounts_id: n+2,
#                  accounts_type: "Academe")
#  else
#    User.create!(
#              first_name: first_name,
#              last_name: last_name,
#              email: email,
#              password:              password,
#              password_confirmation: password,
#              activated: true,
#              activated_at: Time.zone.now,
#              accounts_id: +2,
#              accounts_type: "Industry")
#  end
#end

ip_offers_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-offers-seeds.csv'))
csv = CSV.parse(ip_offers_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  user = User.find(rand(1...User.count+1)).ip_offers.build(
          title: row['Title'], 
          subtitle: row['Subtitle'],
          overview: row['Overview'],
          key_features: row['Key Features'],
          applications: row['Applications'],
          customer_edge: row['Customer Edge'],
          market_opportunity: row['Market Opportunity'],
          inventors: row['Inventors'],
          photo: ActionDispatch::Http::UploadedFile.new(
          :filename => File.basename(image_file),
          :tempfile => image_file,
          :type => MIME::Types.type_for(image_path).first.content_type
          ),
          document: ActionDispatch::Http::UploadedFile.new(
          :filename => File.basename(document_file),
          :tempfile => document_file,
          :type => MIME::Types.type_for(document_path).first.content_type
          )).save if !IpOffer.find_by_title(row['Title'])
end

ip_needs_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-needs-seeds.csv'))
csv = CSV.parse(ip_needs_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  user = User.find(rand(1...User.count+1)).ip_needs.build(
          title: row['Title'], 
          description: row['Description'],
          features: row['Features'],
          business_model: row['Business Model'],
          photo: ActionDispatch::Http::UploadedFile.new(
          :filename => File.basename(image_file),
          :tempfile => image_file,
          :type => MIME::Types.type_for(image_path).first.content_type
          ),
          document: ActionDispatch::Http::UploadedFile.new(
          :filename => File.basename(document_file),
          :tempfile => document_file,
          :type => MIME::Types.type_for(document_path).first.content_type
          )).save if !IpNeed.find_by_title(row['Title'])
end