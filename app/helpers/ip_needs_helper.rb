module IpNeedsHelper
  include ActsAsTaggableOn::TagsHelper

  def selPrivacyOptions
    @patent_status = ['Private', 'Public'] 
  end

end
