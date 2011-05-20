Grease Your Suite Toolkit (gyst)
================================

Purpose
--------
A suite of helpers to aid in speeding up your tests; including scripts,
existing libraries, and patches.

Inspired by Nick Gauthier's ["Grease-Your-Suite" presentation(s)][gys_showoff].

Faster tests? Good.


Scripts
--------
Various helper scripts.

    grease_your_suite.sh # configures REE (different for linux/osx?

    rakee # (TODO) runs rake tasks w/ree configured for tests

    raket # (TODO) hydra helper, runs rake tasks w/ree configured for tests & RAILS_ENV=test

### `grease_your_suite.sh (gys)`
---
This script configures Ruby Enterprise Edition
(REE) for testing,
as [suggested here][gys_showoff].
Usually used as a helper script for rake tasks.  Also useful for a
group of specs.

We recommend you use an alias:
    alias gys=grease_your_suite.sh

Usage:
    gys rspec spec
    gys rspec -cfs spec/a_sub_dir


API
----

### Libraries
---
    require 'gyst' # (TODO) enables all the libraries and applies all the patches

#### DbNull
Yells if you try to access the db

    require 'gyst/db_null' # (TODO)


### Patches
---
    require 'gyst' # (TODO) enables all the libraries and applies all the patches

#### Factory Girl
Sets default_strategy to :build

    require 'gyst/factory_girl' # (TODO) all factory_girl enhancements (rspec, test_unit, etc)
    require 'gyst/factory_girl/rspec' # (TODO) just patch for rspec
    require 'gyst/factory_girl/test_unit' # (TODO) just patch for
Test::Unit


Tested On
--------------
Ruby 1.9.2 (p180)

References
-----------
 * https://github.com/ngauthier/Grease-Your-Suite
 * http://m.onkey.org/make-your-shoulda-tests-faster-with-fast_context
 * http://37signals.com/svn/posts/2742-the-road-to-faster-tests
   * http://ola-bini.blogspot.com/2007/12/your-ruby-tests-are-memory-leaks.html
 * http://makandra.com/notes/950-speed-up-rspec-by-deferring-garbage-collection



TODO
-----
Add to rdoc.info
Multi-ruby testing: 
  http://rails-bestpractices.com/blog/posts/11-test-your-rubygem-under-different-rubies
  https://github.com/tomas-stefano/infinity_test


[gys_showoff]: http://grease-your-suite.heroku.com/  "Grease Your Suites"
