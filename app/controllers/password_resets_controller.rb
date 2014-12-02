class PasswordResetsController < ApplicationController

  skip_before_action :authenticate

  # GET password_resets/new
  def new
  end

  # POST password_resets
  def create
    user = User.where(email: params[:email]).first
    user.send_password_reset if user
    redirect_to root_url, notice: 'Email sent with password reset instructions.'
  end

  # GET password_resets/:id/edit
  def edit
    @user = User.where(password_reset_token: params[:id]).first
  end

  # PATCH password_resets/:id
  def update
    @user = User.where(password_reset_token: params[:id]).first
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: 'Password &crarr; reset has expired.'
    elsif @user.update_attributes(user_params)
      redirect_to root_url, notice: 'Password has been reset. Please log in.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
      .permit(
        :password,
        :password_confirmation)
  end
end
