class Day < ApplicationRecord
  belongs_to :program_plan
  has_many :exercise_days
  has_many :exercises, through: :exercise_days
end
