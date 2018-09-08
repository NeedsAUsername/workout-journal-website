class UsersController < ApplicationController

  def show
    if session[:user_id]
      # log user in
    else
      render 'static/index'
    end
  end

  def new
  end

  def create
  end
end
