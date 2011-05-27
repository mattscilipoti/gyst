---
title: Day 5a - Hydra <3 raket
layout: post
---

rakee
-----

The goal tonight is the hydra helper rake task `raket`.  We'll get there
through:
    rakee # runs rake tasks with REE configured for tests



First things first, update the readme:

`rakee` configures REE for testing, then runs the task(s).  It simply executes grease_your_suite.sh before running the rake task.

Usage:

    rakee # runs all tests after configuring REE
    rakee test:units
    rakee features

Then, a new feature:

{% highlight cucumber %}

# features/command_line/rakee.feature

Feature: rakee
  In order to run testing quickly from rake tasks
  We want to configure REE

  Scenario: rakee pass
    When I successfully run `rakee pass`
    Then the output should contain "Configuring REE"
    And the output should contain "PASS"
    And the output should contain "real    0m0"

{% endhighlight %}

Once again, I'd like to check that the Environment vars are set
correctly, but I haven't figured that out yet.  The output will have
to do.  `rakee pass` configures REE and runs the "pass" task.

    cucumber -f pretty features/command_line/rakee.feature

<span class='fail'>fail. </span> Can't find rakee.

Copied my existing "rakee" script to `gyst/bin/`.  

{% highlight sh %}

#!/bin/sh

grease_your_suite.sh rake $@

{% endhighlight %}

Then install again to get "rakee" into the path.
    gem install pkg/gyst-0.0.1.gem --no-wrappers

<span class='fail'>fail. </span> permissions
    chmod +x bin/rakee

<span class='fail'>fail. </span> No rake task named "pass".

Added this to Rakefile:

{% highlight ruby %}

# rake tasks for testing
task :pass do
  puts "PASSED"
end

{% endhighlight %}

<span class='pass'>pass</span>.

----

raket
-----

Lather, Rinse and Repeat for "raket".

`raket` is a helper for the [hydra gem](https://github.com/ngauthier/hydra). Hydra requires that `RAILS_ENV=test`.  `raket` sets RAILS_ENV and configures REE for testing, then runs the task(s).

Usage:

    raket hydra
    raket hydra:specs

The new feature:

{% highlight cucumber %}

# features/command_line/raket.feature

Feature: raket
  In order to run hydra quickly from rake tasks
  We want to configure REE and set RAILS_ENV

  Scenario: raket pass
    When I successfully run `raket pass`
    Then the output should contain "Loading test environment..."
    And the output should contain "Configuring REE"
    And the output should contain "PASS"
    And the output should contain "real    0m0"

{% endhighlight %}

bin/raket

    #!/bin/sh
    ## Hydra needs test env.
    echo "Loading test environment..."
    RAILS_ENV=test rakee $*

Re-install!   
<span class='pass'>pass</span>.

----

task :default
-------------

The default rake task really should run all our tests.

{% highlight ruby %}

# Rakefile

require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

task :default => [:features]

{% endhighlight %}

Now, I can use
    rakee
<span class='pass'>pass</span>.

----

Readme
------

I realized that `rakee` and `raket` were more important than the helper
script `grease_your_suite.sh`, so I moved them up in the readme.  Then,
enhanced the "raket" docs.   
I also added a note about using
`--no-wrappers` when installing.  It's caught me more than once.

That's enough for one post.  This night continues with
[factory_girl should :build](2011/05/21/factory_girl-should-build.html).
