Feature: rakee
  In order to run testing quickly from rake tasks
  We want to configure REE

  Scenario: rakee pass
    When I successfully run `rakee pass`
    Then the output should contain "Configuring REE"
    And the output should contain "PASS"
    And the output should report timing
