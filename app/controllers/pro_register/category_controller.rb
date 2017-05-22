class ProRegister::CategoryController < ApplicationController
  def index
    industry = Industry.find(params[:industry_id])
    @categories = industry.categories.all
  end
end
