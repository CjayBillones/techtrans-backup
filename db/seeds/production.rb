require 'csv'

# Tag Population Start #
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

# Admin Population #
academe = Academe.create!(user_type: 'Researcher',
                          id_number: '0000-00000')

user = User.create(first_name: 'System',
                   last_name: 'Administrator',
                   username: 'iptechtransfer.upd',
                   email: 'iptechtransfer.upd@up.edu.ph',
                   password: 'techadmin2k16',
                   password_confirmation: 'techadmin2k16',
                   activated: true,
                   activated_at: Time.zone.now,
                   accounts_id: 1,
                   accounts_type: 'Academe',
                   admin: true,
                   admin_type: 'superadmin',
                   approval_status: 'approved') if !User.find_by_email('techadmin@up.edu.ph')

# Industry Population #
50.times do |n|
  email = "industry#{n}@gmail.com"
  industry_name = Faker::Company.name
  organization_bio = Faker::Lorem.paragraphs(rand(1...5)).join("\n\n")
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
                              designation: 'VP for External Relations',
                              contact_number: contact_number,
                              contact_email: email,
                              classification: classification,
                              employee_count: employee_count,
                              site_url: site_url,
                              fb_url: fb_url,
                              linkedin_url: linkedin_url)
end

# Academe Population #
50.times do |n|
  username = Faker::Lorem.word
  user_bio = Faker::Lorem.paragraphs(rand(1...5)).join("\n\n")
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

activated = [true, false]
approval_status = ['approved', 'pending', 'rejected']

# User Population #
50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "industry#{n}@gmail.com"

  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      username: "industry#{n}",
                      email: email,
                      password: "password",
                      password_confirmation: "password",
                      activated: activated[rand(0...2)],
                      approval_status: approval_status[rand(0...3)],
                      activated_at: Time.zone.now,
                      accounts_id: n+1,
                      accounts_type: "Industry") if !User.find_by_email(email)
end

50.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "academe#{n}@gmail.com"

  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      username: "academe#{n}",
                      email: email,
                      password: "password",
                      password_confirmation: "password",
                      activated: activated[rand(0...2)],
                      approval_status: approval_status[rand(0...3)],
                      activated_at: Time.zone.now,
                      accounts_id: n+2,
                      accounts_type: "Academe") if !User.find_by_email(email)
end

# Article Population #

articles_csv = File.read("#{Rails.root}/lib/seeds/articles.csv")
csv = CSV.parse(articles_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  content_path = "#{Rails.root}/lib/seeds/articles/#{row['Content']}"
  content_file = File.read(content_path)
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  article = User.where(admin: true).first.articles.build(
            title: row['Title'],
            content: content_file,
            banner_photo: ActionDispatch::Http::UploadedFile.new(
              :filename => File.basename(image_file),
              :tempfile => image_file,
              :type => MIME::Types.type_for(image_path).first.content_type
            )).tap do |article|
              article.tag_list.add("#{row['Tags']}", parse: true)
              article.save if !Article.find_by_title(row['Title'])
            end
end


# IP Population #
# Offers #
ip_offers_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-offers-seeds.csv'))
csv = CSV.parse(ip_offers_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  offer = User.first.ip_offers.build(
          title: row['Title'], 
          subtitle: row['Subtitle'],
          overview: row['Overview'],
          key_features: row['Key Features'],
          applications: row['Applications'],
          customer_edge: row['Customer Edge'],
          market_opportunity: row['Market Opportunity'],
          inventors: row['Inventors'],
          approval_status: 'approved',
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

# Needs #
ip_needs_csv = File.read(Rails.root.join('lib', 'seeds', 'ip-needs-seeds.csv'))
csv = CSV.parse(ip_needs_csv, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
  image_file = File.new(image_path)
  document_path = "#{Rails.root}/lib/assets/documents/#{row['Document']}"
  document_file = File.new(document_path)
  need = User.first.ip_needs.build(
          title: row['Title'], 
          description: row['Description'],
          features: row['Features'],
          business_model: row['Business Model'],
          approval_status: 'approved',
          privacy_option: 'public',
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

needs = IpNeed.all
offers = IpOffer.all
ips = needs + offers

if !ips.nil?
  ips.each do |ip|
    ip.update!(approval_decision_at: Time.now)
  end
end

puts "Database population complete!"