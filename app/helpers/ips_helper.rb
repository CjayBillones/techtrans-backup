module IpsHelper

  def status_icon(ip)
    if ip.approval_status == 'approved'
      'fa-check'
    elsif ip.approval_status == 'pending'
      'fa-hourglass-half'
    else
      'fa-times'
    end 
  end

  def status_style(ip)
    if ip.approval_status == 'approved'
      'color:green'
    elsif ip.approval_status == 'pending'
      'color:black'
    else
      'color:red'
    end 
  end

  def status_text(ip)
    if ip.approval_status == 'approved'
      'approved'
    elsif ip.approval_status == 'pending'
      'pending'
    else
      'rejected'
    end     
  end

  def ip_poster(ip)
    User.find(ip.user_id)
  end

  def get_ip(ip_type, id)
    (ip_type == "IpOffer") ? IpOffer.find(id) : IpNeed.find(id)
  end

  def ip_type(ip)
    (ip.class == IpOffer) ? 'Offer' : 'Need'
  end

  def ip_type_icon(ip)
    (ip.class == IpOffer) ? 'fa-universal-access' : 'fa-lightbulb-o'
  end

  def ip_type_text(ip)
    (ip.class == IpOffer) ? 'Offer' : 'Need'
  end

  def ip_url_path(ip)
    (ip.class == IpOffer) ? ip_offer_path(ip) : ip_need_path(ip)
  end

end
