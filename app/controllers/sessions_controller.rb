class SessionsController < ApplicationController
  
  def new
  end

  def create
    email_or_username = params[:session][:email_or_username].downcase
    @user = User.find_by_email(email_or_username) || User.find_by_username(email_or_username)

    if @user && @user.authenticate(params[:session][:password])
      if @user.approved? && @user.activated?
        login @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or root_path
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to login_path
      end

    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_path
  end
end
