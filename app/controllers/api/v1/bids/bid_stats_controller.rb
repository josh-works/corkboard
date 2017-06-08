class Api::V1::Bids::BidStatsController < ApplicationController
  # before_action :authenticate

  def index
    render json: Bid.highest_revenue_service
  end

  def show
    render json: Bid.revenue_per_service #(service_search)
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
