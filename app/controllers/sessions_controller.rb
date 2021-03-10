class SessionsController < ApplicationController
  before_action :send_home_if_logged_in, only: [:new]

  def index
  end

  def new
    @users = User.all
  end

  def create
    #catch it
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end