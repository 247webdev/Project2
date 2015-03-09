class UsersController < ApplicationController
  def index
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
end
