class ProRegister::CategoryController < ApplicationController
  def index
    industry = Industry.find(params[:industry_id])
    @categories = industry.categories.all
  end

  def show
    @category = Category.find(params[:id])
    @services = @category.services.all
  end

end
