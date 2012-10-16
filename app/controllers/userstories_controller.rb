class UserstoriesController < ApplicationController
  before_filter :parent

  def index
    @incomplete_userstories  = @project.incomplete_userstories
    @complete_userstories    = @project.complete_userstories
  end

  def new
    @userstory = Userstory.new
  end

  def create
    @userstory = Userstory.new(params[:userstory])
    if @userstory.save
      redirect_to @userstory.project
    else
      render 'new'
    end
  end

  def show
    @userstory = Userstory.find(params[:id])
  end

  def update
    @userstory = Userstory.find(params[:id])
    @userstory.update_attributes(params[:userstory])
    respond_to do |format|
      format.html { redirect_to userstories_path }
    end
  end

  def destroy
    @userstory = Userstory.find(params[:id])
    @userstory.destroy
    respond_to do |format| 
      format.html { redirect_to userstories_path }
    end
  end

  private

  def parent
    @project = Project.find(params[:project_id])
  end
end
