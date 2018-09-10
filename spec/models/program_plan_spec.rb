require 'rails_helper'

RSpec.describe ProgramPlan, type: :model do
  let(:exercise) {
    Exercise.create(
      name: 'Bench Press',
    )
  }
  let(:program_plan) {
    ProgramPlan.create(
      name: 'A Program',
    )
  }
  let(:user) {
    User.create(
    name: 'A User',
    )
  }

  it 'belongs to a user' do
    program_plan.user = user

    expect(program_plan.user).to eq(user)
  end

  it 'has many exercises' do
    program_plan.exercises << exercise

    expect(program_plan.exercises).to include(exercise)
  end
end
