class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_found? && user_authenticated?
      set_session
      redirect_to root_path
    else
      flash[:message] = "Failed to log in."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def user_found?
    @user = User.find_by(email: params[:user][:email])
  end

  def user_authenticated?
    @user.authenticate(params[:user][:password])
  end

  def set_session
    session[:user_id] = @user.id
  end
end
