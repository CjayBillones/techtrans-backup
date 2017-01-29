class AdminDashboardsController < ApplicationController

  def analytics
  end

  def manage_users
    @users = User.all
  end

  def manage_ips
    # Load Offers
    @offers = IpOffer.all.paginate(:page => params[:page], :per_page => 5)
    @accepted_offers = IpOffer.where(approval_status: 'approved').paginate(:page => params[:page], :per_page => 5)
    @pending_offers = IpOffer.where(approval_status: 'pending').paginate(:page => params[:page], :per_page => 5)
    # Load Needs
    @needs = IpNeed.all.paginate(:page => params[:page], :per_page => 5)
    @accepted_needs = IpNeed.where(approval_status: 'approved').paginate(:page => params[:page], :per_page => 5)
    @pending_needs = IpNeed.where(approval_status: 'pending').paginate(:page => params[:page], :per_page => 5)
    # Load All
    @ips = (@offers + @needs).paginate(:page => params[:page], :per_page => 5)
    @accepted_ips = (@accepted_offers + @accepted_needs).paginate(:page => params[:page], :per_page => 5)
    @pending_ips = (@pending_offers + @pending_needs).paginate(:page => params[:page], :per_page => 5)
  end

  def manage_articles
    @articles = Article.all.paginate(:page => params[:page], :per_page => 10)
  end

  def manage_resources
  end

end
