module IpOffersHelper
  include ActsAsTaggableOn::TagsHelper
  
  def selPatentStatus
    @patent_status = ['Filed','Patented'] 
  end

  def selCategory
    @categories = ['Trademark', 'Copyright']
  end

end
