---
layout: post
title: Day 7b - Parsing, and not parsing, Liquid
---

Jekyll isn't parsing my Liquid?
--------------------------------
I'm still seeing my liquid snippets, which I copied from a working site,
as literal code.  [This issue](http://support.github.com/discussions/site/3216-github-pages-liquid-template-tags-not-being-parsed) recommends downgrading my Liquid (I'm at 2.2.2 also).

YAK 4: Sharing a Gemfile
------------------------
Since it would be difficult to not share the Gemfile.lock.  It makes
sense to simply use a duplicate Gemfile.  This forces me to add
development dependencies to gyst that are, technically, only required by the gyst
blog.  I'm ok with that.
    git checkout master Gemfile

Unfortunately, I can not simply add it here and copy it into "master"
later.  `bundle install` produces: <span class="error">There are no gemspecs at /Users/matt/develop/gems/gyst.</span>
After adding the blog dependencies to the Gemfile on "master" (including
Liquid 2.0.0), we are getting this error:
<span class='error'>YAML Exception: syntax error on line 3, col -1: `'</span>

The perfect place to start using layouts and css
------------------------------------------------
I have no idea why, but my brain decided this was the perfect time to
start using jekyll's [layouts and css](https://github.com/mattscilipoti/gyst/commit/d746243edae4e4529a508359d3d93db84ea14fcd).  

Wanna know what makes it fun?
-----------------------------

The blog posts loop is working now.  :-P   
I expect it was due to the lesson learned last night: 
<span class="lesson">left justify the Liquid tags.</span>   
Or, maybe it was Liquid 2.0.0.   
It gets better...   
We still have the syntax error on line 3, col -1.   
col -1???

Index TLC
---------
Finishing up with a little TLC for index.html (or should I say Index.md).  The copy/paste from
markdown doc didn't go very well.

Blog is simplistic, but presentable.


'night.
