class JournalsController < ApplicationController

  def index
    if current_user.journal.nil?
      redirect_to root_path
    elsif current_user.program_plan.nil?
      @journal = current_user.journal
      render 'static/show'
    else
      @journal = current_user.journal
      @program_plan = current_user.program_plan
      @entry = @journal.entries.build
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
