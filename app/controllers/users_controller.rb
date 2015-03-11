class UsersController < ApplicationController
  def index #for general search by non-validated users
  end

  def new
    @user = User.new
    2.times do @user.gifts.new
    end
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
    @give = @gift.find_by(type_id: 1)
    @get = @gift.find_by(type_id: 2)

  end

  def create
    @user = User.new user_params
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

end

private
  def gift_params
    params.require(:gift).permit(:id, :title, :description )
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :zipcode,:password, :company, )
  end
