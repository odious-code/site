---
layout: post
title:  "A New Lightsaber"
date:   2025-04-01 00:00:00 +0000
categories: blog tools jekyll
---

Over the years I have considered keeping a blog and for one reason or another have always found reasons not to put something together. Having made the decision to give my thoughts a permalink, I enjoyed procrastinating, a little, about how I was going to deface the internet with my content. 

The philosophy used to guide my choice of solution can be described as somewhere between “not invented here” and using a social media platform. At one end of the spectrum there are social media platforms and platforms like blogger, Tumblr, and WordPress. These are good for cranking out content and offer plenty of customisation and ways of exporting/migrating content, for when the platform becomes stale, uncool, boring, or otherwise undesirable. At the other end of the spectrum, there is writing a blogging application using a web application framework such as rails, .net, node, or flask, these increases the maintenance surface area quite considerably. While there exists some very convenient turnkey tools for hosting web apps, such as Heroku and Digital Ocean, they are not as economical as the cloud platforms they are built on. Platform native solutions for hosting web apps such as AWS, Azure and GCP are very mature, safe and reliable as are their respective hosting options for cloud native platforms. These options all “wiff” of operationally astronautical, at this stage of the project, and feel like overkill.  

Jekyll is a reasonably ubiquitous tool for eagerly rendering html websites from markdown content and offers customisation through simple templating, a bunch of themes, and plugins. The site can be rendered on a local machine and the resulting static site can be dropped onto a webserver using the protocol of choice. It is highly compelling and is my first choice. Rendering content offline and delivering it over the wire through a CDN is, in many cases, the most optimal solution and requires few moving parts. This is the solution I’m intending to implement as my first iteration.  

I’m going to proportionally invest my time across the following three activities:

- Content: Namely drafting, publishing and marketing posts 

- DevOps and technical astronautics:  making the currently simple solution more complicated for the purposes of automation, technical curiosity and as a source of content. 

- Look and feel: Whittling on the visuals of the site so that it looks a little less File>New> Project and little more creative. 


If you would like to peek under the hood you can find the source code for this blog on GitHub @
[odious-code][this-org] /
[site](https://github.com/odious-code/site)


[this-org]: https://github.com/odious-code