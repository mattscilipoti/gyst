---
layout: post
title: Day 1 - bundle gem gys
---

Preface
-------

Inspiration
: the process of being mentally stimulated to do or feel something, esp. to do something creative.

That's why I'm here.  The Ruby community impresses me as it strives for beautiful and elegant code.  
The developers in my local [B'more on Rails user group](http://bmoreonrails.org/) continually inspire me to do more.  We have authors, trainers, business owners, community activists, and guys who just quietly write some amazing code.  I'm glad they are here.  

But, it's Chris Strom and his [chains](http://japhr.blogspot.com/2011/04/my-chain-3.html) that can ultimately be blamed for this blog.  Why simply create a toolkit, when you can also <del>bore</del> show other people *how* you created it.

Day One
-------
We have slow tests.  Most of the people I talk to have slow tests.  I
thought it might be helpful to gather some of the tools we all use into
one suite.  One toolkit of the scripts, libraries, and patches that we
use to help speed up our tests.  This is not a collection of tips and
tricks.  Rather, the *code* you read about in other blogs may be here.
We need a name.  Nick Gauthier's
[Grease-Your-Suite presentation(s)][gys_showoff] were the catalyst for this.  
How about "gys"?


In the past, I've created gems using Jeweler, but the [grumblings][bundler1] on [the web][bundler2] indicate
that we can [get by][bundler3] with bundler: <http://gembundler.com/rubygems.html>.
Experiment #1?  Only bundler.

    bundle gem gys

A few gemspec tweaks and `rake install` works.  We're off and running.
You can follow along with the [code on github][gyst].

Tomorrow is the first day of RailsConf 2011.  Getting some sleep.

'night

---
**Disclaimer:** I didn't actually start the blog until about a week into the
project.  Any blog entries prior to 05/23/2011 were created after the
fact.  I tried to have them reflect what happened at the time.

[gys_showoff]: http://grease-your-suite.heroku.com/
[gyst]: http://www.github.com/mattscilipoti/gyst
[bundler1]: http://asciicasts.com/episodes/245-new-gem-with-bundler
[bundler2]: http://www.mikeperham.com/2010/08/03/developing-rubygems-with-rvm-and-bundler/
[bundler3]: http://ruby.about.com/od/advancedruby/ss/Creating-And-Distributing-Gems-With-Bundler.htm
