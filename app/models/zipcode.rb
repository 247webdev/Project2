class Zipcode < ActiveRecord::Base
  def perimeter_search(radius)
    unless radius.blank?
      distance = %Q{
        3959.0 * acos(sin(#{latitude} / 57.2958) *
        sin(latitude / 57.2958) + cos(#{latitude}/ 57.2958) *
        cos(latitude / 57.2958) * cos((longitude / 57.2958) -
        (#{longitude} / 57.2958)))
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