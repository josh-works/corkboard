class Api::V1::Projects::ProjectStatsController < ApplicationController
  # before_action :authenticate

  def index
    render json: Project.most_bid_project
  end

  def show
    render json: Project.most_requested_project #(service_search)
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
