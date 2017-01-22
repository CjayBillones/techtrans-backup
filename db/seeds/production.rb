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

puts "Database population complete!"