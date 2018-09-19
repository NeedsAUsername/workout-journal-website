class JournalsController < ApplicationController

  def index
    if current_user.journal.nil?
      redirect_to root_path
    else
      @journal = current_user.journal
      @program_plan = current_user.program_plan
    end
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)
    current_user.journal = @journal
    current_user.save

    redirect_to journals_path
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end

end
