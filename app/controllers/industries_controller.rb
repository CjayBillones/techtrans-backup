class IndustriesController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
    @industry = Industry.new
  end

  def create
    @user = User.new(user_params)
    @industry = Industry.new(industry_params)

    if @industry.save
      @user.accounts_type = @industry.class.name
      @user.accounts_id = @industry.id
      if @user.save
        # login @user # Login user upon signup
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to login_path
      else
        @industry.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
    @industry = Industry.find(params[:id])
    @user = @industry.user
  end

  def update
    @industry = Industry.find(params[:id])
    @user = @industry.user
    
    if @user.update_attributes(user_params) && @industry.update_attributes(industry_params)
      flash[:success] = "Succesfully updated profile!"
      redirect_to @user      
    else
      render 'edit'
    end
  end

  def destroy
    
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, 
                                  :password, :password_confirmation)
    end

    def industry_params
      params.require(:industry).permit(:industry_name, :classification, :organization_bio,
                                      :country_code, :address, :site_url, :fb_url, :linkedin_url, 
                                      :contact_person, :designation, :contact_email, :contact_number, 
                                      :terms)
    end

    def correct_user
      @industry = Industry.find(params[:id])
      @user = @industry.user
      redirect_to(root_path) unless current_user?(@user)
    end

end
