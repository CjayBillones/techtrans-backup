class StaticPagesController < ApplicationController
  
  def home
    @ip_offers = IpOffer.all
    @ip_needs = IpNeed.all
  end

  def about
  end

  def expertise
  end

  def opportunities
  end

  def itso_ipophl
  end

  def resources
  end

end
