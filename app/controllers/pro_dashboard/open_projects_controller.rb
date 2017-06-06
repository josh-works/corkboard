class ProDashboard::OpenProjectsController < ApplicationController
  attr_accessor :to_bid_on
  def index
    @pro = Pro.find(current_user.id)  # MapDecorator.new(@pro.zipcode) <-- this ideally returns a @pro_location object via an attr_reader that i can use here to loop the .distance_to method against open proj zips... but the below method may usurp it
    @to_bid_on = @pro.open_projects.map do |open_project|
      distance = Geokit::Geocoders::GoogleGeocoder.geocode(@pro.zipcode).distance_to(open_project.zipcode)
      if distance < @pro.pro_service.radius.to_i
      end
    end
  end

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
end
