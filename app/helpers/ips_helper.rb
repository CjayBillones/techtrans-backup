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

  def ip_type_icon(ip)
    if ip.class ==IpOffer
      'fa-universal-access'
    else
      'fa-lightbulb-o'
    end
  end

  def ip_type_text(ip)
    if ip.class == IpOffer
      'Offer'
    else
      'Need'
    end
  end

  def ip_url_path(ip)
    if ip.class == IpOffer
      ip_offer_path(ip)
    else
      ip_need_path(ip)
    end
  end

end
