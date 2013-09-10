class OwnershipsController < ApplicationController

  before_filter :authenticate

  def index
    @ownerships = current_user.ownerships
  end

  def edit_multiple
    @projects = Project.all
  end

  def create_or_delete_multiple
    @projects = Project.find(params[:project_ids] || [])
    current_user.projects = @projects
    redirect_to ownerships_path
  end
end
