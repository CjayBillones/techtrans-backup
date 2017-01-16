class AdminDashboardsController < ApplicationController

  def analytics
  end

  def manage_users
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def manage_ips
  end

  def manage_articles
  end

  def manage_resources
  end

end
