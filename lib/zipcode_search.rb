# inspired by:
#   http://joshhuckabee.com/simple-zip-code-perimeter-search-rails,
#   http://iamtgc.com/implementing-zip-code-proximity-functions-in-mysql-and-postgresql/,
#   @zealoushacker
# ----------------------------------------------------------------------
# returns a collection of zip codes that are within the specified
# radius (in miles) of the given search zip code
# ----------------------------------------------------------------------
module ZipcodeSearch
  def zip_code_perimeter_search(zip, radius)
    #make sure we have valid parameters
    unless zip.blank? && radius.blank?
      #look up search zip_code in database
      zip_code = Zipcode.find_by_zipcode(zip)
      #make sure we found the zip code in the database first
      unless zip_code.nil?
        distance = %Q{
          3959.0 * acos(sin(#{zip_code.latitude} / 57.2958) *
          sin(latitude / 57.2958) + cos(#{zip_code.latitude}/ 57.2958) *
          cos(latitude / 57.2958) * cos((longitude / 57.2958) -
          (#{zip_code.longitude} / 57.2958)))
        }

        return Zipcode.select(
          "id",
          "zipcode",
          "latitude",
          "longitude",
          "#{distance} as \"distance\"")
          .where("#{distance} <= ?", radius)
          .order("#{distance} asc")
      end
    end
  end
end