class SprintsController < ApplicationController

  before_filter :find_parent
  before_filter :find_sprint

  def update
    @sprint.update_attributes(params[:sprint])
    redirect_to project_userstories_path
  end

  def complete
    @sprint.complete!
    redirect_to project_userstories_path
  end

  private

  def find_parent
    @project = Project.find params[:project_id]
  end

  def find_sprint
    @sprint = @project.sprints.find params[:id]
  end
end
