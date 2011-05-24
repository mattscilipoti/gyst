---
layout: post
title: Day 7a - Personal and Project gh_pages can get along
---

Back to basics
--------------

Back to basic routing anyway.  My "normal" blog is a personal gh_pages at
mattscilipoti.github.com.  Following the directions, I had created a
CNAME file to use a custom domain "blog.clearto.me".  Unfortunately, this
also caused the project gh_pages to have the custom domain.  To
experiment, I removed the CNAME file.  It worked as expected.  My pages
stay on mattscilipoti.github.com and the A record entry takes visitors to
blog.clearto.me directly to my personal gh_pages.  Nice.

