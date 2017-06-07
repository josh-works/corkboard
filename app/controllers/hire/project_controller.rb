class Hire::ProjectController < ApplicationController

  def new
    @service = Service.find(params[:service])
    @project = Project.new
  end

  def create
    project = Project.create(zipcode:     params[:project][:zipcode],
                             recurring:   params[:project][:recurring],
                             description: params[:project][:description],
                             timeline:    params[:project][:timeline],
                             requester:   current_user,
                             service_id:  params[:project][:service_id])
    if params[:project][:attachments_attributes]
      project.attachments.create(upload: params[:project][:attachments_attributes]["0"][:upload])
    end

    redirect_to new_project_confirmation_path(project)
  end

  def confirmation
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    #code review?
    project = Project.find(params[:id])
    project.status = update_params[:status]
    project.save
    # redirect_to dashboard_path
    #flash message
  end

  private
  def update_params
    params.require(:project).permit(:status)
  end

end
