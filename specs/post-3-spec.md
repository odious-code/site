# Feature Specification: Post 3 - No Moving Parts: Workflows and Cloudflare

**Feature Branch**: `post_3`

**Created**: 2026-05-23

**Status**: Draft

**Input**: User request: "Draft post 3 about GitHub Pages workflows, Cloudflare hosting, and low maintenance setup."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Draft Blog Post Content (Priority: P1)
As a visitor to Chris Isaacs' blog, I want to read a technical, engaging reflection titled **"No Moving Parts"**, so that I can understand how the site is automatically built and deployed via GitHub Actions workflows to GitHub Pages, and served securely through Cloudflare (as DNS, caching, and domain host) with extremely low maintenance overhead.

* **Why this priority**: Core value of the feature; provides the content asset.
* **Independent Test**: Can be read in raw markdown or rendered HTML, offering independent reading value.
* **Acceptance Scenarios**:
  1. **Given** a new file `_posts/2026-05-23-no-moving-parts.md`, **When** the site is compiled, **Then** a new post is accessible on `/2026/05/23/no-moving-parts.html`.
  2. **Given** the post content, **When** read, **Then** it details the GitHub Pages workflow automation, Cloudflare caching, DNS hosting, and the straightforward simplicity of the static architecture.

---

### User Story 2 - Visual Asset Integration (Priority: P2)
As a reader, I want the blog post to have a custom, premium visual graphic at the header (just like Posts 1 and 2), so that it maintains a creative, harmoniously colored look and feel.

* **Why this priority**: Aligns with the core "Look & Feel" principle in the project constitution.
* **Independent Test**: Verifying that a custom generated image exists in `assets/images/` and displays correctly in the post preview.
* **Acceptance Scenarios**:
  1. **Given** an AI-generated image `assets/images/no-moving-parts.png`, **When** the post is viewed, **Then** the image is cleanly aligned below the title.

---

### User Story 3 - Local Server Verification (Priority: P3)
As the site owner, I want to compile and verify the new post locally on my WSL jekyll server, so that I can ensure there are no compilation errors or broken links.

* **Why this priority**: Guarantees production stability before merging or publishing.
* **Independent Test**: Running the local Jekyll server and visiting `http://localhost:4001/` to browse the new post.
* **Acceptance Scenarios**:
  1. **Given** the Jekyll local server on port 4001, **When** the home page is visited, **Then** the third post is listed in chronological order.

## Requirements *(mandatory)*

### Functional Requirements
* **FR-001**: The post file MUST reside in `_posts/` and use the format `2026-05-23-no-moving-parts.md`.
* **FR-002**: The post MUST include Jekyll front matter (layout: post, title: "No Moving Parts", date: "2026-05-23", categories: blog tools deployment hosting).
* **FR-003**: The post MUST contain a custom image named `no-moving-parts.png` in `assets/images/`.
* **FR-004**: The post content MUST be engaging, technical, and refer to GitHub Actions workflows, GitHub Pages deployment, and Cloudflare DNS/caching.
* **FR-005**: The `todo.markdown` file MUST be updated to mark "Publish another post" as completed.

## Success Criteria *(mandatory)*

### Measurable Outcomes
* **SC-001**: The local Jekyll build completes with **zero warnings or errors** in under 2 seconds.
* **SC-002**: The blog post is responsive, visually aligned with the Minima theme, and displays the custom image cleanly.
* **SC-003**: The branch `post_3` is fully prepared with only standard, safe untracked files ready for staging.

## Assumptions
* The local Jekyll development server will automatically pick up and compile the new markdown file.
* The image will be generated using the native Google DeepMind image generation model.
