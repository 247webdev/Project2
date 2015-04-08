class SearchesController < ApplicationController
  # Search page
  def index
  end

  # Showing seach results
  def resultsShow
    category = category_converter params[:category].downcase
    radius   = params[:radius]
    @users = search_function(category, radius)
  end

  
  private
  def search_function(category, radius)
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
    end # :user_id conditional

    # Getting all zipcodes within a given radius
    valid_locations = zip.perimeter_search(radius)

    # Getting zipcodes from valid_locations array of hashes
    location_zips = valid_locations.map { |item| item[:zipcode] }

    # Selecting only users that are within the valid_lacations
    distant_users = users.select do |user| 
            location_zips.include?(user.zipcode)  
    end # users.select

    return distant_users.uniq
  end # search_function

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

  def search_params
    params.require(:search).permit(:category, :radius, :zipcode )
  end

end

