#!/usr/bin/env bash
set -euo pipefail

# Detect the current branch: GITHUB_HEAD_REF is set in PR events, otherwise use GITHUB_REF_NAME
HEAD_BRANCH="${GITHUB_HEAD_REF:-${GITHUB_REF_NAME}}"

# Create the pull request via GitHub API
curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SZGYuval/counter-service-demo/pulls \
  -d "{\"title\":\"Automated PR from ${HEAD_BRANCH}\",\"body\":\"Auto-created PR from branch ${HEAD_BRANCH} via CI\",\"head\":\"${HEAD_BRANCH}\",\"base\":\"feature-branch\"}"