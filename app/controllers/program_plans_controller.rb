class ProgramPlansController < ApplicationController

  def index
    @program_plans = ProgramPlan.all
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end 
  end

  def show
    @program_plan = ProgramPlan.find(params[:id])
  end
end
