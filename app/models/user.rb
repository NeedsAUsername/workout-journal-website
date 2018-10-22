class User < ApplicationRecord
  has_secure_password
  has_one :journal
  has_one :program_plan

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  def attributes_list
    self.attributes.keys.delete_if {|att| hidden_attributes.include? att }.map do |att|
      att == "password_digest" ? "password" : att
    end
    # [:name, :email, :password]
  end

  def self.email_taken?(email)
    self.find_by(email: email)
  end

  private

  def hidden_attributes
    ['id', 'updated_at', 'created_at', 'uid', 'image', 'height', 'weight']
  end
end
