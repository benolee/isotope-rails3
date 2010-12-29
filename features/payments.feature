Feature: Payments
  As a visitor
  I should be see the payments page
  In order to make a payment

  Scenario: The payments page exists
    When I am on the payments page
    Then I should see "Payments"

  Scenario: The Pay Now image exists
    When I am on the payments page
    Then I should see the input text "PayPal - The safer, easier way to pay online!"

  @wip
  Scenario: Click Pay Now link
    Given I am on the payments page
    When I press "pay-now"
    Then I should not be on the payments page
