class SprintsController < ApplicationController

  before_action :authenticate,
                :find_parent,
                :find_sprint

  def update
    @sprint.update_attributes(sprint_params)
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

  private

  def sprint_params
    params.require(:sprint).permit(:project_id, :complete)
  end
end
