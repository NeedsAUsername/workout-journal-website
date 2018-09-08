require_relative '../rails_helper.rb'

RSpec.feature 'User Authentication', :type => :feature do
  scenario 'User can log in' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')

    visit '/login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'pass'
    click_button 'Log In'

    expect(current_path).to eq('/')
    expect(page).to have_text('Welcome random')
  end

  scenario 'User cannot login with invalid email' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')

    visit '/login'
    fill_in 'Email', with: 'wrong_test@test.com'
    fill_in 'Password', with: 'pass'
    click_button 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_text('Invalid Email')
  end

  scenario 'User cannot login with wrong password' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')

    visit '/login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'not_the_right_password'
    click_button 'Log In'

    expect(current_path).to eq('/login')
    expect(page).to have_text('Wrong Password')
  end

  scenario 'User can sign up' do
    visit 'signup'
    fill_in 'Email', with: "signingup@test.com"
    fill_in 'Name', with: 'Tester'
    fill_in 'Password', with: 'pass'
    click_button 'Sign Up'

    expect(current_path).to eq('/')
    expect(page).to have_text('Welcome Tester')
  end

  scenario 'User cannot sign up with an existing email' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')

    visit 'signup'
    fill_in 'Email', with: "test@test.com"
    fill_in 'Name', with: 'Tester'
    fill_in 'Password', with: 'pass'
    click_button 'Sign Up'

    expect(current_path).to eq('/signup')
    expect(page).to have_text('Email taken')
  end

end
