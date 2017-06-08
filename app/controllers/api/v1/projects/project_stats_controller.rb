class Api::V1::Projects::ProjectStatsController < ApplicationController
  # before_action :authenticate
  before_filter :restrict_access
  respond_to? :json
  # http_basic_authenticate_with name: "admin", password: "admin"

  def index
    render json: Project.most_bid_project
  end

  def show
    render json: Project.most_requested_project
  end

  private

    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end

end
