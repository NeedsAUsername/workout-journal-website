class RoutinesController < ApplicationController

  def new
    @program_plan = current_user.program_plan
  end
end
