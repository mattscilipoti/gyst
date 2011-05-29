---
title: undefined local variable or method `grease_your_suite' for main:Object (NameError)
layout: post
---

If you receive this error when running rakee or raket, it usually indicates that you forgot the   
`--no-wrappers` flag when installing `gyst`.

From [the readme][gyst]...

>**NOTE:** in order to use the bash scripts, you must use the `--no-wrappers` argument.   
>
>From rubygems:
>     gem install gyst --no-wrappers
>Locally:
>     gem install pkg/gyst-0.?.?.gem --no-wrappers
>
>
>Why do you have to add `-no-wrappers`?  Because the scripts are bash scripts, not ruby scripts.  We are stuck with this workaround until someone finds a better answer for this issue.

References:
-----------

 * <http://help.rubygems.org/discussions/suggestions/12-per-executable-wrappers>

{% include common_links.md %}
