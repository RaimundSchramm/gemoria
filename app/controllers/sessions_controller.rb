class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in.'
      redirect_to root_path
    else
      flash[:notice] = 'Wrong login.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out.'
  end
end
