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

  it 'is valid with a name and program' do
    expect(exercise).to be_valid
  end

  it 'is not valid without a name' do
    expect(Exercise.new()).not_to be_valid
  end

  it 'belongs to a program' do
    expect(exercise.program_plan).to eq(program_plan)
  end
end
