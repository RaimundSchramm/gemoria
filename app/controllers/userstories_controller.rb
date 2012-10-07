class UserstoriesController < ApplicationController
  def index
    @incomplete_userstories  = Userstory.incomplete
    @complete_userstories    = Userstory.complete
  end

  def new
    @userstory = Userstory.new
  end

  def create
    @userstory = Userstory.new(params[:userstory])
    if @userstory.save
      redirect_to userstories_url
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
end
