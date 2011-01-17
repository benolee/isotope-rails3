Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  User.create!(:email => email,
               :password => password,
               :password_confirmation => password,
               :first_name => 'User',
               :last_name => 'User',
               :middle_initial => 'U')
end

Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Given /^that user is locked$/ do
  User.last.lock_access!
end

Given /^I am an authenticated user (with|without) admin priveleges$/ do |value|
  email = 'admin@example.com'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}"}
  User.last.update_attribute(:admin, true) if value == "with"
  visit new_user_session_path
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

