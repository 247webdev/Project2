class SearchesController < ApplicationController

  def index
    if params[:category] != nil #("Time" || "Service" || "Money" || "Object")
      flash.now[:notice] = "Please enter a valid search term. (Your options are Time, Service, Money or Object.)"
      render :index
    else 
      redirect_to 'searches/results'
    end
  end

  def results
    binding.pry

    # if params[:category] === "" && params[:location] === "" #if no search fields are entered 
    #  flash[:notice] === "Please enter a search term"

    # elsif (params[:category] === "" && params[:location] === "#{params[:location]}") #if location only is entered 
    #   @users === User.where(@user.location === params[:location])

    # elsif (params[:category] === "#{params[:category]}" && params[:location] === "") #if category only is entered 
    #   @users === User.where(category === params[:category])

    # else (params[:category] === "#{params[:category]}" && params[:location] === "#{params[:location]}")
    #   @users === User.where(location === params[:location] && category === params[:category])

    # end
  end

end

