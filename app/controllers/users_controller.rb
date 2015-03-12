class UsersController < ApplicationController

  before_action :prevent_login_signup, only: [:new, :create]
  before_action :no_log_show, only: [:edit, :show]
  before_action only: :edit do
    invalid_edit params[:id]
  end

  def index #for general search by non-validated users
  end

  def new
    @user = User.new
    2.times do @user.gifts.new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @gift = @user.gifts
    @give = @gift.find_by(type_id: 1)
    @get = @gift.find_by(type_id: 2)

    # sort by type id
  end

  def show
    
    @user = User.find(params[:id])
    @gift = @user.gifts
    @give = @gift.find_by(type_id: 1)
    @get = @gift.find_by(type_id: 2)

  end

  def create
    @user = User.new user_params
    @user.update(profile_pic: params[:uploadcare])
    @give = params["user"]["gifts_attributes"]["0"]
    @get = params["user"]["gifts_attributes"]["1"]


    if @user.save

      newgive = @user.gifts.new
      newget = @user.gifts.new

      newgive.update(title: @give["title"])
      newgive.update(description: @give["description"])
      newgive.update(type_id: 1)
      newgive.update(category_id: @give["category_id"])
      newget.update(title: @get["title"])
      newget.update(description: @get["description"])
      newget.update(type_id: 2)
      newget.update(category_id: @get["category_id"])
      session[:user_id] = @user.id
      redirect_to "/searches/index", notice: "Success, your profile was created."
    else
      render "/users/new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes user_params
    redirect_to :back
  end

  def destroy
    User.destroy(session[:user_id])
    session[:user_id] = nil
    flash[:notice] = "You deleted your account."
    redirect_to "/"
  end

private

  def gift_params
    params.require(:gift).permit(:id, :title, :description )
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :zipcode, :password )
  end

  def invalid_edit id
    if session[:user_id].to_s != id
      flash[:notice] = "You may only edit your user page"
      redirect_to "/users/#{session[:user_id]}"
    end
  end

end

