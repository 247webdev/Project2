class AccessController < ApplicationController
  before_action :prevent_login_signup, only: :landingpage
  # Landing page 
  def landingpage
  end

  # About page
  def about
  end

  # Login functionality
  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          session[:user_id] = found_user.id
          flash[:success] = "You are logged in"
          redirect_to user_path(id: found_user.id)
        else
          redirect_to :back, notice: "Incorrect email or password"
        end
      else
        redirect_to :back, notice: "Incorrect email or password"
      end
    else
      redirect_to :back, notice: "Please enter email and password."
    end
  end

  # Logout functionality
  def logout
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to landing_page_path
  end

  private 

  # Allowing necessary params for signup
  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end

end
