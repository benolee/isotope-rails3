Feature: About
  As a visitor
  I should see the Isotope11 employees
  In order to learn more about the company

  Scenario: The page exists
    When I visit the about page
    Then I should see "About Us"

  Scenario: List unlocked users
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I visit the about page
    Then I should see a link with text "Test T Man"
    And I should see "developer" within ".profile"
    And I should see "Bio goes here." within ".profile"

  Scenario: Don't list locked users
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    Given that user is locked
    When I visit the about page
    Then I should not see "Test T Man"
    And I should not see "developer"
    And I should not see "Bio goes here."

  Scenario: Follow user link to user show page
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I visit the about page
    And I follow "Test T Man"
    Then I should be on that user's show page

  Scenario: User has no avatar
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I visit the about page
    Then I should see the alt text "Missing"

