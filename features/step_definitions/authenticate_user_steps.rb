When(/^I go to the home page$/) do
  visit root_path
end

When(/^I click Login link on sidebar$/) do
  click_link 'Log in'
end

Then(/^I must see the login page$/) do
  expect(page).to have_content('Log in')
end

Given(/^I have an account$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I log in$/) do
  signin(@user.email, @user.password)
end

Then(/^I should see my profile page$/) do
  expect(page).to have_content(@user.name)
end

When(/^I login with invalid password$/) do
  @user = FactoryGirl.create(:user)
  signin(@user.email, "123")
end

Then(/^I should see a message error$/) do
  expect(page).to have_content("Invalid email/password combination")
end

Given(/^I was login before$/) do
  @user = FactoryGirl.create(:user)
  signin(@user.email, @user.password)
end

When(/^I click logout link$/) do
  within_window(page.driver.browser.window_handles.last) do
    find('a.dropdown-toggle').click # assuming you only have one a.dropdown-toggle
    click_link 'Log out'
  end 
end

Then(/^I must see the home page$/) do
  expect(page).to have_content("Welcome to the Sample App")
end
