class UsersController < ApplicationController

  before_action :prevent_login_signup, only: [:new, :create]
  # before_action :no_log_show, only: [:edit, :show]
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
    give = params[:user][:gifts_attributes]["0"]
    get = params[:user][:gifts_attributes]["1"]
    @give = @user.gifts.build(title: give[:title], description: give[:description], category: give[:category])
    @get = @user.gifts.build(title: get[:title], description: get[:description], category: get[:category])


    if @user.save && @give.save
      session[:user_id] = @user.id
      binding.pry
      @get.save
      redirect_to "/searches/index", notice: "Success, your profile was created."
    else
      @user.destroy
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_to controller: "users", action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes user_params
    redirect_to "/users/#{@user.id}"
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
    params.require(:user).permit(:id, :first_name, :last_name, :email, :zipcode, :password, :password_digest)
  end

  def give_params
    params.require(:user).permit(:gifts_attributes["0"])
  end

  def get_params
    params.require(:user).permit(:gifts_attributes["1"])
  end

  def invalid_edit id
    if session[:user_id].to_s != id
      flash[:notice] = "You may only edit your user page"
      redirect_to "/users/#{session[:user_id]}"
    end
  end

end

