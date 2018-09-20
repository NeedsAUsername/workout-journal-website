class Entry < ApplicationRecord
  belongs_to :journal
  has_many :exercises
  accepts_nested_attributes_for :exercises

  validates :date, :presence => true
end
