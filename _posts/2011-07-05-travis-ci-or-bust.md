---
title: Day 51 - Continuous Integration or BUST!
layout: post
tags:
- gem
- CI
---

What do open source projects do for Continuous Integration?  
Enter <http://travis-ci.org/>.

Travis is an attempt to create an open-source, distributed build system for the Ruby community that:

1. allows open-source projects to register their repository and have their test-suites run on demand
2. allows users to contribute build capacities by connecting a VM that runs a build agent somewhere on their underused servers

Head to the [github page](https://github.com/travis-ci/travis-ci) to see how to add your project.


`time` needs something to time
---------------------------

Turns out the `time` command on the CI server needs something to well...
time.  Added a simple `echo foo`.
    When I successfully run `grease_your_suite echo FOO`

RAILS_ENV = 'test'
------------------
The generic `rake gyst:info` spec is failing because the RAILS_ENV ==
test.  That seems perfectly acceptable in a test.  I updated the spec to
accept either nil or 'test'.
    Then the output should match /"RAILS_ENV" => (nil|"test")/


We Made It
----------
[![Build Status](https://secure.travis-ci.org/mattscilipoti/gyst.png)](http://travis-ci.org/mattscilipoti/gyst)   
I add this badge to the readme: <http://travis-ci.org/#!/mattscilipoti/gyst>

<br/>
'night
