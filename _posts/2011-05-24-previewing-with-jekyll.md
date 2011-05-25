---
layout: post
title: Local != Remote
---

Mr. Hyde Appears
----------------

What?  This looks great on my local `jekyll --server`, why doesn't it
look right at github?  Argh.

First, I made sure I was using the right versions:
    jekyll => 0.10.0
    liquid => 2.0.0
    rdiscount => wait... what?

No rdiscount.  `/me hangs head`   
It is my _config.yml, but not in Gemfile.  Wait, it's in `gem list`.
Oh, I installed it manually.



Problems with gyst/
-------------------



jekyll --server --auto --base-url gyst
    `/gyst' not found.


https://github.com/mojombo/jekyll/issues/332


And... I added a README for the blog.


References
----------

* https://github.com/mojombo/jekyll/issues/332
* http://www.w3schools.com/tags/tag_base.asp
