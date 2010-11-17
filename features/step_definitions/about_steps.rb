Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

When /^I visit the about page$/ do
  visit about_index_path
end

