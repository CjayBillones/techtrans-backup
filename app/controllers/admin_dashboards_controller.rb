class AdminDashboardsController < ApplicationController

  def analytics
  end

  def manage_users
    @users = User.all
  end

  def manage_ips
    offers = IpOffer.all
    needs = IpNeed.all
    @ips = (offers + needs).paginate(:page => params[:page], :per_page => 10)
  end

  def manage_articles
    @articles = Article.all.paginate(:page => params[:page], :per_page => 10)
  end

  def manage_resources
  end

end
