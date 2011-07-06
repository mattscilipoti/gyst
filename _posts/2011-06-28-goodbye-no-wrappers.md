---
title: Day 44 - Goodbye `gem install --no-wrappers`
layout: post
---

----

### Update (06/29, Day 45): Sorry

/me sheepish grin   
I only converted some of the scripts to ruby.  Working on the others.  
Please don't let this reflect on nevans.  The items he helped with work as expected.

### Update (07/05, Day 51): Let's try that again

Ok.  NOW `--no-wrappers` is not required.  See [version 0.0.4](https://rubygems.org/gems/gyst)... or greater.  :)

----

No more `--no-wrappers`
-------

Thank goodness for Baltimore's [Open Source Hack Night](http://www.meetup.com/bmore-on-rails/events/21201421/).  nevans helped me remove the `--no-wrappers` dependency.  Thx.

A Recap
-------
In order to install the gyst gem, prior to today, we needed to use:
    gem install gyst --no-wrappers

Without this flag, the installation wraps the helper scripts in a ruby wrapper.  These scripts are simple bash scripts, not ruby.  Bad news.

How To Convert a Bash script to Ruby script
-------
To remove the `--no-wrappers` arg, we converted the bash scripts to ruby scripts.

1. `#!/bin/sh` --> `#!/usr/bin/env ruby`
2. export --> ENV[]
3. `cmd arg` --> `exec cmd, *ARGV`

Where are the `puts`?
-------

The info messages we had are showing at the command line, but the tests say they are missing.
For testing, `puts` may need to be followed by `stdout.flush`.

`time` keeps changing
-------

The output from time keeps changing?

* Step 1: use regex.
{% highlight cucumber %}
    Then /^the output should report timing$/ do
      Then 'the output should match /real +\d.\d\d/'
      Then 'the output should match /user +\d.\d\d/'
      Then 'the output should match /sys +\d.\d\d/'
    end
{% endhighlight %}

* Step 2: Two different times?   

My system has both a system `time` command and `/usr/bin/time`.  We found that the outputs were similar when we passed `-p`.  From `man time`:   
     -p  The output is formatted as specified by IEEE Std 1003.2-1992 (``POSIX.2'').


<br/>
'night
