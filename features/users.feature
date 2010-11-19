Feature: As a user
  I should be able to view and edit users
  In order to list the employees of Isotope11 on the site along with their info

  Scenario: View a user as a non-admin user
    Given I am an authenticated user without admin priveleges
    And the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I go to that user's show page
    Then I should see "Test T Man" within ".profile"
    And I should not see "Edit User" within "#content"

  Scenario: View a user as an admin user
    Given I am an authenticated user with admin priveleges
    And the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I go to that user's show page
    Then I should see "Test T Man" within ".profile"
    And I should see "Edit User" within "#content"

