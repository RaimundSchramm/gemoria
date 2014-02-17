class UserstoriesController < ApplicationController

  before_action :authenticate,
                :parent

  def index
    @unaccepted_userstories = @project.userstories.sprint.unaccepted
    @accepted_userstories   = @project.userstories.sprint.accepted
    @backlog                = @project.backlog
    @done                   = @project.done
  end

  def new
    @userstory = @project.userstories.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @userstory = @project.userstories.new(userstory_params)
    respond_to do |format|
      if @userstory.save
        @backlog   = @project.backlog
        format.html { redirect_to @userstory.project }
        format.js
      else
        format.html { render 'new' }
      end
    end
  end

  def show
    @userstory                    = @project.userstories.find(params[:id])
    @incomplete_acceptance_tests  = @userstory.acceptance_tests.incomplete
    @complete_acceptance_tests    = @userstory.acceptance_tests.complete
    @incomplete_tasks             = @userstory.incomplete_tasks
    @complete_tasks               = @userstory.complete_tasks
  end

  def edit
    @userstory = @project.userstories.find(params[:id])
  end

  def update
    @userstory  = @project.userstories.find(params[:id])
    @old_status = @userstory.status
    respond_to do |format|
      if @userstory.update_attributes(userstory_params)
        @unaccepted_userstories   = @project.userstories.sprint.unaccepted
        @accepted_userstories     = @project.userstories.sprint.accepted
        @backlog                  = @project.backlog
        format.html { redirect_to project_userstory_path @project, @userstory }
        format.js
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @userstory = @project.userstories.find(params[:id])
    @userstory.destroy
    respond_to do |format| 
      format.html { redirect_to project_userstories_path @project }
    end
  end

  private

  def parent
    @project = Project.find(params[:project_id])
  end

  def userstory_params
    params.require(:userstory)
      .permit(
        :project_id,
        :category_id,
        :sprint_id,
        :description,
        :status,
        :position,
        :name,
        :complete)
  end
end
