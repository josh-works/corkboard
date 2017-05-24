class ProDashboard::OpenProjectsController < ApplicationController
  def index
    @pro = Pro.find(current_user.id)
    @open_projects = @pro.open_projects
  end

  def show
    @bid = Bid.new
    @project = Project.find(params[:id])
  end
end
