
Feature: Edit Work
  Scenario: Edit and add some new fields on existing work
    Given I am on search work page with username "qah001@artstor.org" and password "artstor"
    When Search work tab is loaded search for specific work by id, select it from list view and click on edit work button
    Then Verify is new changes applied successfully
