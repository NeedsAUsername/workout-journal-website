class Exercise < ApplicationRecord
  has_many :exercise_program_plans
  has_many :program_plans, through: :exercise_program_plans

  validates :name, :presence => true

  def self.compound_lifts
    {
      bench_press: {
        name: 'Bench Press',
        description: 'Works the chest, arms, and shoulder muscles.'
      },
      overhead_press: {
        name: 'Overhead Press',
        description: 'Works primarily the shoulders.'
      }
    }
  end


  def self.links
    {
      bench_press: 'https://stronglifts.com/bench-press/',
      overhead_press: 'https://stronglifts.com/overhead-press/'
    }
  end
end
