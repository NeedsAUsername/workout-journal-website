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
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end
  end

  def new
    @program_plan = ProgramPlan.new
    @standard_exercises = Exercise.all.select {|ex| ex.standard == true }
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

  def edit
    if logged_in?
      @program_plan = current_user.program_plan
    end
  end

  def update
    @program_plan = current_user.program_plan
    @program_plan.update(program_plan_params)
    if @program_plan.save
      redirect_to program_plan_path(@program_plan)
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.program_plan.featured
      current_user.program_plan = nil
    else
      custom_exercises = current_user.program_plan.exercises.select {|ex| ex.standard == false}
      User.destroy_objects(custom_exercises)
      current_user.program_plan.destroy
    end
    current_user.save
    redirect_to program_plans_path
  end

  private

  def program_plan_params
    params.require(:program_plan).permit(:name, :description, :exercise_ids => [])
  end
end
