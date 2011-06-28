Feature: the grease_your_suite script sets configuration options for REE

  In order to speed up tests, the gys script should
  assign the environment values
  to configure GC appropriately for testing


  Scenario: the script sets Environment Variables
    When I run `../../bin/grease_your_suite.sh`
    # output includes message and output from `time`
    Then it should pass with:
      """
      INFO: Configuring REE (re: grease_your_suite)

      real	0m0
      """
    When I run `../../bin/grease_your_suite.sh rake gyst:info`
    Then the output should contain:
      """
      {
                   "RUBY_GC_MALLOC_LIMIT" => "1000000000",
                     "RUBY_HEAP_FREE_MIN" => "500000111",
                    "RUBY_HEAP_MIN_SLOTS" => "1000000",
              "RUBY_HEAP_SLOTS_INCREMENT" => "1000000",
          "RUBY_HEAP_SLOTS_GROWTH_FACTOR" => "1"
      }
      """

  Scenario: running with no args
    When I successfully run `../../bin/grease_your_suite`
    # output includes message and output from `time`
    Then the output should contain:
      """
      INFO: Configuring REE (re: grease_your_suite)
      """

  Scenario: the script sets Environment Variables
    When I run `../../bin/grease_your_suite rake gyst:info`
    Then the output should contain:
      """
      {
                   "RUBY_GC_MALLOC_LIMIT" => "1000000000",
                     "RUBY_HEAP_FREE_MIN" => "500000111",
                    "RUBY_HEAP_MIN_SLOTS" => "1000000",
              "RUBY_HEAP_SLOTS_INCREMENT" => "1000000",
          "RUBY_HEAP_SLOTS_GROWTH_FACTOR" => "1"
      }
      """
    Then the output should contain:
      """
      INFO: Configuring REE (re: grease_your_suite)
      """
    #wraps in `time -p`
    And the output should match /.*real +\d\.\d\d/

