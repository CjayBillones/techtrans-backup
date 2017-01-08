class SubscriptionsController < ApplicationController
  def subscribe
    @user = User.find(params[:follower_id])
    followed_id = params[:followed_id]
    followed_type = params[:followed_type]
    @ip = (followed_type == "IpOffer") ? (IpOffer.find(followed_id)):(IpNeed.find(followed_id))
    @user.follow(@ip)
    redirect_to @ip

  end

  def unsubscribe
    @user = User.find(params[:follower_id])
    followed_id = params[:followed_id]
    followed_type = params[:followed_type]
    @ip = (followed_type == "IpOffer") ? (IpOffer.find(followed_id)):(IpNeed.find(followed_id))
    @user.stop_following(@ip)
    redirect_to @ip
  end
end
