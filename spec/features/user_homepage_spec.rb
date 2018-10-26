require_relative '../rails_helper.rb'

RSpec.feature 'User Homepage', :type => :feature do

  scenario 'Users can create a journal' do
    user_login(create_standard_user)
    click_link 'Journal'

    expect(current_path).to eq('/journal/new')

    fill_in 'Name', with: 'Workout Journal'
    click_button 'Create Journal'

    expect(current_path).to eq('/journal')
    expect(page).to have_text('Workout Journal')
  end
end
