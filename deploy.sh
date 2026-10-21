#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "==> Syncing DUNCO Catalog to GitHub..."
git add index.html
# Also add any updated PDFs/prototypes if modified
git add -A

if git diff --staged --quiet; then
  echo "No changes detected. Catalog is up to date."
  exit 0
fi

TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
git commit -m "Update catalog: ${TIMESTAMP}"

echo "==> Pushing to GitHub..."
git push origin main
echo "==> Done! Live catalog will update in ~30s on GitHub Pages."
