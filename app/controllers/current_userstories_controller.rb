class CurrentUserstoriesController < ApplicationController

  before_filter :authenticate

  def index
    @current  = Userstory.opened
    @recent   = Userstory.recent
  end
end
