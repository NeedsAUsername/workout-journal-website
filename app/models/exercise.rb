class Exercise < ApplicationRecord
  has_many :exercise_program_plans
  has_many :program_plans, through: :exercise_program_plans


  validates :name, :presence => true
end
