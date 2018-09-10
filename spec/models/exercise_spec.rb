require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) {
    Exercise.create(
      name: 'Bench Press',
    )
  }
  let(:program_plan) {
    ProgramPlan.create(
      name: 'A Program',
      user: User.create(name: 'name')
    )
  }

  it 'is valid with a name' do
    expect(exercise).to be_valid
  end

  it 'is not valid without a name' do
    expect(Exercise.new()).not_to be_valid
  end

  it 'has many programs' do
    exercise.program_plans << program_plan

    expect(exercise.program_plans).to include(program_plan)
  end
end
