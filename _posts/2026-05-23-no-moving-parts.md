---
layout: post
title:  "No Moving Parts"
date:   2026-05-23 00:00:00 +0000
categories: blog tools deployment hosting
---

[header]: /assets/images/no-moving-parts.png "No Moving Parts"
![No Moving Parts][header]

Having settled on Jekyll as the platform and GitHub as the source control and content management solution, the next decision was how to host the site and get it in front of a browser. The answer, it turns out, was already mostly made for me.

GitHub Pages is a static site hosting service built directly into GitHub. It can serve the output of a Jekyll build straight from a repository, which makes it a natural fit. The content lives in the repository, the build runs automatically, and the result is a live website. There are no servers to provision, no databases to configure, no runtimes to patch, and no bills to dread at the end of the month for low-traffic personal projects. It is, in the most literal sense, a hosting solution with no moving parts.

The publishing workflow is handled through GitHub Actions. When a post is ready to ship, the process is to create a semver tag, open a GitHub Release against that tag, and then manually dispatch the production workflow with the tag name as input. The workflow checks out that exact tag, sets up the Ruby environment, runs the Jekyll build using the gem versions pinned in the Gemfile.lock, and deploys the resulting static files to GitHub Pages. Tying the deployment to a tag rather than the tip of main means every release is pinned and reproducible, and rolling back is a matter of dispatching the workflow again with an earlier tag. The workflow itself is version controlled alongside the content, which means the deployment process is auditable and modifiable like any other piece of the project. It was recently updated to build using ruby/setup-ruby rather than the standard pages action, which resolves a dependency mismatch between the project Gemfile and the environment GitHub Pages assumes, and also opts into the Node.js 24 runner ahead of the platform deadline.

Domain hosting and DNS are handled through Cloudflare. The setup involved registering the domain, pointing the nameservers at Cloudflare, and adding a CNAME record directing the custom domain at the GitHub Pages endpoint. Cloudflare then sits in front of everything, handling SSL termination, global caching through its CDN, and DDoS protection essentially for free at this scale. The CNAME file in the repository root tells GitHub Pages to respond to the custom domain, and that is more or less the entirety of the configuration.

The whole arrangement took a couple of hours to set up from scratch, most of which was waiting for DNS propagation. Day-to-day maintenance is effectively zero. There is no infrastructure to monitor, no certificates to renew manually, no hosting dashboards to log into. Writing a post, opening a pull request, merging it, tagging a release, and dispatching the workflow is the entire publishing pipeline.

This kind of architecture reflects a broader principle worth naming explicitly: the best system for a given context is often the one that does the job reliably while introducing the fewest obligations. A database-backed application can do anything, but it also needs backing up, securing, scaling, and monitoring. A static site cached globally by a CDN just works, and keeps working, without much encouragement.

You can find the source code for this blog on GitHub @
[odious-code][this-org] /
[site](https://github.com/odious-code/site)


[this-org]: https://github.com/odious-code
