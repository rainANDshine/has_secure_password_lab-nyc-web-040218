class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    return login_path unless @user && @user.authenticate(params[:password])
    byebug
    session[:user_id] = @user.id
    redirect_to welcome_path
  end
end
