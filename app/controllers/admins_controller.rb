class AdminsController < ApplicationController
  include ApplicationHelper
  include AdminsHelper
  
  before_action :logged_in_user
  before_action :admin_user

  def approve_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'approved', approval_decision_at: Time.now)
    end

    redirect_to admin_manage_ips_path
  end

  def reject_ip
    ip = (params[:ip_type] == 'IpOffer') ? IpOffer.find(params[:id]) : IpNeed.find(params[:id])
    
    if ip
      ip.update!(approval_status: 'rejected', approval_decision_at: Time.now)
    end

    redirect_to admin_manage_ips_path
  end

  def approve_user
    user = User.find(params[:id])

    if user
      user.update!(approval_status: 'approved')
      user.resend_activation_email
    end

    redirect_to admin_manage_users_path
  end

  def reject_user
    user = User.find(params[:id])

    if user
      user.update!(approval_status: 'rejected')
    end
    redirect_to admin_manage_users_path
  end

  def reactivate_user
    user = User.find(params[:id])

    if user
      user.update!(activated: true)
    end

    redirect_to admin_manage_users_path
  end

  def resend_activation_link
    user = User.find(params[:id])

    if user
      user.resend_activation_email
    end

    redirect_to admin_manage_users_path
  end

  def grant_admin_access

    user_ids = params[:academe_user_tokens].split(',')
    
    if user_ids
      user_ids.each do |id|
        User.find(id).update!(admin: true)
      end
    end

    redirect_to :back
  end

  def revoke_admin_access
    user = User.find(params[:id])

    if user
      user.update!(admin: false)
    end

    redirect_to admin_manage_users_path
  end

end
