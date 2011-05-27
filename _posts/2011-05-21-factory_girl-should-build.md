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

---

Wait
----

It passes when run individually, but fails with `rakee` or `rake`?
<p class="error">Could not find rake-0.9.0 in any of the sources (Bundler::GemNotFound)</p>

Looks like an issue with my "clean gemset".  I was already a little
uncomfortable that I was not cleaning that up.  Enter new steps:

{% highlight cucumber %}

Given I'm using a new gemset with these gems:
  | rake |

{% endhighlight %}

And the steps:

{% highlight ruby %}

# features/step_definitions/rvm_steps.rb

Given /^(?:I'm|I am) using a new gemset$/ do
  use_clean_gemset(CLEAN_GEMSET)
end

Given /^(?:I'm|I am) using a new gemset with these gems:$/ do |table|
  # table is a Cucumber::Ast::Table
  Given "I am using a new gemset"

  table.rows.each do |row|
    gem = row.first
    run_simple("gem install #{gem}", true)
  end
end

{% endhighlight %}

And the cleanup:

{% highlight ruby %}

# features/support/env.rb

CLEAN_GEMSET = 'delete_me'

Before('@gemset') do
  puts "INFO: feature may be slow, please be patient.  Using --no-rdoc
helps."
  run_simple("rvm --force gemset delete #{CLEAN_GEMSET}", true)
  @aruba_timeout_seconds = 20
 end

{% endhighlight %}

Note the increased @aruba_timeout_seconds.  The gem install, with rdoc,
takes a while.  One workaround is to add `--no-rdoc` to your ~/.gemrc.

One begets another
-------------------

Rake?  check.  <span class='error'>Bundler not found.</span>  Then, <span class='error'>ffi not found.</span>

{% highlight cucumber %}

  @gemset @announce
  Scenario: friendly loading (no such gem)

    Given I'm using a new gemset with these gems:
      | rake    |
      | bundler |
      | ffi     |

{% endhighlight %}

Yikes.  Time to stop and re-evaluate.

This fails too.  Is it a clue?
    bundle exec cucumber -f pretty features/patches/factory_girl.feature

Probably, but it's late.

'night

ps.  That `@announce` tag is pretty helpful.  Thx aruba.

