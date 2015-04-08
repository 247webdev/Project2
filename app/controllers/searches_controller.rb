class SearchesController < ApplicationController
  # Search page
  def index
  end

  # Search redirect to 
  def results
    category = params[:category].downcase
    radius = params[:radius]
    if (category == "time" || category == "service" || category == "money" || category == "object") && radius
      redirect_to action: "resultsShow", category: category, radius: radius
    else
      flash.now[:notice] = "Please enter a valid search term. (Your options are Time, Service, Money or Object.)"
      render :index
    end
  end

  # Showing seach results
  def resultsShow

    # the searched params
    category = category_converter params[:category]
    radius   = params[:radius]
    @users = searchFunction(category, radius)

  end

  private
  
  def searchFunction(category, radius)
    # Getting all gifts based upon category
    results = Gift.where(category_id: category)

    # Removing any gifts related to the logged in user
    if session[:user_id]
      filtered_results = results.reject { |result| result.user_id == session[:user_id] }
    else
      filtered_results = results
    end

    # Grabbing users of gifts
    users = filtered_results.map { |result| result.user}

    if session[:user_id]
      # Creating a variable that can use the perimeter_search call, defined in Zipcode class (zipcode.rb)
      current_user = User.find_by_id(session[:user_id])
      zip = Zipcode.find_by_zipcode(current_user.zipcode)

    else
      zip = Zipcode.find_by_zipcode("66952") # 66952 is the geographic center of the USA. It is Lebanon, KS
    end

    # Getting all zipcodes within a given radius
    valid_locations = zip.perimeter_search(radius)

    # Getting zipcodes from valid_locations array of hashes
    location_zips = valid_locations.map { |item| item[:zipcode] }

    # Selecting only users that are within the valid_lacations
    distant_users = users.select do |user| 
            location_zips.include?(user.zipcode)  
    end

    return distant_users.uniq

  end

  # Helper function for converting user friendly paramaters to data friendly stored integer representation
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

  # Whitelisting parameters for search
  def search_params
    params.require(:search).permit(:category, :radius, :zipcode )
  end

end

