#!/data/data/com.termux/files/usr/bin/env bash

# Get repository list with specified fields
echo "Fetching repository list..."

gh repo list \
  --limit 1000 \
  --json name,diskUsage,visibility \
  --jq '[
    .[] | {
      repo_name: .name,
      repo_size: .diskUsage,
      visibility: .visibility
    }
  ]' > repolist.json

# Verify the file was created
if [ -f "repolist.json" ]; then
  echo "✓ Repository list saved to repolist.json"
  echo "Total repositories: $(jq '. | length' repolist.json)"
else
  echo "✗ Failed to create repolist.json"
  exit 1
fi
