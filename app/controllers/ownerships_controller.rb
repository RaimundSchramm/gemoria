class OwnershipsController < ApplicationController

  before_action :authenticate

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

  def edit
    @ownership = Ownership.find(params[:id])
  end

  def update
    @ownership = Ownership.find(params[:id])

    if @ownership.update(ownership_params)
      redirect_to ownerships_path
    else
      render 'edit'
    end
  end

  private

  def project_and_user_params
    params.require(:project_ids)
  end

  def ownership_params
    params.require(:ownership).permit(:role_id)
  end
end
