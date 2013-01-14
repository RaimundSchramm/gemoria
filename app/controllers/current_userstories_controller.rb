class CurrentUserstoriesController < ApplicationController

  def index
    @current  = Userstory.opened
    @recent   = Userstory.recent
  end
end
