class SearchesController < ApplicationController

  def index
  end

  def results
    category = params[:category].downcase
    radius = params[:radius]

    if (category == "time" || category == "service" || category == "money" || category == "object") && radius
      redirect_to action: "resultsShow", category: category, radius: radius
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
    # the searched params
    category = category_converter params[:category]
    radius   = params[:radius]

    # Alex made this an instance of the Zipcode class which works for using the zip.perimeter_search call but, not needed from the approach of the data. Just need the zipcode of the user. I suppose it doesn't matter that it is an instance of the Zipcode class.
    # Working inward out, this is the logged in user's ID, then find the user by that id, then get their zipcode, then finally find the Zipcode by the zipcode. Like I said above, seems redundant but allows the search to be called on zip. Would like to refactor later.
    zip = Zipcode.find_by_zipcode(User.find_by_id(session[:user_id]).zipcode)

    #the array of zipcodes within the user's given radius
    valid_locations = zip.perimeter_search(radius) # works! NOTE gives array of hashed objects

    # these are the gifts based on the category search
    results = Gift.where(category_id: category) # works! NOTE gives array of hashed objects

    # remove any gifts related to the logged in user
    filtered_results = results.reject { |item| item.user_id == session[:user_id] }

    # Now check the zipcode of each gift within results is also within the validLocations. Map that back to results and there are the gifts withing the user's radius search.
    # results.map { |item| valid_locations.include? item.user.zipcode }

    users = filtered_results.map { |result| result.user}

    

    valid_locations.map { |item| item[:zipcode] }

    # @users = users.select { |item| valid_locations.include? item.zipcode }
    @users = users.select do |user| 
      valid_locations.each do |location|
        location.zipcode == user.zipcode 
      end
    end
    binding.pry
    # make sure to take out any gifts that belong to the logged in user before the 

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

