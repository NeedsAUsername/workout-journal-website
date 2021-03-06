class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    if !logged_in?
      flash[:message] = 'You must be logged in to continue.'
      redirect_to root_path
    else
      @user = current_user
    end
  end

  def root_if_logged_in
    if logged_in?
      redirect_to root_path
    end
  end


end
