class UsersController < ApplicationController
  def index #for general search by non-validated users
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @gift = @user.gifts

  end

  def create
  end

  def delete
  end

  def search #search by category or location
    
  end

end
