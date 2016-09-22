class UsersController < ApplicationController

  # From application controller, preventing signed in users from creating another user
  before_action :prevent_login_signup, only: [:new, :create]
  
  # Ensuring users can only edit their own profiles
  before_action only: :edit do
    invalid_edit params[:id]
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
  end

  def show 
    @user = User.find(params[:id])
    @gift = @user.gifts
    @give = @gift.find_by(type_id: 1)
    @get = @gift.find_by(type_id: 2)
  end

  def create
    @user = User.new user_params
    create_user(@user, params[:uploadcare])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes user_params
    redirect_to user_path(@user)
  end

  def destroy
    User.destroy(session[:user_id])
    session[:user_id] = nil
    flash[:notice] = "You deleted your account."
    redirect_to landingpage_path
  end

  private
  def create_user(user, pic)
    user.gifts[0].type_id = 1
    user.gifts[0].type_id = 2
    user.update(profile_pic: pic)

    if user.save
      session[:user_id] = user.id
      flash[:success] = "Your profile was created"
      redirect_to search_path
    else
      user.destroy
      flash[:alert] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  # Whitelisting user params for user create
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :zipcode, :password, :password_digest, gifts_attributes: [:title, :description, :category_id])
  end

  # Ensuring users can only edit their profile
  def invalid_edit id
    if session[:user_id].to_s != id
      flash[:notice] = "You may only edit your user page"
      redirect_to '/'
    end
  end

end

