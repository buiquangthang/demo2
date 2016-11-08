When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to the Sample App")
end

Then(/^I should see the Sign up link$/) do
  expect(page).to have_selector("a", text: "Sign up now!")
end

Then(/^I should see the Login link$/) do
  expect(page).to have_xpath("//li//a", text: "Log in")
end
