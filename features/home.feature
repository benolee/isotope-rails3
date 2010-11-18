Feature: Home
  As a travelin' man
  I should be seein' the home page
  In order to be gettin' info about this here Isotope11

  Scenario: The page exists
    When I am on the home page
    Then I should see "Web Development Done Right!"

  Scenario: The footer links work
    Given I am on the home page
    When I follow "Home" within "#footer"
    Then I should see "Web Development Done Right!"
    When I follow "About" within "#footer"
    Then I should see "Isotope11 is a software development firm"
    When I follow "Work" within "#footer"
    Then I should see "Financial Services"
    When I follow "Services" within "#footer"
    Then I should see "We provide custom programming with primary focus on Rails development"
    When I follow "Blog" within "#footer"
    Then I should see "Blog" within "#content"
    When I follow "Contact" within "#footer"
    Then I should see "Contact Us" within "#content"
    When I follow "Payments" within "#footer"
    Then I should see "Payments" within "#content"
    When I follow "Careers" within "#footer"
    Then I should see "Careers" within "#content"
    When I follow "Site Login" within "#footer"
    Then I should see "Sign in" within "#content"

  Scenario: The top menu links work
    Given I am on the home page
    When I follow "Home" within "#top-bar"
    Then I should see "Web Development Done Right!"
    When I follow "About" within "#top-bar"
    Then I should see "Isotope11 is a software development firm"
    When I follow "Work" within "#top-bar"
    Then I should see "Financial Services"
    When I follow "Services" within "#top-bar"
    Then I should see "We provide custom programming with primary focus on Rails development"
    When I follow "Blog" within "#top-bar"
    Then I should see "Blog" within "#content"
    When I follow "Contact" within "#top-bar"
    Then I should see "Contact Us" within "#content"
    When I follow "Payments" within "#top-bar"
    Then I should see "Payments" within "#content"
