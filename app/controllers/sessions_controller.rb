class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    return login_path unless @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to welcom_path
  end
end
