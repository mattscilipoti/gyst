Feature: the rake tasks for gyst

  In order make common tasks easy
  A developer
  Wants some rake tasks

  Scenario: gyst:info
    When I run `rake gyst:info`
    Then it should pass with:
      """
      {
                              "RAILS_ENV" => nil,
                   "RUBY_GC_MALLOC_LIMIT" => nil,
                     "RUBY_HEAP_FREE_MIN" => nil,
                    "RUBY_HEAP_MIN_SLOTS" => nil,
              "RUBY_HEAP_SLOTS_INCREMENT" => nil,
          "RUBY_HEAP_SLOTS_GROWTH_FACTOR" => nil
      }
      """

