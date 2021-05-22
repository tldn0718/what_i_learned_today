#!/bin/bash

current_branch="$(git rev-parse --abbrev-ref HEAD)"
branches_cannot_commit_directly=("branch1" "branch2" "branch3")

for branch in "${branches_cannot_commit_directly[@]}"
do
  if [ "$current_branch" = "$branch" ]; then
    echo "You can't commit directly to $current_branch branch"
    exit 1
  fi
done

# Purpose: Prevent direct commits to the some branches
# Usage
# Add or update .git/hooks/pre-commit with this script
# Make it excutable: chmod +x .git/hooks/pre-commit
