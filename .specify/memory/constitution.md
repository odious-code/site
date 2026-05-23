# Chris Isaacs Personal Blog Constitution

## Technology Stack & Environment
* **Platform**: Jekyll 4.4.1 static site generator.
* **Theme**: Minima (~> 2.5) overridden for custom assets and layout overrides.
* **Environment**: Local testing executed inside Windows Subsystem for Linux (WSL) Ubuntu.
* **Hosting**: GitHub Pages deployed via custom GitHub Actions (`production.yml` calling `pipeline.yml` using modern `ruby/setup-ruby` and `bundle exec jekyll build`).

## Core Principles

### I. Simple, Static, & Content-Focused
The site compiles strictly into flat, lightning-fast static HTML. Content is drafted in Markdown (`_posts/`) and styled elegantly. Avoid complex JS libraries or client-side overhead unless explicitly required.

### II. Look & Feel (Premium Aesthetics)
Visuals must look creative, harmoniously colored, and professional. Avoid default browser elements or generic, plain styling. Any modifications or assets (like AI-generated graphics) should enhance readability and design premium feel.

### III. Branching & PR-Driven Development
All substantial updates (including writing new posts, visual whittling, or workflow modifications) must be performed in isolated Git feature branches (e.g., `post_3`). No direct commits to `main`. 

### IV. Local First Verification
Every modification must be built and tested locally in the WSL development server on port `4001` (`bundle exec jekyll serve --host 0.0.0.0 --port 4001`) before any code is pushed or published to GitHub.

## Security Constraints (Public Repository)
* **Zero Credential Leaks**: Because this is a **public repository**, no API keys, private credentials, session tokens, or local environment variables may ever be committed or pushed.
* **Strict Exclusions**: `.vscode/` settings and private/local agent files (such as files prefixed with `private*` or suffixed with `_local*`) are strictly excluded from source control via `.gitignore`.
* **Explicit User Gate**: All Git commits and pushes must be explicitly presented to and approved by the user before execution.

## Governance
* This constitution governs all code generation, content creation, and workflow changes in this repository.
* Any changes to this specification or workflow must be discussed, drafted in a branch, and approved via a Pull Request review.

**Version**: 1.0.0 | **Ratified**: 2026-05-23 | **Last Amended**: 2026-05-23
