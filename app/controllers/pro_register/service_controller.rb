class ProRegister::ServiceController < ApplicationController
  def index
    category = Category.find(params[:category_id])
    @services = category.services.all
  end
end
