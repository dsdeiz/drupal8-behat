@blackbox
Feature: Test DrupalContext
  In order to prove the Drupal context using the blackbox driver is working properly
  As a developer
  I need to use the step definitions of this context

  Scenario: View the about page
    Given I am on the homepage
    When I click "About"
    Then I should see the heading "About" in the "content" region

  Scenario: Viewing content in a region
    Given I am on the homepage
    Then I should see "Build something amazing." in the "left sidebar"

  Scenario: Not seeing text in a region
    Given I am on the homepage
    Then I should not see the text "Foobar" in the "left sidebar"

  Scenario: Submit contact form
    Given I am on the homepage
    When I follow "Contact"
    And I fill in the following:
      | Your name          | Foo bar            |
      | Your email address | foo@example.com    |
      | Subject            | Example subject    |
      | Message            | Some weird message |
    And I press the "Send message" button
    Then I should see the success message "Your message has been sent."

  Scenario: Submit a form in a region
    Given I am on the homepage
    When I fill in "Search" with "About" in the "right sidebar"
    And I press "Search" in the "right sidebar"
    Then I should see the text "Search for About" in the "content"

  Scenario: Find a button
    Given I am on the homepage
    Then I should see the "Search" button

  Scenario: Find a button in a region
    Given I am on the homepage
    Then I should see the "Search" button in the "right sidebar"

  Scenario: Error messages
   Given I am on "/user"
   And I fill in "Username" with "Foo"
   And I fill in "Password" with "Bar"
   When I press "Log in"
   Then I should see the error message "Unrecognized username or password."
