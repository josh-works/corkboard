class Api::V1::Reviews::ReviewAverageController < ApplicationController

  def show
    require "pry"; binding.pry
    render json: Pro.find(params[:pro_id]).reviews.total_average(params[:pro_id])
  end

end
