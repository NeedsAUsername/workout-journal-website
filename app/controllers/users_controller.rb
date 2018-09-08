class UsersController < ApplicationController

  def show
    if logged_in?
      # log user in
    else
      render 'static/index'
    end
  end

  def new
    @user = User.new
  end

  def create
  end
end
