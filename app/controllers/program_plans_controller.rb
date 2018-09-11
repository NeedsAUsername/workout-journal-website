class ProgramPlansController < ApplicationController

  def index
    @program_plans = ProgramPlan.all
  end

  def show
    @program_plan = ProgramPlan.find(params[:id])
  end
end
