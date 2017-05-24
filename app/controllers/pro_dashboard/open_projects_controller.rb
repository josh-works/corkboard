class ProDashboard::OpenProjectsController < ApplicationController
  def index
    @pro = Pro.find(current_user.id)
    @open_projects = @pro.open_projects
  end
end
