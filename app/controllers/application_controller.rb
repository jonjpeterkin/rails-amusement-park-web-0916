class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_admin, :require_login
  helper_method :admin?, :logged_in?

  def current_user
  	session[:user_id] ? @user = User.find(session[:user_id]) : nil
  end

  def logged_in?
  	!!current_user
  end

  def require_login
  	redirect_to homepage_path unless logged_in?
  end

  def admin?
  	logged_in? && current_user.admin
  end

  def require_admin
  	redirect_to homepage_path unless admin?
  end
end
