require 'csv'

# Tag Population Start #
puts "Populating tags..."
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
puts "Populating admin users..."
academe = Academe.create!(user_type: 'Superadmin',
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
                   approval_status: 'approved') if !User.find_by_email('iptechtransfer.upd@up.edu.ph')

# Article Population #
#puts "Populating articles..."
#articles_csv = File.read("#{Rails.root}/lib/seeds/articles.csv")
#csv = CSV.parse(articles_csv, :headers => true, :encoding => 'ISO-8859-1')
#csv.each do |row|
#  content_path = "#{Rails.root}/lib/seeds/articles/#{row['Content']}"
#  content_file = File.read(content_path)
#  image_path = "#{Rails.root}/lib/assets/images/#{row['Image']}"
#  image_file = File.new(image_path)
#  article = User.where(admin: true).first.articles.build(
#            title: row['Title'],
#            content: content_file,
#            banner_photo: ActionDispatch::Http::UploadedFile.new(
#              :filename => File.basename(image_file),
#              :tempfile => image_file,
#              :type => MIME::Types.type_for(image_path).first.content_type
#            )).tap do |article|
#              article.tag_list.add("#{row['Tags']}", parse: true)
#              article.save if !Article.find_by_title(row['Title'])
#            end
#end

# IP Population #
# Offers #
puts "Populating  offers..."
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
puts "Populating  needs..."
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
    ip.update!(approval_decision_at: Time.now) if !ip.approval_decision_at
  end
end

puts "Database population complete!"