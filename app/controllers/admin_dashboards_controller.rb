class AdminDashboardsController < ApplicationController
  include ApplicationHelper
  
  before_action :logged_in_user
  before_action :admin_user

  def analytics
  end

  def manage_users
    @users = User.all
    @approved_users = User.where(approval_status: 'approved', activated: true).where.not(activated_at: nil)
    @pending_activation_users = User.where(activated: false, activated_at: nil)
    @pending_approval_users = User.where(approval_status: 'pending')
    @deactivated_users = User.where(approval_status: 'approved', activated: false).where.not(activated_at: nil)
    @rejected_users = User.where(approval_status: 'rejected')

    @admin_users = User.where(admin: true)
    @approved_admin_users = User.where(admin: true, approval_status: 'approved', activated: true).where.not(activated_at: nil)
    @pending_activation_admin_users = User.where(admin: true, activated: false, activated_at: nil)
    @pending_approval_admin_users = User.where(admin: true, approval_status: 'pending')
    @deactivated_admin_users = User.where(admin: true, approval_status: 'approved', activated: false).where.not(activated_at: nil)
    @rejected_admin_users = User.where(admin: true, approval_status: 'rejected')

    @academe_users = User.where(accounts_type: "Academe", admin: false, )
    @approved_academe_users = User.where(accounts_type: "Academe", admin: false, approval_status: 'approved', activated: true).where.not(activated_at: nil)
    @pending_activation_academe_users = User.where(accounts_type: "Academe", admin: false, activated: false, activated_at: nil)
    @pending_approval_academe_users = User.where(accounts_type: "Academe", admin: false, approval_status: 'pending')
    @deactivated_academe_users = User.where(accounts_type: "Academe", admin: false, approval_status: 'approved', activated: false).where.not(activated_at: nil)
    @rejected_academe_users = User.where(accounts_type: "Academe", admin: false, approval_status: 'rejected')

    @industry_users = User.where(accounts_type: "Industry", admin: false,)
    @approved_industry_users = User.where(accounts_type: "Industry", admin: false, approval_status: 'approved', activated: true).where.not(activated_at: nil)
    @pending_activation_industry_users = User.where(accounts_type: "Industry", admin: false, activated: false, activated_at: nil)
    @pending_approval_industry_users = User.where(accounts_type: "Industry", approval_status: 'pending')
    @deactivated_industry_users = User.where(accounts_type: "Industry", admin: false, approval_status: 'approved', activated: false).where.not(activated_at: nil)
    @rejected_industry_users = User.where(accounts_type: "Industry", admin: false, approval_status: 'rejected')
  end

  def manage_ips
    # Load Offers
    @offers = IpOffer.all
    @accepted_offers = IpOffer.where(approval_status: 'approved')
    @pending_offers = IpOffer.where(approval_status: 'pending')
    @rejected_offers = IpOffer.where(approval_status: 'rejected')
    # Load Needs
    @needs = IpNeed.all
    @accepted_needs = IpNeed.where(approval_status: 'approved')
    @pending_needs = IpNeed.where(approval_status: 'pending')
    @rejected_needs = IpNeed.where(approval_status: 'rejected')
    # Load All
    @ips = (@offers + @needs)
    @accepted_ips = (@accepted_offers + @accepted_needs)
    @pending_ips = (@pending_offers + @pending_needs)
    @rejected_ips = (@rejected_offers + @rejected_needs)
  end

  def manage_articles
    @featured_article = Article.where(featured: true).first
    @articles = Article.all
  end

  def manage_resources
  end

end
