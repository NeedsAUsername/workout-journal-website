require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      name: "TestingName",
      email: "Example@example.com",
      password: "pass"
    )
  }

end
