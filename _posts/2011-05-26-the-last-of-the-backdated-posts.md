---
title: Day 10 - The Last of the Backdated Posts
layout: post
---

Completed Backdated Posts for Day 5
-----------------------------------

 * [Day 5a - Hydra <3 raket](/gyst/2011/05/21/hydra-hearts-raket.html)
 * [Day 5b - Factory Girl should :build](/gyst/2011/05/21/factory_girl-should-build.html)

---

My code has style
------------------

I was dissapointed in the inline code formatting, it was too small and
downright unattractive.  I tried a few tweaks and then noticed the
`font-family: monospace`.  Monaco to the rescue.  Tweaking the color
broke the code blocks.  Needed `pre color` css now.

{% highlight css %}

code { 
  color: #4F4F4F;
  font-family: Monaco, "Courier New", monospace;
}
pre { background: #2F2F2F; color: whiteSmoke; padding: 15px;}
pre code { color: whiteSmoke; }

{% endhighlight %}

---

task :default (for blog)
---------------
    $ rake
    Day - 10

---

feedburner
----------

Before I "go public", I need two things: an atom/rss feed and the
ability to add comments.

<http://feedburner.google.com/> is a pretty simple service.  I reviewed
[tom's site](https://github.com/mojombo/mojombo.github.com/) and [these
instructions](http://recursive-design.com/blog/2010/09/14/integrating-jekyll-with-feedburner/).

We need to add an atom.xml, a user link and head link to feedburner, and
we need to register on feedburner.  

* copied the atom.xml, changed the urls.
* rename the "hydra <3 raket" file.  The atom generator balked.
* xml_escape the post.title in atom.xml.
* registered http://mattscilipoti.github.com/gyst/atom.xml at feedburner
* added an img link to <http://feeds.feedburner.com/gyst>.

Here are [the changes](https://github.com/mattscilipoti/gyst/compare/5a163373241aa03e4e5508c00f2daf8aeca08c63...4286a0960f841c9aad810c264053dae42cf8e0f2).   

You can [subscribe today](http://feeds.feedburner.com/gyst).  hint. hint.

---

Enable Comments
---------------

The only references I have seen relating to jekyll and comments utilize
<http://disqus.com>.  Ok.  I can take a hint.  Registration was easy.  I grabbed the
"Universal Code" and pasted it into _layouts/post.html.  Assigned a few
js vars and... we have comments.

The assignments:

{% highlight js %}

<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'gyst-gem'; // required: replace example with your forum shortname

    // The following are highly recommended additional parameters. Remove the slashes in front to use.
    // var disqus_identifier = 'unique_dynamic_id_1234';
    // var disqus_url = 'http://example.com/permalink-to-page.html';
    var disqus_identifier = '{{ page.id }}';
    var disqus_url = 'http://mattscilipoti.github.com/gyst{{ page.url }}';

    /* * * DON'T EDIT BELOW THIS LINE * * */
    ...
    <!-- snipped-->
</script>

{% endhighlight %}


'night.

---

References
----------
* http://recursive-design.com/blog/2010/09/14/integrating-jekyll-with-feedburner/
* https://github.com/mojombo/mojombo.github.com/
