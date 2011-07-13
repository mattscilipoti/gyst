---
layout: post
title: Day 1 - bundle gem gys
tags:
- gem
- bundler
---


The Inspiration
-----------

<h3 class="r g0"><em>in·spi·ra·tion</em><span style="font:smaller 'Doulos SIL','Gentum','TITUS Cyberbit Basic','Junicode','Aborigonal Serif','Arial Unicode MS','Lucida Sans Unicode','Chrysanthi Unicode';margin:0 0 0 .7em">/ˌinspəˈrāSHən/</span><span class="word_type" style="font-size:smaller;margin:0 .7em">Noun</span></h3>

<p>1. The process of being mentally stimulated to do or feel something, esp. to do something creative:  "flashes of <b>inspiration</b>".</p>

The Ruby community impresses me as it strives for beautiful and elegant code.  The developers in my local [B'more on Rails user group](http://bmoreonrails.org/) continually inspire me to do more.  We have authors, trainers, business owners, community activists, and guys who just quietly write some amazing code.  I'm glad they are here.

But, it's Chris Strom and his [chains](http://japhr.blogspot.com/2011/04/my-chain-3.html) that can ultimately be blamed for this blog.  Why simply create a toolkit, when you can also <del>bore</del> show other people *how* you created it.

Day One
-------
We have slow tests.  Most of the people I talk to have slow tests.  I
thought it might be helpful to gather some of the tools we _all_ use into
a suite.  One toolkit of the scripts, libraries, and patches that we
use to help speed up our tests.  This is not a collection of tips and
tricks.  Rather, the code you read about in other blogs may be found here.
We need a name.  Nick Gauthier's
[Grease-Your-Suite presentation(s)][gys_showoff] were the catalyst for this.  How about "gys"?


In the past, I've created gems using Jeweler, but the [grumblings][bundler1] on [the web][bundler2] indicate
that we can [get by][bundler3] with bundler: <http://gembundler.com/rubygems.html>.
Experiment #1?  Only bundler.

    bundle gem gys

A few gemspec tweaks and `rake install` works.  We're off and running.
You can follow along with the [code on github][gyst].

<span class='update'>Update:</span>
I forgot to mention that we are NOT committing the Gemfile.lock file.
[per Yehuda](http://yehudakatz.com/2010/12/16/clarifying-the-roles-of-the-gemspec-and-gemfile/)   

Tomorrow is the first day of RailsConf 2011.  Getting some sleep.
<br/>
'night

{% include backdate_disclaimer.md %}

[gys_showoff]: http://grease-your-suite.heroku.com/
[gyst]: http://www.github.com/mattscilipoti/gyst
[bundler1]: http://asciicasts.com/episodes/245-new-gem-with-bundler
[bundler2]: http://www.mikeperham.com/2010/08/03/developing-rubygems-with-rvm-and-bundler/
[bundler3]: http://ruby.about.com/od/advancedruby/ss/Creating-And-Distributing-Gems-With-Bundler.htm
