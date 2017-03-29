Feature: Search Works
  Scenario: search works by id
    Given I am on search work page with username "qah001@artstor.org" and password "artstor"
    When Search work tab is loaded, search work with id 8000511007
    Then I should see work with title "Wow! Life is so beautiful"

  Scenario: search works by name
    Given I am on search work page with username "qah001@artstor.org" and password "artstor"
    When Search work tab is loaded, search work with name "Wow! Life is so beautiful"
    Then I should see work with title "Wow! Life is so beautiful"

