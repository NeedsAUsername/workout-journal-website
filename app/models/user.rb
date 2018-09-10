class User < ApplicationRecord
  has_secure_password
  has_one :journal
  has_one :program_plan

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true

  def attributes_list
    self.attributes.keys.delete_if {|att| att == "id" || att == "updated_at" || att == "created_at"}.map do |att|
      att == "password_digest" ? "password" : att
    end
    # [:name, :email, :password]
  end

  def self.email_taken?(email)
    self.find_by(email: email)
  end
end
