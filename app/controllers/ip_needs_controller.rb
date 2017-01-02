class IpNeedsController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]  

  def index
    @ip_needs = IpNeed.all
  end

  def show
    @ip_need = IpNeed.find(params[:id])
    @user = User.find(@ip_need.user_id)
  end

  def new
    @ip_need = IpNeed.new
  end

  def create
    #render plain: params[:ip_need].inspect
    @ip_need = current_user.ip_needs.build(ip_need_params)

    if @ip_need.save
      flash[:success] = "Successfully created listing!"
      redirect_to @ip_need
    else
      render 'new'
    end    
  end

  def edit
    @ip_need = IpNeed.find(params[:id])
  end

  def update
    @ip_need = IpNeed.find(params[:id])
  
    if @ip_need.update_attributes(ip_need_params)
      flash[:success] = "Sucessfully updated listing!"
      redirect_to @ip_need
    else
      render 'edit'
    end    
  end

  def destroy
    @ip_need = IpNeed.find(params[:id]).destroy
    flash[:success] = "Succesfully deleted listing!"
    redirect_to ip_needs_path
  end

  private

    def ip_need_params
      params.require(:ip_need).permit(:title, :description, :features, :business_model,
                                      :privacy_option, :photo, :document, :tag_tokens)
    end

    def correct_user
      @ip_need = IpNeed.find(params[:id])
      @user = User.find(@ip_need.user_id)
      redirect_to(root_path) unless current_user?(@user)
    end 
end
