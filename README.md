Grease Your Suite Toolkit (gyst)
================================

Purpose
--------
A suite of helpers to aid in speeding up your tests; including scripts,
existing libraries, and patches.

Inspired by [Nick Gauthier's presentation(s)]( http://grease-your-suite.heroku.com/ ).

Faster tests? Good.


Scripts
--------
Various helper scripts.

    grease_your_suite.sh # (TODO) configures REE (different for linux/osx?

    alias gys=grease_your_suite # (TODO)

    rakee # (TODO) runs rake tasks w/ree configured for tests

    raket # (TODO) hydra helper, runs rake tasks w/ree configured for tests & RAILS_ENV=test


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


References
-----------
 * http://m.onkey.org/make-your-shoulda-tests-faster-with-fast_context
 * http://37signals.com/svn/posts/2742-the-road-to-faster-tests
   * http://ola-bini.blogspot.com/2007/12/your-ruby-tests-are-memory-leaks.html
 * http://makandra.com/notes/950-speed-up-rspec-by-deferring-garbage-collection


TODO
-----
Add to rdoc.info
