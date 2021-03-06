class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  layout 'welcome'

  def new
    root_if_logged_in
    @user = User.new
  end

  def create
    if auth.present? # fb login
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password = SecureRandom.hex
      end
      set_session
      redirect_to root_path
    else # normal login
      if user_found?
        if user_authenticated?
          set_session
          redirect_to root_path
        else
          flash[:message] = "Wrong Password."
          redirect_to login_path
        end
      else
        flash[:message] = "Invalid Email."
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    flash[:message] = 'You have logged out.'
    redirect_to root_path
  end

  private

  def user_found?
    if @user = User.find_by(email: params[:user][:email])
      if @user.email == 'guest@guest.com'
        clean_guest_account
      end
      true
    else
      false
    end
  end

  def clean_guest_account
    if @user.email == 'guest@guest.com'
      User.destroy_objects(@user.journal.entries)
      if @user.program_plan
        @user.program_plan.destroy
      end
    end 
  end

  def user_authenticated?
    @user.authenticate(params[:user][:password])
  end

  def set_session
    session[:user_id] = @user.id
  end

  def auth
    request.env['omniauth.auth']
  end

end
