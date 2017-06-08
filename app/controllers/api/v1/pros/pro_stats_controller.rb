class Api::V1::Pros::ProStatsController < ApplicationController
  # before_action :authenticate

  def index
    render json: Pro.highest_pro_radius
  end

  private

   def service_search
     params.permit(:name, :slug)
   end

  # protected
  #
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  # end

end
