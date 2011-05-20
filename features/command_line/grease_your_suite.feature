Feature: the grease_your_suite script sets configuration options for REE

  In order to speed up tests, the gys script should
  assign the environment values
  to configure GC appropriately for testing


  Scenario: the script sets Environment Variables
    When I run `grease_your_suite.sh`
    # output includes message and output from `time`
    Then it should pass with:
      """
      INFO: Configuring REE (re: grease_your_suite)

      real	0m0
      """

