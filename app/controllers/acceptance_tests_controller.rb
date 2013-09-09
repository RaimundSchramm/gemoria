class AcceptanceTestsController < ApplicationController

  before_filter :authenticate
  before_filter :find_userstory

  def index
    @incomplete_acceptance_tests = @userstory.acceptance_tests.incomplete
    @complete_acceptance_tests = @userstory.acceptance_tests.complete
  end

  def new
    @acceptance_test = @userstory.acceptance_tests.new
  end

  def create
    @acceptance_test = @userstory.acceptance_tests.new(params[:acceptance_test])
    respond_to do |format|
      if @acceptance_test.save
        format.html { redirect_to userstory_acceptance_tests_path(@userstory) }
        format.js
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
    @acceptance_test = @userstory.acceptance_tests.find(params[:id])
  end

  def update
    @acceptance_test = @userstory.acceptance_tests.find(params[:id])
    respond_to do |format|
      if @acceptance_test.update_attributes(params[:acceptance_test])
        format.html { redirect_to userstory_acceptance_tests_path(@userstory) }
        format.js
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @acceptance_test = @userstory.acceptance_tests.find(params[:id])
    @acceptance_test.destroy
    respond_to do |format|
      format.html { redirect_to userstory_acceptance_tests_path(@userstory) }
      format.js
    end
  end

  private

  def find_userstory
    @userstory = Userstory.find(params[:userstory_id])
  end
end