class Api::V1::Reviews::ReviewCountController < ApplicationController

  def show
    render json: Review.total_count
  end

end
