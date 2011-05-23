Feature: factory_girl patch

  @gemset @announce
  Scenario: friendly loading (no such gem)

    Given I'm using a new gemset with these gems:
      | rake    |
      | bundler |
      | ffi     |
    And a file named "gyst_factory_girl.rb" with:
      """
      require '../../lib/gyst/factory_girl'
      """

    When I run `ruby gyst_factory_girl.rb`
    Then the output should contain "Could not find 'factory_girl'"


