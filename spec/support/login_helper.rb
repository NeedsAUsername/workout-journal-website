module LoginHelper

  def user_login(user)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end

  def user_signup(user_att)
    visit 'signup'
    fill_in 'Email', with: user_att[:email]
    fill_in 'Name', with: user_att[:name]
    fill_in 'Password', with: user_att[:password]
    click_button 'Sign Up'
  end

  def create_standard_user
    User.create(email: 'test@test.com', name: 'random', password: 'pass')
  end

  def create_a_program
    visit '/programs'
    click_link 'Create a Custom Program'

    fill_in 'Name', with: 'test program'
    fill_in 'Description', with: 'this is a test description'
    check 'Bench Press'
    check 'Deadlift'

    click_button 'Create Program'
  end
end
