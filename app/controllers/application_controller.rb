class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user, :logged_in?

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id != nil
  end

  def require_logged_in
    return redirect_to root_path unless logged_in?
  end

  def send_home_if_logged_in
    return redirect_to root_path if logged_in?
  end
end