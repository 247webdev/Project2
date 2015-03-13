class GiftsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update_attributes gift_params
    redirect_to :back, notice: "Your gift was updated."    
  end

  def delete
  end

  def gift_params
    params.require(:gift).permit(:title, :description, :category_id)
  end
end