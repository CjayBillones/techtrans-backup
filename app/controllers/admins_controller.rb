class AdminsController < ApplicationController
  include ApplicationHelper
  
  before_action :logged_in_user
  before_action :admin_user

  def approve_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'approved')
    end

    redirect_to admin_manage_ips_path()
  end

  def reject_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'rejected')
    end

    redirect_to admin_manage_ips_path()
  end

end
