class ProgramPlan < ApplicationRecord
  belongs_to :user
  has_many :exercises

  validates :name, :presence => true
end
