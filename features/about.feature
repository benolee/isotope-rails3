Feature: About
  As a visitor
  I should see the Isotope11 employees

  Scenario: The page exists
    When I visit the about page
    Then it should return a response code of "200"

  Scenario: List users
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I visit the about page
    Then I should see a link with text "Test T Man"
    And I should see "developer" within ".profile"
    And I should see "Bio goes here." within ".profile"
    And I should see the alt text "Missing"

  Scenario: Follow user link
    Given the following users:
      | first_name | middle_initial | last_name | email               | password | password_confirmation | position  | bio            |
      | Test       | T              | Man       | testman@example.com | 123456   | 123456                | developer | Bio goes here. |
    When I visit the about page
    And I follow "Test T Man"
    Then I should be on that user's about page

  Scenario: Do something
    When I go to "http://google.com"
    Then show me the page

