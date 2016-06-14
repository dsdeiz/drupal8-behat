Feature: Test homepage
  Test blackbox
  As a developer
  Blah blah blah

  @drush
  Scenario: Create users
    Given users:
      | name | mail             | status |
      | test | test@example.com | 1      |
    And I am on the homepage
    Then I should see "Welcome to Drupal 8 Behat"
