---
title: Day 18 - The blog gets a Gemfile
layout: post
---

The blog's Gemfile
-------------------
Using a separate working dir for the blog and code allows me to have a Gemfile specifically for the blog.  Win.  Now I can remove these gems from the gyst Gemfile.  

{% highlight ruby%}
# Gemfile
source :rubygems

gem 'jekyll', '0.10.0' # version for gh_pages
gem 'liquid', '2.0.0'  # version for gh_pages (http://support.github.com/discussions/site/3216-github-pages-liquid-template-tags-not-being-parsed)
gem 'rdiscount' # I haven't found the gh_pages specific version yet.
{% endhighlight %}

Now that I have a Gemfile, I need a .rvmrc.
    echo 'rvm use 1.9.2@gyst_blog --create' > .rvmrc

To ignore, or not to ignore: that is the question
-------------------------------------------------

My name is Matt Scilipoti and I commit [.rvmrc](http://beginrescueend.com/workflow/rvmrc/).   
Usually.  :)

### Reason #1 - standardizes ruby version
All the developers on your project should be using the same version of
ruby.   
Most of the projects I work on _require_ a specific version of ruby.  Either there is some limitation that requires it (e.g. Rails 1.2.6) or we are simply attempting to mirror the production environment as closely as possible.   
Declare it in the .rvmrc, check it in, and, voilà, we all use the correct version.  Simple, convenient, and reduces mistakes.  It just happens.

### Reason #2 - safe working area
It creates a safe working area for your project.  Especially for new
developers.  I can clone your repo, cd repo_name, and `bundle install`
(or equivalent) without worrying about stepping on any other projects (and I have a lot of projects on my computer).  This isn't usually a problem, until we have breaking changes to executables.

### Reason #3 - easy removal
All your dependencies are in one dir.  When your pull request has been
accepted, you can remove all traces by deleting 2 dirs: the source and
the gemset.

### Reason #4 - RTFM
New developers to the project are covered, even if they didn't RTFR(eadme).

### Rebuttals
I have received plenty of rebuttals.  I don't think either of them is worth the trade-off; worth the hassle.  I want setup to be easy, a .rvmrc and a Gemfile give me that.

So... should you commit .rvmrc?
-------------------------------
That said, it's really a decision for the team.  I can always create a .rvmrc for me AND make sure the README has all the information a new developer needs.  

If you work on one of my OSS projects, you'll probably find that .rvmrc is in the repo.  I request that you try it before you attempt to convince me otherwise.  You may like it.   

Or... you may not even notice it.

----

Back to the blog's Gemfile
---------------------------
    cd ..
    cd -
    bundle install
    git add .rvmrc
    git add Gemfile Gemfile.lock

Since this is not a gem, we commit the Gemfile.lock.  [Per Yehuda](http://yehudakatz.com/2010/12/16/clarifying-the-roles-of-the-gemspec-and-gemfile/)

<br/>
'night
