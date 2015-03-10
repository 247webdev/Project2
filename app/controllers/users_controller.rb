class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @gift = @user.gifts

  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: 'Success, your profile was created.'
    else
      render :new
    end
  end

  def delete
  end
end
