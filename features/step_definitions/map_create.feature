Feature: Map List
  In order to make a map list
  A visitor
  Can create and manage maps

  Scenario: Map List
    Given I have maps titled First, Second
    When I go to the list of maps
    Then I should see header "First"
    And I should see header "Second"