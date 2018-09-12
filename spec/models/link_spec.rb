require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) {
    Link.create(name: 'https://github.com', description: 'version control and code collaboration website')
  }

  it 'is valid with a name and description' do
    expect(link).to be_valid
  end

  it 'is not valid without a name' do
    link.name = nil
    expect(link).not_to be_valid
  end 

end
