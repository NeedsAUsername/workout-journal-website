class Journal < ApplicationRecord
  belongs_to :user
  has_many :entries

  validates :name, :presence => true 

end
