# Implementation Plan: Post 3 - No Moving Parts: Workflows and Cloudflare

**Branch**: `post_3` | **Date**: 2026-05-23 | **Spec**: [specs/post-3-spec.md](file:///\\wsl.localhost\Ubuntu\home\chris\code\site\specs\post-3-spec.md)

**Input**: Feature specification from `specs/post-3-spec.md`

## Summary
The goal is to draft and publish a high-quality technical blog post titled **"No Moving Parts"**. The article will reflect on the elegant simplicity of a serverless, database-free Jekyll static site architecture. It will detail how publishing is fully automated via GitHub Actions workflows to GitHub Pages (which we recently optimized to resolve Node 20 deprecations and version conflicts) and how it is served globally via Cloudflare (which serves as domain registrar, DNS host, SSL provider, and caching CDN). We will highlight the straightforward nature of the setup and how extremely low maintenance it is to run long-term. The plan also includes generating a custom visual graphic representing "Cloud Workflows" for the article header, verifying the build locally on WSL port `4001`, and updating the `todo.markdown` checklist.

## Technical Context
* **Language/Version**: Markdown, Jekyll Liquid templating.
* **Primary Dependencies**: Jekyll (~> 4.4.1), Minima (~> 2.5).
* **Storage**: Static files in Git repository.
* **Testing**: Local jekyll compilation and manual browser preview on WSL port `4001`.
* **Target Platform**: GitHub Pages.
* **Project Type**: Jekyll Static Blog Site.

## Constitution Check
* **Principle I (Simple & Static)**: **PASS**. The post is plain markdown without dynamic scripts.
* **Principle II (Look & Feel)**: **PASS**. We will generate a premium, high-quality, custom AI graphic representing the "Cloud Serverless Workflows" in a sleek cosmic neon theme to serve as the post header.
* **Principle III (Branching & PR)**: **PASS**. Developed strictly inside the `post_3` branch. We will create a Pull Request for review.
* **Principle IV (Local First Verification)**: **PASS**. Build verification will be run locally in WSL Ubuntu on `http://localhost:4001/` before staging or committing.
* **Security Constraints (Public Repo)**: **PASS**. Absolutely zero credentials, tokens, or private configurations will be touched or checked in.

## Project Structure

### Documentation
```text
specs/
└── post-3-spec.md       # Feature Specification

plans/
└── post-3-plan.md       # This Implementation Plan
```

### Source Code / Assets
```text
_posts/
└── 2026-05-23-no-moving-parts.md             # New Blog Post Markdown

assets/
└── images/
    └── no-moving-parts.png                   # Custom Generated Header Graphic

todo.markdown                                 # Updated Todo Checklist
```

## Structure Decision
The structure uses Jekyll's standard `_posts/` and `assets/images/` directories, alongside Spec Kit's `specs/` and `plans/` documentation folders, ensuring excellent organization and clean, zero-interference compilation.
