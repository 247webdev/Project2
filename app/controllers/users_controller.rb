class UsersController < ApplicationController
  def index #for general search by non-validated users
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @gift = @user.gifts
    @give = @gift.find_by(type_id: 1)
    @get = @gift.find_by(type_id: 2)

    # sort by type id
  end

  def show
    @user = User.find(params[:id])
    @gift = @user.gifts

  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path, notice: 'Success, your profile was created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes user_params
    redirect_to :back
  end

  def delete
  end

  def search #search by category or location    
  end

end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :zipcode,:password, :company)
  end