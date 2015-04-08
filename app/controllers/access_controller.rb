class AccessController < ApplicationController
  before_action :prevent_login_signup, only: :landingpage

  def landingpage
  end

  def about
  end

  def attempt_login
    login_function(params[:email], params[:password])
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to landing_page_path
  end

  private 
  def login_function(email, password)
    if email.present? && password.present?
      found_user = User.where(email: email).first
      if found_user
        authorized_user = found_user.authenticate(password)
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
  
  def user_params
    params.require(:user).permit(:email, :password, :password_digest)
  end

end
