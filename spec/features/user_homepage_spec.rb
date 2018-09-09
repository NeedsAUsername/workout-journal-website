require_relative '../rails_helper.rb'

RSpec.feature 'User Homepage', :type => :feature do

  scenario 'Users page shows a link to their journal' do
    user_login(create_standard_user)

    expect(page).to have_link('Set Up Your Journal')
  end

  scenario 'Users can create a journal' do
    user_login(create_standard_user)
    click_link 'Set Up Your Journal'

    expect(current_path).to eq('/journal/new')

    fill_in 'Name', with: 'Workout Journal'
    click_button 'Create Journal'

    expect(current_path).to eq('/journal')
    expect(page).to have_text('Workout Journal')

    click_link 'Home'

    expect(page).not_to have_link('Set Up Your Journal')
    expect(page).to have_link('Go To Your Journal')
  end
end
