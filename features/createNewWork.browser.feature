Feature: Create New Work
  
  Scenario: Create new work with two titles and search it
    Given I am valid user with email "qah001@artstor.org" and password "artstor" in search work page
    When Search work tab is loaded go to create new work tab, add title1 and title2 do save
    Then Verify is newly created work with title1 and title2 exists
    
  Scenario: Create new work and search it
    Given I am valid user with email "qah001@artstor.org" and password "artstor" in search work page
    When Search work tab is loaded go to create new work tab, add title "selenium test 3" and click on save
    Then Verify is newly created work with title "selenium test 3" exists

  

