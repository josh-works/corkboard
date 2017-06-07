class Api::V1::Reviews::ReviewAverageController < ApplicationController

  def show
    render json: Review.total_average(params[:pro_id])
  end
  
end
