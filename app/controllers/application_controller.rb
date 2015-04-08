class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Preventing signed in users from accessing the create user page
  def prevent_login_signup
    if session[:user_id]
      flash[:notice] = "Already logged in"
      redirect_to search_path
    end
  end

  # Preventing not signed in users from accessing show pages, edit pages
  def no_log_show
    if !session[:user_id]
      flash[:notice] = "Please log in or sign up!"
      redirect_to "/"
    end
  end
end
