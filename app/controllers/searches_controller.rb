class SearchesController < ApplicationController

  before_action :default_values_for_not_signed_in, only: [:results]

  def index
  end

  def results
    category = params[:category].downcase
    radius = params[:radius]

    if (category == "time" || category == "service" || category == "money" || category == "object") && radius
      redirect_to action: "resultsShow", category: category, radius: radius
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

    if session[:user_id]

      # Alex made this an instance of the Zipcode class which works for using the zip.perimeter_search call but, not needed from the approach of the data. Just need the zipcode of the user. I suppose it doesn't matter that it is an instance of the Zipcode class.
      # Describing this inward out, this is the logged in user's ID, then find the user by that id, then get their zipcode, then finally find the Zipcode by the zipcode. Like I said above, seems redundant but allows the search to be called on zip. Would like to refactor later.
      zip = Zipcode.find_by_zipcode(User.find_by_id(session[:user_id]).zipcode)

    else
      zip = Zipcode.find_by_zipcode("66952") # 66952 is the geographic center of the USA. It is Lebanon, KS

    end

    # the array of zipcodes within the user's given radius
    valid_locations = zip.perimeter_search(radius) # works! NOTE gives array of hashed objects

    # these are the gifts based on the category search
    results = Gift.where(category_id: category) # works! NOTE gives array of hashed objects

    # remove any gifts related to the logged in user
    if session[:user_id]
      filtered_results = results.reject { |item| item.user_id == session[:user_id] }
    else
      filtered_results = results
    end

    # Now check the zipcode of each gift within results is also within the validLocations. Map that back to results and there are the gifts withing the user's radius search.
    users = filtered_results.map { |result| result.user}

    # zip codes within the user's searched radius
    valid_locations.map { |item| item[:zipcode] }

    # select only users that are within the valid_lacations
    users = users.select do |user| 
            valid_locations.each do |location|
              location.zipcode == user.zipcode 
            end
          end

    # remove any duplicate users in the results
    @users = users.uniq


# this is for all encoumpassing search results. no category and all territories
# radius = 7000 # large radius to include all territory

# results = Gift.where(category_id: category) # these are the gifts based on the category search




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

  def default_values_for_not_signed_in
  end

  def search_params
    params.require(:search).permit(:category, :radius, :zipcode )
  end

end

