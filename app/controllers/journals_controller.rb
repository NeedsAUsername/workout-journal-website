class JournalsController < ApplicationController

  def index
    if logged_in?
      if current_user.journal.nil?
        redirect_to root_path
      else
        @journal = current_user.journal
      end
    else
      redirect_to login_path
    end
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)
    current_user.journal = @journal
    current_user.save
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end

end
