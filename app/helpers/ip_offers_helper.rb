module IpOffersHelper
  include ActsAsTaggableOn::TagsHelper
  
  def selPatentStatus
    @patent_status = ['Not Patented', 'Processing Patent','Patented'] 
  end

end
