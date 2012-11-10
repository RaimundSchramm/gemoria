class CurrentUserstoriesController < ApplicationController

  def index
    @current_userstories = Userstory.opened
  end
end
