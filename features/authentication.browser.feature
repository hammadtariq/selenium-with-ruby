Feature: Browser Authentication
  Scenario: Authenticate
    Given I opened login page of ssimata
    When Login page is available I should do login using a valid account "qah001@artstor.org" and "artstor"
    Then I should see project manager page

