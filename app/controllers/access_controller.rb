class AccessController < ApplicationController
  def landingpage
  end

  def attempt_login
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end
end