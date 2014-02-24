class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :authorize, :authenticate

  delegate :allow?, to: :current_permission
  helper_method :allow?

  private

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  # def logged_in?
  #   return false unless current_user
  #   return true
  # end
  # helper_method :logged_in?

  def authenticate
    unless current_user
      redirect_to login_path, alert: 'You are not authenticated to view this page. Please log in or sign up at first.'
    end
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize
    unless current_permission.allow?(params[:controller], params[:action])
      redirect_to root_path, alert: 'Not authorized'
    end
  end
end
