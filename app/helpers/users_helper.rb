module UsersHelper

  def fullname(user)
    "#{user.first_name} #{user.last_name}"    
  end

  def user_status_icon(user)
    if user.approval_status == 'approved' and user.activated and !user.activated_at.nil?
      'fa-check'
    elsif user.approval_status == 'approved' and !user.activated and user.activated_at.nil?
      'fa-exclamation-triangle'
    elsif user.approval_status == 'approved' and !user.activated and !user.activated_at.nil?
      'fa-ban'
    elsif user.approval_status == 'pending'
      'fa-hourglass-half'
    else
      'fa-times'
    end
  end

  def user_status_text(user)
    if user.approval_status == 'approved' and user.activated and !user.activated_at.nil?
      'active'
    elsif user.approval_status == 'approved' and !user.activated and user.activated_at.nil?
      'pending activation'
    elsif user.approval_status == 'approved' and !user.activated and !user.activated_at.nil?
      'deactivated'
    elsif user.approval_status == 'pending'
      'pending approval'
    else
      'rejected'
    end    
  end

  def user_status_style(user)
    if user.approval_status == 'approved' and user.activated and !user.activated_at.nil?
      'color:green'
    elsif user.approval_status == 'approved' and !user.activated and user.activated_at.nil?
      'color:orange'
    elsif user.approval_status == 'approved' and !user.activated and !user.activated_at.nil?
      'color:red'
    elsif user.approval_status == 'pending'
      'color:black'
    else
      'color:red'
    end      
  end

  def user_type(user)
    if user.admin?
      'Admin'
    else
      (user.accounts.class == Academe) ? 'Academe' : 'Industry'
    end
  end

  def user_ip_submissions(user)
    offers = IpOffer.where(user_id: user.id)
    needs = IpNeed.where(user_id: user.id)
    return (offers + needs) if !offers.nil? and !needs.nil?
  end

end
