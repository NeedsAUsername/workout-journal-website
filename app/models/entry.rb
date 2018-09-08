class Entry < ApplicationRecord
  belongs_to :journal

  validates :date, :presence => true
end
