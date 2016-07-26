class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !@current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user?(user)
    @current_user == user
  end

  def login_redirect
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
