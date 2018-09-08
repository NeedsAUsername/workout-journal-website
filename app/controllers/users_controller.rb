class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def show
    @user = User.find(session[:user_id])
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
      flash[:message] = 'Email taken' if User.email_taken?(@user.email)
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_login
    if !logged_in?
      render 'static/index'
    end
  end


end
