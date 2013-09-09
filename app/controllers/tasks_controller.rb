class TasksController < ApplicationController

  before_filter :authenticate
  before_filter :find_userstory

  def index
    @incomplete_tasks = @userstory.incomplete_tasks
    @complete_tasks   = @userstory.complete_tasks
  end

  def new
    @task = @userstory.tasks.build
  end

  def create
    @task = @userstory.tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to userstory_tasks_path(@userstory) }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def show
    @task = @userstory.tasks.find(params[:id])
  end

  def edit
    @task = @userstory.tasks.find(params[:id])
  end

  def update
    @task = @userstory.tasks.find(params[:id])
    respond_to do |format|
      if @task.update_attributes!(params[:task])
        format.html { redirect_to userstory_tasks_path(@userstory) }
        format.js
      else
        format.html { render 'edit' }
        format.js
      end
    end
  end

  def destroy
    @task = @userstory.tasks.destroy(params[:id]).first
    respond_to do |format|
      format.html { redirect_to userstory_tasks_path(@userstory) }
      format.js
    end
  end

  private

  def find_userstory
    @userstory = Userstory.find(params[:userstory_id])
  end
end
