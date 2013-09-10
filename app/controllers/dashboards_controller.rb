class DashboardsController < ApplicationController

  before_filter :authenticate

  def show
    @owned_projects = current_user.projects
  end
end