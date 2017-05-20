class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  protect_from_forgery with: :exception

  def current_user
      if session[:user_id]
        @current_user = User.find(session[:user_id])
      else
        @current_user = User.new(first_name: "Guest")
      end
    end

  def logged_in?
    session[:user_id]
  end

end
