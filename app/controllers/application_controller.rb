class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def pro_user?
    current_user.pro?
  end

  def logged_in?
    session[:user_id]
  end

end
