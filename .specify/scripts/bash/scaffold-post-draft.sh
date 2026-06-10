#!/usr/bin/env bash

set -e

# Scaffolding script for report-to-blog post creation
# Usage: ./scaffold-post-draft.sh "Blog Post Description" --short-name "short-name"

FEATURE_DESCRIPTION=""
SHORT_NAME=""

# Parse arguments
i=1
while [ $i -le $# ]; do
    arg="${!i}"
    case "$arg" in
        --short-name)
            if [ $((i + 1)) -gt $# ]; then
                echo "Error: --short-name requires a value" >&2
                exit 1
            fi
            i=$((i + 1))
            SHORT_NAME="${!i}"
            ;;
        *)
            if [ -n "$FEATURE_DESCRIPTION" ]; then
                FEATURE_DESCRIPTION="$FEATURE_DESCRIPTION $arg"
            else
                FEATURE_DESCRIPTION="$arg"
            fi
            ;;
    esac
    i=$((i + 1))
done

if [ -z "$FEATURE_DESCRIPTION" ] || [ -z "$SHORT_NAME" ]; then
    echo "Usage: $0 \"Blog Post Title\" --short-name <short-name>" >&2
    exit 1
fi

# Clean up short name
SHORT_NAME=$(echo "$SHORT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-//' | sed 's/-$//')

SCRIPT_DIR="$(CDPATH="" cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT=$(cd "$SCRIPT_DIR/../../.." && pwd)

echo "[scaffold] Delegating branch creation to create-new-feature.sh..."
# Execute the create-new-feature script to build the branch and specs directory
bash "$SCRIPT_DIR/create-new-feature.sh" "$FEATURE_DESCRIPTION" --short-name "$SHORT_NAME" --allow-existing-branch

# Get the checked out branch name
BRANCH_NAME=$(git -C "$REPO_ROOT" branch --show-current)
echo "[scaffold] Active branch is $BRANCH_NAME"

# Create _drafts directory if it doesn't exist
DRAFTS_DIR="$REPO_ROOT/_drafts"
mkdir -p "$DRAFTS_DIR"

# Generate draft post file path
CURRENT_DATE=$(date +%Y-%m-%d)
DRAFT_FILE="$DRAFTS_DIR/${CURRENT_DATE}-${SHORT_NAME}.md"

# Scaffold the blog draft
if [ ! -f "$DRAFT_FILE" ]; then
    cat <<EOF > "$DRAFT_FILE"
---
layout: post
title:  "$FEATURE_DESCRIPTION"
date:   $CURRENT_DATE 00:00:00 +0000
tags: 
img: /assets/images/${SHORT_NAME}.png
---

Write your post introduction here using clear, plain-English analogies. Avoid dense academic jargon.

## Hook (The messy real-world scenario)
Describe a messy, real-world case study, scenario, or failure from your university reports.

## X-Ray (Applying the academic framework to explain why it happened)
Unpack the academic framework. Translate textbook definitions into plain, intuitive concepts. Explain the "why" and "how".

## Takeaway (Actionable, plain-English advice for the reader)
Provide actionable takeaways and plain-English advice that developers, managers, or engineers can apply to their daily work.
EOF
    echo "[scaffold] Created Jekyll draft post: _drafts/${CURRENT_DATE}-${SHORT_NAME}.md"
else
    echo "[scaffold] Draft file _drafts/${CURRENT_DATE}-${SHORT_NAME}.md already exists, skipping creation."
fi

echo "[scaffold] Success! Specs and plans remain local and ignored. Work inside the branch: $BRANCH_NAME"
