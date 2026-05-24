# Theme Journal: Applying adam-blog to chrisaacs.com

**Branch**: 	heme
**Theme**: [artemsheludko/adam-blog](https://github.com/artemsheludko/adam-blog)
**Started**: 2026-05-24
**Status**: In progress

This is a running journal of decisions, steps, and observations made while
migrating the site from the default Minima theme to adam-blog. It will be
used as source material for a future blog post.

---

## 2026-05-24 — Baseline & Planning

### Current state
- Site running Minima (default Jekyll theme), no customisation beyond a custom
  head.html for favicon links.
- Three posts published, each with a custom PNG image in ssets/images/.
- Pages: About, Todo. Navigation auto-generated from page front matter.
- Posts use categories: — will be renamed to 	ags: for adam-blog compatibility.

### Theme selected: adam-blog
Chosen for its clean minimal aesthetic and feature set that matches current needs:
card-grid home page, hero images on posts, tag cloud, author box, and built-in
search. The theme ships as a standalone repo (not a gem), so files are copied
directly into the project.

### Key decisions made before starting
| Decision | Choice | Reason |
|---|---|---|
| **Fonts** | Keep theme default (Google Fonts CDN) | Merriweather + Lato, already in theme head |
| **Analytics** | Leave blank for now | No tracking ID yet; easy to add later |
| **Disqus** | Skip | No shortname; can enable later |
| **Mailchimp** | Skip | No list URL; can enable later |
| **Favicon** | Keep existing assets, update path in head.html | Already in ssets/images/favicon/ |
| **Categories → Tags** | Rename categories: to 	ags: in all posts | adam-blog uses tag cloud |
| **Todo page** | Hide from nav | Remove 	itle: from front matter |

### Image mapping
Each post already has a hero image — mapped to adam-blog's img: front matter field:
- 
ew-lightsaber.png → A New Lightsaber
- looks-like-a-duck.png → Looks Like A Duck
- 
o-moving-parts.png → No Moving Parts

---

---

## 2026-05-24 — Migration & Integration

### Migration steps completed:
1. **Branch setup**: Created and switched to `theme` branch.
2. **Author profile**: Generated minimalist professional author profile silhouette placeholder at `assets/images/author-silhouette.png`.
3. **Scaffolding**: Cloned `adam-blog` theme, copied layouts (`default.html`, `home-page.html`, `post.html`), includes (`header.html`, `footer.html`, `author-box.html`, etc.), assets (CSS, JS, Fonts), and pages (`about.html`, `tags.html`).
4. **Configuration**:
   - Replaced default Minima theme settings with `adam-blog` properties in `_config.yml`.
   - Wired in pagination settings (6 posts per page).
   - Set up author metadata (name, bio Option A, and profile silhouette photo path).
   - Configured custom social handles (Twitter: `OdiousCode`, GitHub: `chsscs`, LinkedIn: `chrisaacs`).
   - Cleaned up blank integrations for Disqus, analytics, and newsletters.
   - Updated `Gemfile` to include `jekyll-paginate` and remove the `minima` gem.
   - Preserved analytics insertion hook and favicon paths in merged `_includes/head.html`.

### Post and page content updates:
- **Posts**: Renamed `categories:` to `tags:` and added `img:` pointing directly to existing hero images.
- **Index**: Created a themed `index.html` referencing `layout: home-page` and implementing a robust pagination post card grid loop.
- **Todo**: Successfully removed the `title` attribute to hide the page from the main header navigation menu while retaining accessibility at `/todo/`.
- **Page Layout**: Implemented a standalone `page.html` wrapper layout to support custom static pages.

### Audit & Bug Fixes:
After initial server execution, performed a comprehensive review with a browser preview agent, which highlighted 4 key bugs that were successfully resolved:
1. **Double-Path Hero Image Prefixing**: Fixed a bug where both the layout and front matter prepended `/assets/images/`, resulting in broken URLs. Rewrote layouts (`post.html` and `recent-post.html`) to reference `post.img` directly.
2. **Missing Pages (404 on Tags)**: Added `include: [_pages]` directive to `_config.yml` so Jekyll parses pages located in the `_pages/` subfolder.
3. **Empty Post Grid**: Fixed blank home page by adding the paginator loop to `index.html`.
4. **Author Box Placeholder Cleanup**: Cleaned up the theme's default demo contact detail fallbacks (artemsheludko's details) and mapped config keys properly (using `twitter_username`, `linkedin_username`, and `github_username`).
5. **About Page Merge & Conflict Resolution**: Resolved build conflict where both `about.markdown` and `_pages/about.html` mapped to `/about/`. Merged the markdown text into a beautifully styled themed layout in `_pages/about.html` that uses custom social icons dynamically driven by config, and removed the conflicting root-level `about.markdown`.

<!-- Future entries will be added here as work progresses -->

