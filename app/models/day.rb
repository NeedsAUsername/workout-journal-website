class Day < ApplicationRecord
  belongs_to :program_plan
  has_many :exercise_days
  has_many :exercises, through: :exercise_days

  accepts_nested_attributes_for :exercises, reject_if: :all_blank, allow_destroy: :true

end
