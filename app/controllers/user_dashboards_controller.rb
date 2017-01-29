class UserDashboardsController < ApplicationController

  def index
    if params[:tag]
      offers = IpOffer.tagged_with(params[:tag])
      needs = IpNeed.tagged_with(params[:tag])
      @ips = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
    else
      offers = IpOffer.all
      needs = IpNeed.all
      @ips = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def view_ips
    if params[:tag]
      offers = IpOffer.tagged_with(params[:tag])
      needs = IpNeed.tagged_with(params[:tag])
      @ips = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
    else
      offers = IpOffer.all
      needs = IpNeed.all
      @ips = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
    end    
  end

  def manage_submissions
    offers = current_user.ip_offers
    needs = current_user.ip_needs
    @ip_submissions = (offers + needs).sort_by(&:created_at).reverse.paginate(:page => params[:page], :per_page => 10)
  end

  def manage_subscriptions
    @ip_subscriptions = []
    current_user.all_follows.each do |f|
      if f.followable_type == "IpOffer"
        @ip_subscriptions.push(IpOffer.find(f.followable_id))
      else
        @ip_subscriptions.push(IpNeed.find(f.followable_id))
      end
    end
  end

end
