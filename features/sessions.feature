Feature: User sessions
  As a user
  I should be able to login
  In order to edit my profile

  Scenario: Sign in
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    Given I am on the login page
    And I fill in "Email" with "testman@example.com"
    And I fill in "Password" with "123456"
    When I press "Sign in"
    Then I should see "Signed in successfully."
