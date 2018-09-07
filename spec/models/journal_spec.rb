require 'rails_helper'

RSpec.describe Journal, type: :model do
  let(:journal) {
    Journal.create(name: "Journal", user: user)
  }
  let(:user){
    User.create(name: "user", email: "example@example.com", password: "pass")
  }

  it 'is valid with a name and user' do
    expect(journal).to be_valid
  end

  it 'belongs to a user' do 
    expect(journal.user).to eq(user)
  end

end
