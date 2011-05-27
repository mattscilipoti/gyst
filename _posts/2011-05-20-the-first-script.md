---
title:  Day 4 - The First Script
layout: post
---

grease-your-suite.sh
--------------------

This is my first command line feature.  I've read about [aruba][aruba], now I
get use it.

Step 1: Clarify usage in README.   
Step 2: Write the feature.   

{% highlight cucumber %}
Feature: the grease_your_suite script sets configuration options for REE

  In order to speed up tests, the gys script should
  assign the environment values
  to configure GC appropriately for testing


  Scenario: the script sets Environment Variables
    When I run `grease_your_suite.sh`
{% endhighlight %}

How do I know it works?   
I want to check the values of the various Environment Variables.
I tried different variations of:

{% highlight cucumber %}
Then these Environment Variables should be set:
  | RUBY_HEAP_MIN_SLOTS           | 1000000 |
  | RUBY_HEAP_SLOTS_INCREMENT     | 1000000 |
  | RUBY_HEAP_SLOTS_GROWTH_FACTOR | 1       |
  ...
{% endhighlight %}

But, the Environment vars are set in the bash script and they aren't
available any more.  I had to be happy with simply checking the output.

{% highlight cucumber %}
Scenario: the script sets Environment Variables
  When I run `grease_your_suite.sh`
  # output includes message and output from `time`
  Then it should pass with:
  """
  INFO: Configuring REE (re: grease_your_suite)

  real    0m0
  """
{% endhighlight %}

Note that I truncated the expected output from `time`.  Sometimes it ran
in "0m000", sometimes it took "0m001".  That level of specificity didn't
matter for this test "0m0" was close enough.


Getting to <span class='pass'>Green</span>
-----------

I added the aruba dependency, updated
the cucumber env.rb with info from the [aruba readme][aruba], and copied
the grease-your-suite.sh script, that I was already using, into /bin.  

{% highlight sh %}
#!/bin/sh

# Note: to generate this without the ruby gems wrapper, 
#  we used the --no-wrapper arg
echo "INFO: Configuring REE (re: grease_your_suite)"
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000111

time $@
{% endhighlight %}

<span class='fail'>Big 'ole fail</span>

It couldn't find the script.  The bin/ dir in this project's dir is not
in my path.  If I install it, the gem install process will copy it into
my path.
    rake install

<span class='fail'>fail</span>
Make it executable and install again.

<span class='fail'>fail</span>
???.  Oh, rubygems wrapped the "binary" script, expecting it to be ruby
code.  A little research uncovered the `--no-wrappers` option.  This
makes it a little difficult for others to install, but I'll leave it
like this for a while.  Who knows, maybe I'll be smarter later.
    gem install pkg/gyst-0.0.1.gem --no-wrappers  

<span class='pass'>pass</span>.  

Update the readme, add the MIT-LICENSE and copyright, commit, and push.

'night.

---

References
----------
* [aruba][aruba]

{% include backdate_disclaimer.md %}

[aruba]: https://github.com/cucumber/aruba
