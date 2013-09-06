class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Thank you for signing up.'
        format.html { redirect_to root_path }
      else
        format.html { render 'new' }
      end
    end
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :password, :password_confirmation)
  # end
end
