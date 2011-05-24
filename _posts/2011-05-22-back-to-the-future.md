---
layout: post
title: Day 6 - Back to the Future aka. "Gyst Blog. Day One is Day Six."
---

Wherein a blog is created, starting 6 days ago
----------------------------------------------

I decided to setup a blog for [gyst](http://github.com/mattscilipoti/gyst) today.  The hope is to use this to report my
gyst "chain".  Backdated posts will be created for the first few days.
Expect these posts to have "all the warts"... and yaks.

I went with [gh_pages](http://pages.github.com/) and [jekyll](https://github.com/mojombo/jekyll).  It seemed like the easiest way to get a blog associated with a project.  Following the instructions, I ensured my repo was clean, clicked the "auto generate" button and, voilà, ziss blog was born.  As a single, index.html page.

[Yak One](http://sethgodin.typepad.com/seths_blog/2005/03/dont_shave_that.html): the gh_pages branch
----------------------------

Github has chosen to create these pages in a special branch: gh_pages.  Thanks to github for making this a little easier.  That button was nice.  I switched to the new branch (`git checkout -t origin/gh_pages`) and `git status` shows me that all the files that were git-ignored in the code branches (master) are not accounted for here.  Copying .gitignore solved that issue.  That means Gemfile.lock is ignored by both and, therefore, shared by both.  This will get out of synch, a minor drawback when adding blog entries, but I don't see a better way right now.

Yak Two: redcarpet
------------------

Jekyll hasn't been updated to support redcarpet, github's [latest Markdown parser](https://github.com/blog/832-rolling-out-the-redcarpet).  MattHall provided [a pull request](https://github.com/mojombo/jekyll/pull/318).  How do I use this in the gh_pages branch?  I tried installing it to 1.9.2@global, but kept getting:
    `Could not find RubyGem jekyll (>= 0) (Gem::LoadError)`
    from /Users/matt/.rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1/rubygems.rb:248:in `activate'
    	from /Users/matt/.rvm/rubies/ruby-1.9.2-p180/lib/ruby/site_ruby/1.9.1/rubygems.rb:1276:in `gem'
    	from /Users/matt/.rvm/gems/ruby-1.9.2-p180@global/bin/jekyll:18:in `<main>'
That's in the jekyll "binary wrapper".  I assumed it was something to do with installing it from a github repo and reverted to the rubygems hosted gem (0.10.0).

Setup for Jekyll
----------------

Converting a single index.html into a jekyll project was pretty simple.
I reviewed [install](https://github.com/mojombo/jekyll/wiki/Install) and [usage](https://github.com/mojombo/jekyll/wiki/usage) on the wiki, then created `_posts/` and created `_config.yml`:
    lsi: false
    markdown: rdiscount
    pygments: true
    safe: true
The "markdown:" entry is from the [install page](https://github.com/mojombo/jekyll/wiki/Install).   
Runnning `jekyll && open _site/index.html` showed... the same page as
before, but now it's part of my jekyll'd site.

List the posts
---------------

Now, I need to see this post.  I grabbed this from another jekyll site:   
{% literal %}
     <h2>Blog Posts</h2>
     <ul class="posts">
       {% for post in site.posts %}
         <li>
           <span>{{ post.date | date_to_string }}</span> &raquo; 
           <a href="{{ post.url }}">{{ post.title }}</a>
         </li>
       {% endfor %}
     </ul>
{% endliteral %}

Yak 3: Liquid is not parsing
----------------------------

But the liquid entries were not parsed.  Instead, I saw the code inside a list
item:   
{% literal %}
    <ul>
      <li>
        {% for post in site.posts %}
          {{ post.date | date_to_string }}  &raquo; 
          <a href="{{ post.url }}">{{ post.title }}</a>
        {% endfor %}
      </li>
    </ul>
{% endliteral %}

Remembering something about a jekyll server, I searched and found this:
    jekyll --server --auto

Which showed me an error indicating that "Liquid was not properly
terminated."
After trying a few things, I moved the _posts dir to /tmp.  The error
disappeared, but it still wasn't parsing the liquid (now using
localhost:4000).  I tried a few more things, including removing
everything from index.html except for the blog loop.  No dice.

<b>Punt</b>.  Manually added a li for this page.

Yak 4: github parses it differently
------------------------------------

Reviewing the published page, I see the Liquid literal tags... literaly.   
Removed.  Pushed.  Now, all the liquid tags are gone from the samples.   
Re-added literal tags, ensuring they were not indented.

Is it ready?  Good enough.   
Update the homepage entry on github.   


Tomorrow?
---------
parsing, layout, use markdown for index.

'night.

---

### References

* http://sethgodin.typepad.com/seths_blog/2005/03/dont_shave_that.html
* http://pages.github.com/
* https://github.com/mojombo/jekyll
* https://github.com/mojombo/jekyll/wiki/_pages
* http://i5m.co.uk/code/2011/05/03/Some-Thoughts-On-Jekyll.html
* https://github.com/mojombo/jekyll/pull/318
