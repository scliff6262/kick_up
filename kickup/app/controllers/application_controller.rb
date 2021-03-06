class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def login_user
    session[:user_id] = @user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    unless !!current_user
      redirect_to root_path
    end
  end
end
