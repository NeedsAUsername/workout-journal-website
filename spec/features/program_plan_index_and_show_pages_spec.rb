require_relative '../rails_helper.rb'

RSpec.feature 'Program Plan Index And Show Pages', :type => :feature do

  scenario 'has a working programs index page' do
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

  scenario 'has show pages that display its exercises and routine' do
    Exercise.create_or_update_standard_exercises
    ProgramPlan.create_or_update_featured_programs
    user_login(create_standard_user)

    visit '/programs'
    click_link 'Starting Strength'

    expect(current_path).to eq('/programs/1')
    expect(page).to have_text('Exercises in this program')
    expect(page).to have_text('Bench Press')
    expect(page).to have_text('Workout A Squat, Bench Press, Deadlift')
  end

  scenario 'user creates a custom program' do
    Exercise.create_or_update_standard_exercises
    user_login(create_standard_user)
    create_a_program

    expect(current_path).to eq('/programs/1')
    expect(page).to have_text('test program')
    expect(page).to have_text('this is a test description')
    expect(page).to have_text('Bench Press')
    expect(page).to have_text('Deadlift')
    expect(page).not_to have_text('Squat')
  end

  scenario 'user edits their current program' do
    Exercise.create_or_update_standard_exercises
    user_login(create_standard_user)
    create_a_program
    click_link 'Edit Program'

    expect(current_path).to include('/edit')
    expect(page).to have_selector("input[value='Bench Press']")
    expect(page).to have_selector("input[value='Deadlift']")
    fill_in 'program_plan_exercises_attributes_0_name', with: 'Changed Name'
    click_button 'Save Changes'

    expect(page).to have_text('Changed Name')
    expect(page).to have_text('Deadlift')
    expect(page).not_to have_link('Bench Press')
  end

  scenario 'user deletes their current program' do
    Exercise.create_or_update_standard_exercises
    user_login(create_standard_user)
    create_a_program
    click_button 'Stop Program'

    expect(current_path).to eq('/programs')
    expect(page).not_to have_text('Your Current Program')
    expect(page).not_to have_text('Changed Name')
  end


end
