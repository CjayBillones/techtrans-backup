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

# IP Population #
# Offers #
=begin
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
  need = User.find(rand(1...User.count+1)).ip_needs.build(
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
=end

puts "Database population complete!"