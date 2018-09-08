require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      name: 'ExampleUser',
      email: 'Example@example.com',
      password: 'pass'
    )
  }

  let(:journal) {
    Journal.create(
      name: 'Workout Journal'
    )
  }

  it 'is valid with a name, email, password' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    expect(User.new(email: 'email', password: 'pass')).not_to be_valid
  end

  it 'is not valid without an email' do
    expect(User.new(name: 'name', password: 'pass')).not_to be_valid
  end

  it 'is not valid without a password' do
    expect(User.new(name: 'name', email: 'email')).not_to be_valid
  end

  it 'has a unique email' do
    user_original = user
    user_copy = User.new(name: 'Copy', email: 'Example@example.com', password: 'pass')
    expect(user_copy).not_to be_valid
  end

  it 'has a journal' do
    user.journal = journal
    expect(user.journal).to eq(journal)
  end

end
