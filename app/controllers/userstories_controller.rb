class UserstoriesController < ApplicationController
  def index
    @userstories = Userstory.all
  end

  def new
    @userstory = Userstory.new
  end
end
