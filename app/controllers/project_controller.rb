class ProjectController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def show
    @project = Project.first
  end
end
