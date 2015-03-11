require 'zipcode_search'

class SearchesController < ApplicationController

  def index
  end

  def results
    category = params[:category].downcase
    @radius = params[:radius]

    if (category == "time" || category == "service" || category == "money" || category == "object") && @radius
      redirect_to action: "resultsShow", category: category, radius: @radius
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
    category = category_converter params[:category]
    @radius = 15
    # this is the logged in user's zipcode, it is passed into the zip_code_perimeter_search as the foci zipcode

    # UNCOMMENT THIS ONCE SESSION login is complete
    # zip = User.find_by_id(session[:user_id]).zipcode
    zip = Zipcode.find_by_zipcode(User.find_by_id(1).zipcode) # this is test code until session[:user_id] is implemented. Comment this and uncomment above.

    valid_locations = zip.perimeter_search(@radius)
    # validLocations = :zip_code_perimeter_search(zip, @radius)
    
    # these are the gifts based on the category search
    results = Gift.where(category_id: category)

    # Now check the zipcode of each gift within results is also within the validLocations. Map that back to results and there are the gifts withing the user's radius search.

    # results.map { |item| valid_locations.include? item.user.zipcode }

    users = results.map  { |result| result.user}

    valid_locations.map! { |item| item[:zipcode] }

    @users = users.map { |item| valid_locations.include? item.zipcode }
  end

  private
  def category_converter param
    if param == "time"
      return 1
    elsif param == "service"
      return 2
    elsif param == "money"
      return 3
    elsif param == "object"
      return 4
    end
  end

end

