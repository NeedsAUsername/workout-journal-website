class RoutinesController < ApplicationController

  def new
    @program_plan = current_user.program_plan
    @day = @program_plan.days.build
  end
end
