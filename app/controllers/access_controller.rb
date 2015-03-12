class AccessController < ApplicationController

  before_action :prevent_login_signup, only: [:landingpage]

  def landingpage
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = found_user.id
          redirect_to "/users/#{found_user.id}", flash[:notice] = "You are logged in"
        else
          redirect_to :back, flash[:notice] = "Incorrect email or password"
        end
      else
        redirect_to :back, flash[:notice] = "Incorrect email or password"
      end
    else
      redirect_to :back, flash[:notice] = "Please enter email and password"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to "/"
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end

end
