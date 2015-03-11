class AccessController < ApplicationController

  before_action :prevent_login_signup, only: [:signup, :login]

  def landingpage
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          render users_path, notice: "You are logged in."
        else
          redirect_to login_path, notice: "Incorrect password."
        end
      else
        redirect_to login_path, notice: "Incorrect email."
      end
    end
  end

  def logout
    redirect_to landingpage
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end

  #see if the user is logged in and if so redirect them back to home
  def prevent_login_signup
    if session[:user_id]
      redirect_to home_path
    end
  end

end
