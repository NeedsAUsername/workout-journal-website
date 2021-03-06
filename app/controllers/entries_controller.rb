class EntriesController < ApplicationController

  def create
    @entry = current_user.journal.entries.build(entry_params)
    if @entry.save
      redirect_to journal_entries_path
    else
      flash[:message] = 'error: entry could not save'
      redirect_to journals_path
    end
  end

  def index
    @journal = current_user.journal

    respond_to do |format|
      format.html {render :index}
      format.json {render json: @journal,
        include: ['entries.exercises']}
        # active_model_serializer only goes one association deep, so need to include deeper associations
    end
  end

  def show
    @entry = current_user.journal.entries.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to journal_entries_path(current_user.journal)
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :comments, :exercises_attributes => [:name, :weight, :sets, :reps])
  end
end
