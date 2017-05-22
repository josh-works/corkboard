class ProjectController < ApplicationController

  def create
    project = Project.create(zipcode:   params[:project][:zipcode],
                          recurring: params[:project][:recurring],
                          description: params[:project][:description],
                          timeline: params[:project][:timeline],
                          requester: current_user,
                          service_id: params[:project][:service_id]
                          )
    redirect_to new_project_confirmation_path(project)
  end

  def confirmation
    @project = Project.find(params[:id])
  end
end
