class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :show]

  def show
    if !logged_in? # necessary for require_login to work properly
      render 'static/index', layout: 'welcome'
    else
      @user = User.find(session[:user_id])
    end
  end

  def new
    root_if_logged_in
    @user = User.new
    render layout: 'welcome'
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
