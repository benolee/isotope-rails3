Feature: As a user
  I should be able to make blog posts
  In order to share ruby info and bring readers to our site

  Scenario: List posts
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I go to the blog index
    Then I should see "Testpost" within ".blog_info_top"
    And I should see "Testbody" within ".blog_content"

  Scenario: Show the blog posts in descending order by date created
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "First" and body "Firstbody" and slug "first-post" and created at "2010-10-01"
    And a post by that user with title "Second" and body "Secondbody" and slug "second-post" and created at "2010-10-20"
    And a post by that user with title "Third" and body "Thirdbody" and slug "third-post" and created at "2010-11-01"
    When I go to the blog index
    Then the 1st post title should be "Second"
    And the 2nd post title should be "First"

  Scenario: Click a user name
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    And I am on the blog index
    When I follow "Test T Man"
    Then I should see "Test T Man" within ".profile"

  Scenario: Click a title
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    And I am on the blog index
    When I follow "Testpost"
    Then I should see "View All Posts" within "#content"

  Scenario: See a post
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I am on the blog index
    Then I should see "Testpost" within ".blog_info_top"
    And I should see "by: Test T Man" within ".blog_info_top"
    And I should see the post date within ".blog_info_top"
    And I should see "Testbody" within ".blog_content"

  Scenario: View an individual post (the show page)
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I am on that post's show page
    Then I should see a link with text "View All Posts"

  Scenario: Try to edit a post as a non-user
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I go to that post's edit page
    Then I should see "Sign in"

  Scenario: Edit a post as an admin user
    Given I am an authenticated user with admin priveleges
    And the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    And I am on that post's edit page
    When I fill in "post_title" with "Test Post"
    And I fill in "post_slug" with "test-post"
    And I fill in "post_body" with "This is the test post body."
    And I press "Update Post"
    Then I should see "Post was successfully updated."

  Scenario: Try to edit someone else's post as a non-admin user
    Given I am an authenticated user without admin priveleges
    And the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I go to that post's edit page
    Then I should see "You must be the creator or an admin to do that"

  Scenario: Edit your own post as a user
    Given I am an authenticated user without admin priveleges
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I go to that post's edit page
    And I fill in "post_title" with "Test Post"
    And I fill in "post_slug" with "test-post"
    And I fill in "post_body" with "This is the test post body."
    And I press "Update Post"
    Then I should see "Post was successfully updated"

  Scenario: Destroy a post as an admin user
    Given I am an authenticated user with admin priveleges
    And the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    And a post by that user with title "Testpost" and body "Testbody" and slug "test-post" and created at "2010-10-01"
    When I go to that post's show page
    And I press "Destroy"
    Then I should see "Post was successfully destroyed."
    And I should not see "Testpost"
