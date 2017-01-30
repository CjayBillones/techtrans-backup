class AdminDashboardsController < ApplicationController

  def analytics
  end

  def manage_users
    @users = User.all
  end

  def manage_ips
    # Load Offers
    @offers = IpOffer.all
    @accepted_offers = IpOffer.where(approval_status: 'approved')
    @pending_offers = IpOffer.where(approval_status: 'pending')
    # Load Needs
    @needs = IpNeed.all
    @accepted_needs = IpNeed.where(approval_status: 'approved')
    @pending_needs = IpNeed.where(approval_status: 'pending')
    # Load All
    @ips = (@offers + @needs)
    @accepted_ips = (@accepted_offers + @accepted_needs)
    @pending_ips = (@pending_offers + @pending_needs)
  end

  def manage_articles
    @articles = Article.all.paginate(:page => params[:page], :per_page => 10)
  end

  def manage_resources
  end

end
