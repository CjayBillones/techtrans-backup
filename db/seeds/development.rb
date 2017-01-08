require 'csv'

# Tag Population #
tags = ["Materials and Industry Resources",
        "Fishery and Aquaculture", 
        "Agriculture", 
        "Forestry",
        "Natural Resources",
        "Education",
        "Food and other Fermented Products",
        "Energy and Environment",
        "Health and Wellness",
        "Corporate Solutions",
        "Designs"]

tags.each do |t|
  tag = ActsAsTaggableOn::Tag.create(name: t) if !ActsAsTaggableOn::Tag.find_by_name(t)
end

# User Population #

def generate_address
  street = Faker::Address.street_address
  city = Faker::Address.city
  return street + city
end

industry_classifications = ["Agriculture, Forestry and Fishing', 'Mining and Quarrying",
                    "Manufacturing', 'Electricity, Gas, Steam and Air-conditioning Supply",
                      "Water Supply, Sewerage, Waste Management and Remediation Activities",
                      "Construction", "Wholesale and Retail Trade", "Transportation and Storage",
                      "Accommodation and Food Service Activities", "nformation and Communication",
                      "Financial and Insurance Activities", "Real Estate Activities", 
                      "Professional, Scientific and Technical Services", 
                      "Administrative and Support Service Activities", 
                      "Public Administrative and Defense", "Education", 
                      "Human Health and Social Work Activities", "Arts, Entertainment and Recreation",
                      "Other Service Activities"]

user_types = ['Student', 'Researcher', 'Faculty']

# Industry Population #
5.times do |n|
  email = "industry#{n}@gmail.com"
  industry_name = Faker::Company.name
  organization_bio = Faker::Lorem.paragraphs(rand(1...5))
  country_code = Faker::Address.country_code
  address = generate_address
  contact_person = Faker::Name.name
  contact_email = email
  contact_number = Faker::PhoneNumber.cell_phone
  classification = industry_classifications[rand(0...industry_classifications.count)]
  employee_count = rand(1...100)
  site_url = "http://#{industry_name}." + Faker::Internet.domain_suffix
  fb_url = "https://facebook.com/" + industry_name
  linkedin_url = "https://linkedin.com/" + industry_name

  industry = Industry.create!(industry_name: industry_name,
                              organization_bio: organization_bio,
                              country_code:country_code,
                              address: address,
                              contact_person: contact_person,
                              contact_number: contact_number,
                              contact_email: email,
                              classification: classification,
                              employee_count: employee_count,
                              site_url: site_url,
                              fb_url: fb_url,
                              linkedin_url: linkedin_url)
end

# Academe Population #
5.times do |n|
  username = Faker::Lorem.word
  user_bio = Faker::Lorem.paragraphs(rand(1...5))
  user_type = user_types[rand(0...3)]
  id_number = rand(195000000...201799999).to_s
  contact_number = Faker::PhoneNumber.cell_phone
  address = generate_address
  fb_url = "https://facebook.com/" + username
  linkedin_url = "https://linkedin.com/" + username

  academe = Academe.create!(user_bio: user_bio,
                            user_type: user_type,
                            id_number: id_number,
                            contact_number: contact_number,
                            address: address,
                            fb_url: fb_url,
                            linkedin_url: linkedin_url)
end

# Admin User Population #
user = User.create!(first_name: "Admin",
                    last_name: "User",
                    email: "admin1@gmail.com",
                    password: "password",
                    password_confirmation: "password",
                    activated: true,
                    activated_at: Time.zone.now,
                    accounts_id: 1,
                    accounts_type:"Academe",
                    admin: true) if !User.find_by_email("admin1@gmail.com")

# User Population #
5.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "industry#{n}@gmail.com"

  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      email: email,
                      password: "password",
                      password_confirmation: "password",
                      activated: true,
                      activated_at: Time.zone.now,
                      accounts_id: n+1,
                      accounts_type: "Industry") if !User.find_by_email(email)
end

4.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "academe#{n}@gmail.com"

  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      email: email,
                      password: "password",
                      password_confirmation: "password",
                      activated: true,
                      activated_at: Time.zone.now,
                      accounts_id: n+2,
                      accounts_type: "Academe") if !User.find_by_email(email)
end

# IP Offer Population #
ip_offers_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-offers-seeds.csv'))
csv = CSV.parse(ip_offers_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  offer = User.find(rand(6...11)).ip_offers.build(
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
          :type => MIME::Types.type_for(document_path).first.content_type,
          )).tap do |offer|
            offer.tag_list.add("#{row['Tags']}", parse: true)
            offer.save if !IpOffer.find_by_title(row['Title'])
          end
end

ip_needs_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-needs-seeds.csv'))
csv = CSV.parse(ip_needs_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  need = User.find(rand(1...User.count+1)).ip_needs.build(
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
          :type => MIME::Types.type_for(document_path).first.content_type,
          )).tap do |need|
            need.tag_list.add("#{row['Tags']}", parse: true)
            need.save if !IpNeed.find_by_title(row['Title'])
          end
end

puts "Database population complete!"