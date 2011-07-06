Feature: the rake tasks for gyst

  In order make common tasks easy
  A developer
  Wants some rake tasks

  Scenario: gyst:info
    When I run `rake gyst:info`
    Then the output should match /"RAILS_ENV" => nil/
    And  the output should match /"RUBY_GC_MALLOC_LIMIT" => nil/
    And  the output should match /"RUBY_HEAP_FREE_MIN" => nil/
    And  the output should match /"RUBY_HEAP_MIN_SLOTS" => nil/
    And  the output should match /"RUBY_HEAP_SLOTS_INCREMENT" => nil/
    And  the output should match /"RUBY_HEAP_SLOTS_GROWTH_FACTOR" => nil/

