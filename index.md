---
layout: default
title: Grease-Your-Suite Toolkit (gyst)
---

<div class="download">
  <a href="http://github.com/mattscilipoti/gyst/zipball/master">
    <img border="0" width="90" src="http://github.com/images/modules/download/zip.png"></a>
  <a href="http://github.com/mattscilipoti/gyst/tarball/master">
    <img border="0" width="90" src="http://github.com/images/modules/download/tar.png"></a>
</div>

# [gyst][gyst] <span class="small">by <a href="http://github.com/mattscilipoti">mattscilipoti</a></span>


<div class="description">
  A suite of helpers to aid in speeding up your tests.
</div>

A suite of helpers to aid in speeding up your tests; including scripts,
existing libraries, and patches.   

Inspired by Nick Gauthier's ["Grease-Your-Suite" presentation(s)][gys_showoff].

Faster tests? Good.


Dependencies
------------

No runtime dependencies (except for the libraries you choose to patch).

See our GitHub page for more info
---------
To learn more about gyst, including installation, download, and
contribution information.  
Head on over to the [github page][gyst]

Authors
-------

Matt Scilipoti (matt@scilipoti.name)


Blog Posts
----------
<ul class="posts">
{% for post in site.posts %}
   <li>
     <span>{{ post.date | date_to_string }}</span> &raquo; 
     <a href="{{site.base-url}}{{ post.url }}">{{ post.title }}</a>
   </li>
{% endfor %}
</ul>

[gyst]: http://github.com/mattscilipoti/gyst
[gys_showoff]: http://grease-your-suite.heroku.com/

