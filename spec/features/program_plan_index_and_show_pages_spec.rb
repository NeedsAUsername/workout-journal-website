require_relative '../rails_helper.rb'

RSpec.feature 'Program Plan Index And Show Pages', :type => :feature do

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

  scenario 'has show pages that link to exercises show pages' do
    Exercise.create_or_update_standard_exercises
    ProgramPlan.create_or_update_featured_programs
    user_login(create_standard_user)

    visit '/programs'
    click_link 'Starting Strength'

    expect(current_path).to eq('/programs/1')
    expect(page).to have_text('Exercises in this program:')

    click_link 'Bench Press'

    expect(current_path).to eq('/programs/1/exercises/1')
    expect(page).to have_text('Works the chest, arms, and shoulder muscles')
    expect(page).to have_link('Detailed guide on how to perform a proper bench press')

  end

end
