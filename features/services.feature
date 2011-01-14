Feature: Services
  As a visitor
  I should see the services page
  In order to get info about services

  Scenario: The page exists
    When I am on the services page
    Then I should see "Services"

  Scenario: The image is there
    When I am on the services page
    Then I should see the alt text "services"
