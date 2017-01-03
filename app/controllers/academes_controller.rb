class AcademesController < ApplicationController
  include ApplicationHelper
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
    @academe = Academe.new
  end

  def create
    @user = User.new(user_params)
    @academe = Academe.new(academe_params)

    if @academe.save
      @user.accounts_type = @academe.class.name
      @user.accounts_id = @academe.id
      if @user.save
        # login @user # Login user upon signup
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to login_path
      else
        @academe.destroy
        render 'new'
      end
    else
      puts @academe.errors.full_messages
      render 'new'
    end    
  end

  def edit
    @academe = Academe.find(params[:id])
    @user = @academe.user
  end

  def update
    @academe = Academe.find(params[:id])
    @user = @academe.user

    if @user.update_attributes(user_params) && @academe.update_attributes(academe_params)
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
      params.require(:user).permit(:first_name, :middle_initial, :last_name, :email, 
                                  :password, :password_confirmation)
    end

    def academe_params
      params.require(:academe).permit(:user_type, :user_bio, :id_number, :contact_number, :address, 
                                      :fb_url, :linkedin_url, :terms)
    end

    def correct_user
      @academe = Academe.find(params[:id])
      @user = @academe.user
      redirect_to(root_path) unless current_user?(@user)
    end 

end
