require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) {
    Exercise.create(
      name: 'Bench Press',
      program_plan: program_plan
    )
  }
  let(:program_plan) {
    ProgramPlan.create(
      name: 'A Program'
    )
  }

  it 'belongs to a program' do
    expect(exercise.program_plan).to eq(program_plan)
  end
end
