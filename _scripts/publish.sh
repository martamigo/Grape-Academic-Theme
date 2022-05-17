#!/usr/bin/bash
# Publish to github pages on gh-pages branch

if [ -n "$(git status --porcelain)" ]; then
  echo "Please commit all changes before publishing with this script"
else
  commit_hash=$(git rev-parse HEAD)
  bundle exec jekyll b -d /tmp/gh-pages-publish
  git checkout gh-pages
  cp -r /tmp/gh-pages-publish/* .
  git add .
  git commit -m "publish commit ${commit_hash}"
  git push
  git checkout master
fi