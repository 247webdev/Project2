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

    if session[:user_id]
      # Creating a variable that can use the perimeter_search call, defined in Zipcode class (zipcode.rb)
      current_user = User.find_by_id(session[:user_id])
      zip = Zipcode.find_by_zipcode(current_user.zipcode)

    else
      zip = Zipcode.find_by_zipcode("66952") # 66952 is the geographic center of the USA. It is Lebanon, KS
    end

    # Getting all zipcodes within the user's, given some radius
    valid_locations = zip.perimeter_search(radius)

    # Getting all gifts based upon category
    results = Gift.where(category_id: category)

    # Removing any gifts related to the logged in user
    if session[:user_id]
      filtered_results = results.reject { |result| result.user_id == session[:user_id] }
    else
      filtered_results = results
    end

    # Now check the zipcode of each gift within results is also within the validLocations. Map that back to results and there are the gifts withing the user's radius search.
    users = filtered_results.map { |result| result.user}

    # zip codes within the user's searched radius
    location_zips = valid_locations.map { |item| item[:zipcode] }

    # select only users that are within the valid_lacations
    distant_users = users.select do |user| 
            location_zips.include?(user.zipcode)  
    end

    # remove any duplicate users in the results
    @users = distant_users.uniq
    binding.pry

  end

  private
  # Search function
  # def searchFunction(category, radius)
  #   if session[:user_id]

  #   end

  # end

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

