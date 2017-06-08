class MapDecorator < SimpleDelegator
  attr_accessor :pro_location

  def initialize(zip)
    @pro_location = Geokit::Geocoders::GoogleGeocoder.geocode(zip)
  end

end
