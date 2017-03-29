Feature: Authentication
  Scenario: Valid Login
    Given I login using a valid account qabing001@artstor.org and artstor1
    When I request for all projects
    Then I should see 48 projects

  Scenario: Invalid Login
    When I login using an invalid account qabing001@artstor.org and artstor
    Then login should fail