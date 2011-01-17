Given /^the following posts:$/ do |posts|
  Post.create!(posts.hashes)
end

Given /^a post by that user with title "([^"]*)" and body "([^"]*)" and slug "([^"]*)" and created at "([^"]*)"$/ do |title, body, slug, created_s|
  user = User.last
  post = Post.create(:title => title, :body => body, :slug => slug, :user_id => user.id)
  created_time = Time.parse(created_s)
  post.update_attribute(:created_at, created_time)
end

Then /^the (\d+)(?:st|nd|rd|th) post title should be "([^"]*)"$/ do |pos, title|
  with_scope(".post:nth-of-type(#{pos.to_i})") do
    if page.respond_to? :should
      page.should have_content(title)
    else
      assert page.has_content?(title)
    end
  end
end

Then /^I should see the post date within "([^"]*)"$/ do |selector|
  post_date = Post.last.created_at.to_formatted_s(:long_ordinal)
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_content(post_date)
    else
      assert page.has_content?(post_date)
    end
  end
end
