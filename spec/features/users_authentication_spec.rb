require_relative '../rails_helper.rb'

RSpec.feature 'User Authentication', :type => :feature do
  scenario 'User can log in' do
    user = create_standard_user

    user_login(user)

    expect(current_path).to eq('/')
    expect(page).to have_text('Welcome random')
  end

  scenario 'User cannot login with an invalid email' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')
    user2 = User.new(email: 'wrong@email.com', name: 'random', password: 'pass')

    user_login(user2)

    expect(current_path).to eq('/login')
    expect(page).to have_text('Invalid Email')
  end

  scenario 'User cannot login with wrong password' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')
    user2 = User.new(email: 'test@test.com', name: 'random', password: 'not_the_right_pass')

    user_login(user2)

    expect(current_path).to eq('/login')
    expect(page).to have_text('Wrong Password')
  end

  scenario 'User can sign up' do
    user_att = {email: 'test@test.com', name: 'random', password: 'pass'}

    user_signup(user_att)

    expect(current_path).to eq('/')
    expect(page).to have_text('Welcome random')
  end

  scenario 'User cannot sign up with an existing email' do
    user_att = {email: 'user.email', name: 'random', password: 'pass'}
    User.create(user_att)

    user_signup(user_att)

    expect(current_path).to eq('/signup')
    expect(page).to have_text('Email taken')
  end

  scenario 'User can log out' do
    user = User.create(email: 'test@test.com', name: 'random', password: 'pass')
    user_login(user)
    click_button 'Log Out'

    expect(current_path).to eq('/')
    expect(page).to have_text('You have logged out.')
  end


end
