---
title: Day 17 - Finally, we verify the Environment Variables
layout: post
---

The Failed Attempt
-------------------

Back on [Day 4](/gyst/2011-05-20-the-first-script.html), I bemoaned the
fact that I could not actually test the values of the Environment Variables
we set to configure REE, because the script was complete and the values had reverted before the
assertions could be made.

Today, We Can (I hope)
-------------

Let's create a rake task that reports the Environment Vars that we care
about.  Not only will it help us introspect, we can use it for testing.
    rake gyst:info

Let's test it without grease_your_suite.sh.

{% highlight cucumber %}
Feature: the rake tasks for gyst

  In order make common tasks easy
  A developer
  Wants some rake tasks

  @wip
  Scenario: gyst:info
    When I run `rake gyst:info`
    Then it should pass with:
      """
      | RUBY_GC_MALLOC_LIMIT          | 0 |
      | RUBY_HEAP_FREE_MIN            | 0 |
      | RUBY_HEAP_MIN_SLOTS           | 0 |
      | RUBY_HEAP_SLOTS_INCREMENT     | 0 |
      | RUBY_HEAP_SLOTS_GROWTH_FACTOR | 0 |
      """
{% endhighlight %}


(<span class="tip">Suggested Practice</span>) As I do in my other projects, I tried running `cucumber
-pwip`.   
<span class=error>cucumber.yml was not found.</span>

I copied a cucumber.yml that I have tweaked from an existing project.
That may be the topic for another post.  Today, you just need to know
that `cucumber -pwip` should only run Scenario/Features with the @wip
tag.

    rake gyst:info

In the middle of a lot of output, we see:

    +rake aborted!
    +Don't know how to build task 'gyst:info'

I started to write a rake task to output that pretty table, but decided the
output from awesome_print was good enough... for now.  After tweaking
the feature:

{% highlight ruby %}
namespace :gyst do
  desc 'Display info related to gyst (env vars, etc)'
  task :info do
    env_vars = %w{
      RUBY_GC_MALLOC_LIMIT
      RUBY_HEAP_FREE_MIN
      RUBY_HEAP_MIN_SLOTS
      RUBY_HEAP_SLOTS_INCREMENT
      RUBY_HEAP_SLOTS_GROWTH_FACTOR
    }
    env_var_values = env_vars.inject({}) do |result, var_name|
      result[var_name] = ENV[var_name]
      result
    end

    ap env_var_values
  end
{% endhighlight %}

<p class='pass'>Green</p>

And now we can test grease_your_suite.sh.

{% highlight cucumber %}
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
    When I run `grease_your_suite.sh rake gyst:info`
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
{% endhighlight %}

Another big pile o'red.
<p class=error>No such file or directory - grease_your_suite.sh (Errno::ENOENT)</p>

A happy accident.  It made me realize that I need to specify the script in the bin dir of this
project.  Otherwise, I'm getting the most recently _installed_
grease_your_suite.sh.  

{% highlight cucumber %}
    When I run `../../bin/grease_your_suite.sh`
{% endhighlight %}

I had to spend a little time futzing with the leading spaces.  But
eventually, I got to <span class='pass'>green</span>.

Remember to run "`cucumber`", since "`rake`" still has to skip the @gemset features. :(

