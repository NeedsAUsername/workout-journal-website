class User < ApplicationRecord
  has_secure_password
  has_one :journal

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  def attributes_list
    [:name, :email, :password]
  end
end
