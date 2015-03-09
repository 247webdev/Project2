class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    @gift = @user.gifts
  end

  def show
    @user = User.find(params[:id])
    @gift = @user.gifts

  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes user_params
    redirect_to :back
  end
  def create
  end

  def delete
  end
end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :zipcode)
  end

