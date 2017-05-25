class ProRegister::CategoryController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @services = @category.services.all
  end
  
end
