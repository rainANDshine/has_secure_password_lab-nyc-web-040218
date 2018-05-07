class SessionsController < ApplicationController
  def new
  end

  # def create
  #   byebug
  #   @user = User.find_by(name: params[:name])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to welcome_path
  #   else
  #     redirect_to login_path
  #   end
  # end

  def create
   user = User.find_by(name: params[:name])

   user = user.try(:authenticate, params[:password])

   return redirect_to(controller: 'sessions', action: 'new') unless user

   session[:user_id] = user.id

   #@user = user

   redirect_to controller: 'welcome', action: 'show'
 end

end
