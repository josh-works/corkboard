class Api::V1::Reviews::ReviewCountController < ApplicationController

  def show
    render json: Review.total_count(params[:pro_id])
  end

end
