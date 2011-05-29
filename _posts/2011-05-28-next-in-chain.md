---
title: Day 12 - Next Post in the Chain
layout: post
---

Next/Previous
-------------

I was reviewing the site tonight and realized it was a pain to work
through the chain.  Read Day 1, click home, click Day 2, read, click
home.  We need next/previous.

Initially I thought about adding metadata to the [Yaml Front Matter](http://wiki.github.com/mojombo/jekyll/yaml-front-matter).  But, that sounded tedious and I have issues with tedious.  Google led me to [Next/Previous posts](http://groups.google.com/group/jekyll-rb/browse_thread/thread/5bc80ff78c15d235).  I like easy.

I already had the date of the current post listed to the right of the
post title.  That seemed like a good place to add next/previous date.

Starting with the Next/Previous code from above, I converted to a ul,
changed the link text to the post date, and wrapped next/prev around
the current post date and aligned.


I am Committing to Commit More Frequently
------------------------------------------

I also noticed that there were times when I would have many steps
indicated in my walkthrough and only one commit.  This can obfuscate the
actual code changes.  More commits?  Better.

gh_pages Gets Its Own Dir
--------------------------

As you know, this blog is served by Github Pages.  This utilizes a special gh_pages branch.  Since git utilizes a single dir, expecting you to change branches within that dir -- that's what I have been doing.  That makes it difficult to write a blog entry in gh_pages while changning code in master.  Today, I created a new dir gyst_blog and it uses gh_pages branch, while the initial dir (gyst) uses master.  It's amazing what a good night of sleep will do for you.

<br/>
'night
