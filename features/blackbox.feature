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
