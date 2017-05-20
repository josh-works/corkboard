class IndustriesController < ApplicationController

  def show
    @industry = Industry.find(params[:industry_slug])
  end

end
