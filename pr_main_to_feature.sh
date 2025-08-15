#!/usr/bin/env bash
set -euo pipefail


# Create the pull request via GitHub API
create_resp=$(curl -L \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/SZGYuval/counter-service-demo/pulls \
  -d "{\"title\":\"Automated PR from main\",\"body\":\"Auto-created PR from branch main via CI\",\"head\":\"main\",\"base\":\"feature-branch\"}")

PR_NUMBER=$(echo "$create_resp" | jq -r '.number')

echo "Created PR #$PR_NUMBER"

# 2) Merge the PR
curl -sS -L -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${ACCESS_TOKEN}" \
  "https://api.github.com/repos/SZGYuval/counter-service-demo/pulls/${PR_NUMBER}/merge" \
  -d '{"merge_method":"merge"}'