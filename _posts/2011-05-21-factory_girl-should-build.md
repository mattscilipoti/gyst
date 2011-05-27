---
title: Day 5b - Factory Girl should :build
layout: post
---

factory_girl should :build
--------------------------

I was on a roll, so I moved right into the patch for factory_girl.

#### Factory Girl
Sets default_strategy to :build.  Creating models in the db is slow.
Don't do it if you don't have to.

    require 'gyst/factory_girl' # all factory_girl enhancements (rspec, test_unit, etc)
    require 'gyst/factory_girl/rspec' # (TODO) just patch for rspec
    require 'gyst/factory_girl/test_unit' # (TODO) just patch for Test::Unit

The feature:
    /play crickets

How do I test that `require "gyst/factory_girl"` will change the
:default_strategy to :build?  

After reading through the aruba api, looking at features in some other projects (rspec, cucumer, and more), and taking the dogs for walk (probably the best step), I came up with:


{% highlight cucumber %}

# features/patches/factory_girl.feature

Feature: factory_girl patch

  Scenario: friendly loading (no such gem)

    Given I'm using a clean gemset "no_factory_girl"
    And a file named "gyst_factory_girl.rb" with:
      """
      require '../../lib/gyst/factory_girl'
      """

    When I run `ruby gyst_factory_girl.rb`
    Then the output should contain "Could not find 'factory_girl'"

{% endhighlight %}

I figured the first step was to make sure gyst was helpful if you
tried to patch factory_girl without installing it first.

{% highlight ruby %}

# lib/gyst/factory_girl.rb
# since use of this "patch" is optional,
#   we should not add "factory_girl" as a dependency
begin
  require 'factory_girl'
rescue LoadError
  $stderr.puts <<-EOS
#{'*'*50}
  "ERROR: Could not find 'factory_girl'.
     You should either install it (https://github.com/thoughtbot/factory_girl)
     or be more specific about which parts of `gyst` you would like to use (see README)."
#{'*'*50}
  EOS

  raise
end

{% endhighlight %}

<span class='pass'>pass</span>.  Nice and helpful.  On to the meat.

