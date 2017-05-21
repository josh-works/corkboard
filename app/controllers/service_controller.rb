class ServiceController < ApplicationController

  def show
    @project = Project.new
  end

end
