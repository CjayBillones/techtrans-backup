class IpOffersController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]  
  
  def index
    @ip_offers = IpOffer.all
  end

  def show
    @ip_offer = IpOffer.find(params[:id])
  end

  def new
    @ip_offer = IpOffer.new
  end

  def create
    @ip_offer = current_user.ip_offers.build(ip_offer_params)

    if @ip_offer.save
      flash[:success] = "Successfully created IP Offer!"
      redirect_to @ip_offer
    else
      render 'new'
    end
  end

  def edit
    @ip_offer = IpOffer.find(params[:id])
  end

  def update
    @ip_offer = IpOffer.find(params[:id])
  
    if @ip_offer.update_attributes(ip_offer_params)
      flash[:success] = "Sucessfully edited IP Offer!"
      redirect_to @ip_offer
    else
      render 'edit'
    end
  end

  def destroy
    @ip_offer = IpOffer.find(params[:id]).destroy
    flash[:success] = "Sucessfully deleted IP Offer"
    redirect_to ip_offers_path
  end

  private

    def ip_offer_params
      params.require(:ip_offer).permit(:title, :description)
    end

    def correct_user
      @ip_offer = IpOffer.find(params[:id])
      @user = User.find(@ip_offer.user_id)
      redirect_to(root_path) unless current_user?(@user)
    end    

end
