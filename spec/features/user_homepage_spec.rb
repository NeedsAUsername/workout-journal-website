require_relative '../rails_helper.rb'

RSpec.feature 'User Homepage', :type => :feature do

  scenario 'Users page shows a link to their journal' do
    user_login(create_standard_user)

    expect(page).to have_link('Set Up Your Journal')
  end
end
