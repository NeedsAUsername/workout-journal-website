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

  def new
    @program_plan = ProgramPlan.new
  end

  def create
    @program_plan = ProgramPlan.new(program_plan_params)
    @program_plan.user = current_user
    if @program_plan.save
      redirect_to program_plans_path
    else
      render 'new'
    end
  end

  def destroy
    if current_user.program_plan.featured
      current_user.program_plan = nil
    else
      current_user.program_plan.destroy
    end
    redirect_to program_plans_path
  end

  private

  def program_plan_params
    params.require(:program_plan).permit(:name, :description)
  end
end
