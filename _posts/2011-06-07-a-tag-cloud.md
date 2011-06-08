---
title: Day 22 - A Tag Cloud (almost)
layout: post
tags:
- project blog
- tag cloud
- jekyll
---

Is this a blog about a toolkit or a blog about a blog?
------------------------------------------------------

Well... both.  Lately, it's been more of the latter.  Today isn't any
different, except now you'll know that from the start.  I'm adding a tag
cloud.  Today, it should include "project blog".

Categories?
-----------

Jekyll provides some support for tags with its "categories".  Unfortunately,
using categories also changes the route.
    gyst/2011/06/07/a-tag-cloud.html
becomes
    gyst/first_category/second_category/and_so_on/2011/06/07/a-tag-cloud.html
That's not exactly what I was looking for.  Besides, this only provides
`site.categories`.  I really want `post.categories`.

Fortunately, we can add other items to the [YAML Front Matter](https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter). 

{% highlight yaml %}
tags:
- project blog
- tag cloud
- jekyll
{% endhighlight %}

Now we just have to show them, so you can decide if this is a good entry
to ignore.

`post.tags` isn't working.  `page.tags` does much better.

{% literal %}
    <h2>Page Tags</h2>
    <ul id="page_tags">
      {% for tag in page.tags %}
        <li>{{ tag }}</li>
      {% endfor %}
    </ul>
{% endliteral %}

Yea, I know.  It's not exactly a "tag cloud".  And it won't be, but it will be better.  And... I still need a tag cloud for the entire site.

<br/>
'night
