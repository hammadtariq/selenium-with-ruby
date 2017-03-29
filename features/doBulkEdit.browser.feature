Feature: Bulk Edit
  Scenario: Do bulk edit on two works in list view
    Given I am valid user with username "qah001@artstor.org" and password "artstor" in search work page
    When Search work tab is loaded select any two works and click on edit button
    Then Write query and click on ok button
