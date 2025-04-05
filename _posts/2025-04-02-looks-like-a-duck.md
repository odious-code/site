---
layout: post
title:  "Looks Like A Duck"
date:   2025-04-02 00:00:00 +0000
categories: blog tools
---


[logo]: /assets/images/looks-like-a-duck.png "Looks Like A Duck"
![no image error][logo]

When considering source control for this project, I tried to deliberately think about and judge the options before making what, superficially felt, to be an instinctual choice. From one perspective, thinking about the problem as a content creator and about various content management systems I have worked with and built previously. Then from the other perspective, as a coder, considering the tools which make my life easy and my tasks enjoyable.  I spent a little more time considering this perspective and reminisced about the various source control systems which I have experience with, the influences and the logic used in selecting them, and my early adventures not using version control tools. 

I first learned to code writing small programs and completing small projects, using file systems and removable storage to archive, backup and deliver. Similarly for other audiovisual and multimedia projects. When the projects became bigger, more complex and required close collaboration, using source control became a necessity. When completing our first group project (computer games), most of our hip classmates settled on subversion as the weapon of choice, while fewer of the suspiciously more knowledgeable used CVS, some groups used none and we were the only group to use Visual SourceSafe. While a bit of a bizarre decision, and although it was the only time I used Visual SourceSafe for a project, it highlighted how process preferences can strongly influence tooling choices. Visual SourceSafe didn’t fall under the category of making individual contributors' tasks more enjoyable nor their lives easier, when compared to the alternatives. Source control did protect the team from irrevocable catastrophic failure, with the safety net of auditable chronology. Subsequently, I switched to subversion for my non-commercial projects and professionally began using perforce and, briefly alienbrain for non-code assets, before all disciplines moved onto perforce. Eventually decentralized tools prevailed and git and mercurial superseded cvs and svn. While a lot of my experience was with self-hosting, I also used some of the metered solutions offered by Atlassian and Microsoft. Most recently, in the cloud era, GitHub, GitLab and Atlassian are popular choices. 

The reasons for choosing GitHub, over not using source control, is technocratic, behavioral, and pragmatic. Pragmatically, I know as a human, I will make errors. At different times of the day and on different days of the week, I will either make more or less mistakes, and the average will change over time. Sometimes, I will need to identify and rectify a problem as quickly as possible. Other times I will want to investigate the periphery and understand the contributing factors and root causes which lead to the problem. Source control helps with these situations, either by directly illustrating a problem or indirectly providing temporal breadcrumbs in the vicinity of a problem. The process of committing and pushing code has a near negligible overhead, when sufficiently practiced, and can provide a positively reassuring work cadence. The ritual of periodically getting code into a state where it can be committed, shared and reviewed by others gives the satisfaction of achieving incremental progress. In the same way as ‘test first’ methodologies can be pleasant, in addition to encouraging good habits, especially for those with a preference for task completion and short feedback loops. Smaller and more frequent changes can result in increased quality and help identify process constraints. Technocratically, I intend to create a change review process, by using git(hub) semantics as controls for creating, editing, reviewing and publishing articles. Using Github for content management, versioning and change control reflects my process and tooling biases, makes my life easier, and my tasks enjoyable.
 

P4Merge is a visual diff and merge tool which can be configured for git accordingly: 

## Windows
{% highlight conf %}

[user]
	name = Chris Isaacs
	email = <me at my domain>
[commit]
	gpgsign = true
[merge]
	tool = p4merge
[diff]
	tool = p4merge
[mergetool]
	keepBackup = false
[tag]
	gpgsign = true


{% endhighlight %}

## WSL
{% highlight conf %}

[user]
        name = Chris Isaacs
        email = <me at my domain>
[merge]
        tool = p4merge
[diff]
        tool = p4merge
[mergetool]
        keepBackup = false
[mergetool "p4merge"]
        cmd = p4merge.exe \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"
[commit]
        gpgsign = true
[tag]
        gpgsign = true 

{% endhighlight %}

You can find the source code for this blog on GitHub @
[odious-code][this-org] /
[site](https://github.com/odious-code/site)

[this-org]: https://github.com/odious-code