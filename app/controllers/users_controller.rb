class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to new_path
    else
      User.create(user_params)
      redirect_to login_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
