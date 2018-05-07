class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_name] = @user.name
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end
end
