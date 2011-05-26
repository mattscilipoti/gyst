---
layout: post
title: Day 9 - Local != Remote
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
It _is_ in my _config.yml, but **not** in Gemfile.  Wait, it's in `gem list`.
I must have installed it manually.  Corrected.


Problems with gyst/
-------------------
On github, the project lives in gyst/   
    mattscilipoti.github.com/gyst
    mattscilipoti.github.com/gyst/2011/05/23/:post-title

The relative css links (`"css/screen.css"`) are not working for posts.

I tried a few different options, and finally settled on:
    <link rel="stylesheet" href="/gyst/css/screen.css" ... >

Also, the posts link, created by the loop that is _finally_ working, do
not include 'gyst'.  How nice.
    mattscilipoti.github.com/2011/05/23/:post-title

Hacked it by hardcoding a "/gyst" in the loop.  Interestingly, using `"/gyst/{{ post.url }}"` creates an extra slash in the url.


Local problems with gyst
-------------------------
Now, all the local references fail because, locally, it lives at the root:
    localhost:4000/

Tried a few options:  
    jekyll --server --auto --base-url gyst
    jekyll --server --auto --base-url /gyst
    jekyll --server --auto --base-url gyst/
    jekyll --server --auto --base-url "gyst"

I couldn't find a valid route for any of those:
    `/' not found.
    `/gyst' not found.

This had no affect:
    jekyll --server --auto --url gyst

Then I found this: <https://github.com/mojombo/jekyll/issues/332>

Looks like I should use `:base-url`

I tried a lot of combinations and, to my disappointment, it looks like I
need to add base-url to _config.yml   
    base-url: /gyst
and run jekyll locally with   
    `jekyll --base-url /gyst/ --server --auto`

Yup, both entries.  And yes, leading and trailing slash at the command
line.

    
    
And...
------
* removed post.css.  It was ignored because stylesheet link wasn't in
  head AND it was simpler to adjust screen.css.
* added `rake chain_days`
* added a README for the blog.

---

References
----------

* <https://github.com/mojombo/jekyll/issues/332>
* <http://www.w3schools.com/tags/tag_base.asp>

