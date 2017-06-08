class Api::V1::Reviews::ReviewAllController < ApplicationController

  def index
    render json: Review.where(pro_id: params[:pro_id])
  end

end
