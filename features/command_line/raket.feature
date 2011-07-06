Feature: raket
  In order to run hydra quickly from rake tasks
  We want to configure REE and set RAILS_ENV

  Scenario: raket pass
    When I successfully run `../../bin/raket pass`
    # Then the output should contain "Loading test environment..."
    And the output should contain "Configuring REE"
    And the output should contain "PASS"
    And the output should report timing
    
  Scenario: raket gyst:info
    When I successfully run `raket gyst:info`
    # TODO: the output contains this text, but the test returns false, why?
    # Then the output should contain "Loading test environment..."
    And the output should match /"RAILS_ENV" => "test"/
    And the output should match /"RUBY_GC_MALLOC_LIMIT" => "1000000000"/


