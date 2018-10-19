class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :show]
  skip_before_action :verify_authenticity_token

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
      render 'new', layout: 'welcome'
    end
  end

  def stats
  end

  def update
    @user.update(user_params)
    render :stats_data, layout: false 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :height, :weight)
  end

end
