class Exercise < ApplicationRecord
  belongs_to :program_plan

  validates :name, :presence => true 
end
