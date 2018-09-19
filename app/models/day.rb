class Day < ApplicationRecord
  has_many :exercise_days 
  has_many :exercises, through: :exercise_days
end
