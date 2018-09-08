class User < ApplicationRecord
  has_secure_password
  has_one :journal

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  def attributes_list
    self.attributes.keys.delete_if {|att| att == "id" || att == "updated_at"}.map do |att|
      att == "password_digest" ? "password" : att
    end 
    # [:name, :email, :password]
  end
end
