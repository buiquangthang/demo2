module LoginHelpers
  def signin(email, password)
    visit '/login'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

World(LoginHelpers)