class SearchesController < ApplicationController

  def index
  end

  def results
    category = params[:category].downcase

    if category == "time" || category == "service" || category == "money" || category == "object"
      redirect_to action: "resultsShow", category: category
      # redirect_to "/searches/results/#{params[:category]}"
    else
      flash.now[:notice] = "Please enter a valid search term. (Your options are Time, Service, Money or Object.)"
      render :index

    end

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

  def resultsShow
    category = categoryConverter params[:category]

    results = Gift.where(category_id: category)
    
    binding.pry
  end

  private
  def categoryConverter param
    if param == "service"
      return 1
    elsif param == "time"
      return 2
    elsif param == "money"
      return 3
    elsif param == "object"
      return 4
    end
  end

end

