module ApplicationHelper

  def is_number?(string)
    true if Integer(string) rescue false
  end

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

  def create_new_tags(tag_token)
    tag_ids = ""
    tags = tag_token.split(',')
    tags.each do |tag|
      tag_ids.concat(',') if !tag_ids.empty?
      if !is_number?(tag)
        t = Tag.create(name: tag)
        tag_ids.concat(t.id.to_s)
      else
        tag_ids.concat(tag)
      end
    end
    return tag_ids
  end

end
