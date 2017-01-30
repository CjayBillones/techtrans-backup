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
      'color:yellow'
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

end
