class AdminsController < ApplicationController

  def approve_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'approved')
    end

    redirect_to admin_manage_ips_path()
  end

end
