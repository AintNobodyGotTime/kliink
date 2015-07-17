class ProjectController < ApplicationController
  def index
  end

  def show
    @project = Project.first
  end
end
