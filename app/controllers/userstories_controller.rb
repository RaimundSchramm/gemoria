class UserstoriesController < ApplicationController
  before_filter :parent

  def index
    @incomplete_userstories  = @project.incomplete_userstories
    @complete_userstories    = @project.complete_userstories
    @backlog = @project.backlog
  end

  def new
    @userstory = @project.userstories.new
  end

  def create
    @userstory = @project.userstories.new(params[:userstory])
    respond_to do |format|
      if @userstory.save
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
    @userstory = @project.userstories.find(params[:id])
    if @userstory.update_attributes(params[:userstory])
      redirect_to project_userstories_path @project
    else
      render 'edit'
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
end
