class TasksController < ApplicationController

  before_action :authenticate,
                :find_userstory

  def index
    @incomplete_tasks = @userstory.incomplete_tasks
    @complete_tasks   = @userstory.complete_tasks
  end

  def new
    @task = @userstory.tasks.build
  end

  def create
    @task = @userstory.tasks.new(task_params)
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
      if @task.update_attributes!(task_params)
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

  def sort
    params[:task].each_with_index do |task_id, i|
      task = Task.find(task_id)
      task.update(number: i + 1)
    end

    @tasks = Task.find(params[:task])

    respond_to do |format|
      format.js {}
    end
  end

  private

  def find_userstory
    @userstory = Userstory.find(params[:userstory_id])
  end

  def task_params
    params.require(:task).permit(:userstory_id, :complete, :name, :number)
  end
end
