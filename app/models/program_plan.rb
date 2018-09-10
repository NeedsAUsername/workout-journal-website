class ProgramPlan < ApplicationRecord
  belongs_to :user
  has_many :exercise_program_plans
  has_many :exercises, through: :exercise_program_plans

  validates :name, :presence => true


  def self.starting_strength
    {
      name: 'Starting Strength'
      description: 'A 3x5 squat-focused training system that focuses on building a foundation of strength with full-body workouts that utilize compound lifts.'
    }
  end

  def self.strong_lifts
    {
      name: 'Strong Lifts'
      description: 'A simple but effective 5x5 squat-focused training routine for building strength.'
    }
end
