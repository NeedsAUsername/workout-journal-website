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

  it 'is valid with a name and user and invalid without either' do
    expect(program_plan).not_to be_valid

    program_plan.user = user

    expect(program_plan).to be_valid

    program_plan.name = nil

    expect(program_plan).not_to be_valid
  end

  it 'belongs to a user' do
    program_plan.user = user

    expect(program_plan.user).to eq(user)
  end

  it 'has many exercises' do
    program_plan.exercises << exercise

    expect(program_plan.exercises).to include(exercise)
  end
end
