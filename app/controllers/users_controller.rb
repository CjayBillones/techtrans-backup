class UsersController < ApplicationController
  include ApplicationHelper

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.where(activated: true)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path and return unless (@user.activated? or current_user.admin)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Succesfully updated profile!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Succesfully deleted user"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :middle_initial, :last_name, :email, 
                                  :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
