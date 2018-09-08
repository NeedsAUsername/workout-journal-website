class UsersController < ApplicationController

  def show
    if logged_in?
      @user = User.find(session[:user_id])
    else
      render 'static/index'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:message] = "Could not sign up"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
