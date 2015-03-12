class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    #see if the user is logged in and if so redirect them back to home
  private

  def prevent_login_signup
    if session[:user_id]
      flash[:notice] = "Already logged in"
      redirect_to controller: "searches", action: "index"
    end
  end

  def no_log_show
    if !session[:user_id]
      flash[:notice] = "Please log in or sign up!"
      redirect_to "/"
    end
  end
end
