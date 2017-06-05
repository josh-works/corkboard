class ProDashboard::OpenProjectsController < ApplicationController
  attr_accessor :to_bid_on
  def index
    @pro = Pro.find(current_user.id)
    @pro_location = Geokit::Geocoders::GoogleGeocoder.geocode(@pro.zipcode)
    @open_projects = @pro.open_projects
    @to_bid_on = []

    @open_projects.each do |open_project|
      distance = @pro_location.distance_to(open_project.zipcode)
      require "pry"; binding.pry
      if distance < @pro.pro_service.radius.to_i
        @to_bid_on << open_project
      end
    end
  end

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
end
