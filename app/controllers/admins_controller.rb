class AdminsController < ApplicationController
  include ApplicationHelper
  
  before_action :logged_in_user
  before_action :admin_user

  def approve_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'approved', approval_decision_at: Time.now)
    end

    redirect_to admin_manage_ips_path()
  end

  def reject_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'rejected', approval_decision_at: Time.now)
    end

    redirect_to admin_manage_ips_path()
  end

  def approve_user
    
  end

  def reject_user
    
  end

  def reactivate_user
    user = User.find(params[:id])

    if user
      user.update!(activated: true)
    end

    redirect_to admin_manage_users_path()
  end

end
