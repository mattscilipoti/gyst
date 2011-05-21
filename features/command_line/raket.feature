Feature: raket
  In order to run hydra quickly from rake tasks
  We want to configure REE and set RAILS_ENV

  Scenario: raket pass
    When I successfully run `raket pass`
    Then the output should contain "Loading test environment..."
    And the output should contain "Configuring REE"
    And the output should contain "PASS"
    And the output should contain "real	0m0"

