class ServiceController < ApplicationController

  def show
    @service = Service.find(params[:id])
    @project = Project.new
  end

end
