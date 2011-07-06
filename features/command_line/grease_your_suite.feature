Feature: the grease_your_suite script sets configuration options for REE

  In order to speed up tests, the gys script should
  assign the environment values
  to configure GC appropriately for testing


  Scenario: running with no args
    When I successfully run `grease_your_suite`
    # output includes message and output from `time`
    Then the output should contain:
      """
      INFO: Configuring REE (re: grease_your_suite)
      """

  Scenario: the script sets Environment Variables
    When I run `grease_your_suite rake gyst:info`
    Then the output should contain "INFO: Configuring REE (re: grease_your_suite)"
    And  the output should match /"RUBY_GC_MALLOC_LIMIT" => "1000000000"/
    And  the output should match /"RUBY_HEAP_FREE_MIN" => "500000111"/
    And  the output should match /"RUBY_HEAP_MIN_SLOTS" => "1000000"/
    And  the output should match /"RUBY_HEAP_SLOTS_INCREMENT" => "1000000"/
    And  the output should match /"RUBY_HEAP_SLOTS_GROWTH_FACTOR" => "1"/
    And the output should report timing

