class ApplicationController < ActionController::Base
  protect_from_forgery

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
end
