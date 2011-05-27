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

# [Grease-Your-Suite Toolkit (gyst)][gyst] <span class="small">by <a href="http://github.com/mattscilipoti">mattscilipoti</a></span>


<div class="description">
  A suite of helpers to aid in speeding up your tests.
</div>

I thought it might be helpful to gather some of the tools we all use to speed up our tests into a toolkit.  One suite of scripts, libraries, and patches.  This is not a collection of tips and tricks. Rather, the code you read about in other blogs may found be here.   

Inspired by Nick Gauthier's ["Grease-Your-Suite" presentation(s)][gys_showoff].

Faster tests? Good.

---

No runtime dependencies (except for the libraries you choose to patch).

---

Head on over to the [github page][gyst] to learn more about gyst, including installation, download, and contribution instructions.

---

Blog Posts
----------
These posts contain a play-by-play account of the creation of the
toolkit.
<ul class="posts">
{% for post in site.posts reversed %}
   <li>
     <span>{{ post.date | date_to_string }}</span> &raquo; 
     <a href="{{site.base-url}}{{ post.url }}">{{ post.title }}</a>
   </li>
{% endfor %}
</ul>

---

Authors
-------

<script type='text/javascript'>
<!--
	var tg='<';
	var name='matt+gyst';
	var at='&#x040;';
	var host1='scilipot';
	var host2='i.name';
	var text='Matt Scilipoti';
	document.write(tg+'a hr'+'ef=mai'+'lto:'+name);
	document.write(at+host1+host2+'>'+text+tg+'/a>');
-->
</script>

We welcome comments, issues, and contributions through [github][gyst]
<!-- Links -->
[gyst]: http://github.com/mattscilipoti/gyst
[gys_showoff]: http://grease-your-suite.heroku.com/

