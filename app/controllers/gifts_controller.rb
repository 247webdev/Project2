class GiftsController < ApplicationController

  # Update functionality for gifts (See lower two forms on user edit page)
  def update
    @gift = Gift.find(params[:id])
    @gift.update_attributes gift_params
    redirect_to :back, notice: "Your gift was updated."    
  end

  # Whitelisting parameters for editing gifts
  def gift_params
    params.require(:gift).permit(:title, :description, :category_id)
  end
end