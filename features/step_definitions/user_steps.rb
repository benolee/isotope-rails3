Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Given /^that user is locked$/ do
  User.last.lock_access!
end

