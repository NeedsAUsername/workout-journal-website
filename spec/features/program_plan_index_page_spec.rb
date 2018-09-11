require_relative '../rails_helper.rb'

RSpec.feature 'Featured Programs', :type => :feature do

  scenario 'has a working featured programs index page' do
    user_login(create_standard_user)
    visit '/programs'

    expect(page).not_to have_text('Starting Strength')
    expect(page).not_to have_text('Strong Lifts')

    ProgramPlan.create_or_update_featured_programs
    visit '/programs'

    expect(page).to have_text('Starting Strength')
    expect(page).to have_text('Strong Lifts')
  end

  scenario "only allows user's own program on the featured programs index page" do
    user = create_standard_user
    user_login(user)
    user.build_program_plan(name: 'A Program Plan', description: 'Not featured, but should show up because it belongs to the user')
    user.save
    visit '/programs'

    expect(page).to have_text('A Program Plan')
    expect(page).to have_text('Not featured, but should show up')
  end
end
