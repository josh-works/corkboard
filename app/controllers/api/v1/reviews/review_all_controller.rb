class Api::V1::Reviews::ReviewAllController < ApplicationController

  def index
    @raw_reviews = Review.where(pro_id: params[:pro_id])
  end

end
