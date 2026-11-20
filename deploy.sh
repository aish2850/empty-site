#!/usr/bin/env bash
# One-shot: pushes to GitHub and deploys to Vercel.
# Requires: git, GitHub CLI (gh), Node/npm. Log in once with: gh auth login
set -e
REPO=empty-site
git init -q
git add .
git commit -qm "empty site with txt file"
git branch -M main
gh repo create "$REPO" --public --source=. --push
npx vercel --prod --yes
USER=$(gh api user -q .login)
echo
echo "Test with:"
echo "curl https://raw.githubusercontent.com/$USER/$REPO/main/public/hello.txt"
