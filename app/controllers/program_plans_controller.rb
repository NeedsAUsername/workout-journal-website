class ProgramPlansController < ApplicationController

  def index
    @program_plans = ProgramPlan.all
  end

  def show
    @program_plan = ProgramPlan.find(params[:id])
  end

  def new
    @program_plan = ProgramPlan.new
    @standard_exercises = Exercise.all.select {|ex| ex.standard }
  end

  def create
    if params[:program_plan][:id]
      @featured_program =ProgramPlan.find_by(featured_params)
      @program_plan = @featured_program.dup
      @program_plan.featured = nil
      @featured_program.exercises.each do |exercise|
        dup_exercise = exercise.dup
        dup_exercise.standard = nil
        @program_plan.exercises << dup_exercise
      end
      @featured_program.links.each do |link|
        @program_plan.links << link.dup
      end
      @featured_program.days.each do |day|
        dup_day = day.dup
        day.exercises.each do |exercise|
          dup_exercise = exercise.dup
          dup_exercise.standard = nil
          dup_day.exercises << dup_exercise
        end
        @program_plan.days << dup_day
      end
    else
      @program_plan = ProgramPlan.new(program_plan_params)
    end

    @program_plan.user = current_user

    if @program_plan.save
      redirect_to program_plans_path
    else
      render 'new'
    end
  end

  def edit
    @program_plan = current_user.program_plan
    @standard_exercises = Exercise.all.select {|ex| ex.standard }
    @custom_exercises = @program_plan.exercises.select {|ex| ex.standard == nil }
    @standard_or_custom_exercises = @standard_exercises + @custom_exercises
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

  def routine
    @program_plan = current_user.program_plan
  end

  private

  def program_plan_params
    params.require(:program_plan).permit(:name, :description, :exercise_ids => [], :dup_exercise_ids => [], :exercises_attributes => [:id, :name, :description, :_destroy])
  end

  def featured_params
    params.require(:program_plan).permit(:id)
  end
end
