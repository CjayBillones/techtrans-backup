module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "IP Technology Transfer Unit"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You do not have access rights on this page"
      redirect_to login_path
    end
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def academe_user
    redirect_to(root_path) unless (current_user.accounts.class == Academe)
  end

  def indstry_user
    redirect_to(root_path) unless (current_user.accounts.class == Industry)
  end

  def academe_user?
    return current_user.accounts.class == Academe
  end

  def industry_user?
    return current_user.accounts.class == Industry
  end

  def terms_of_agreement
    terms = File.read('public/terms/terms.txt')
  end

end
