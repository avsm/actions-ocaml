#!/bin/sh -e

if [ "$PAGES_DIR" = "" ]; then
  PAGES_DIR="${GITHUB_WORKSPACE}/_build/default/_doc/_html"
fi

git config --global credential.helper 'cache --timeout=120'
git config --global user.email "${GITHUB_ACTOR}@github.com"
git config --global user.name "Github Action"

rm -rf /tmp/docs
mkdir /tmp/docs
cd /tmp/docs
git init
git checkout --orphan gh-pages
git reset
git clean -dxf
cp -r ${PAGES_DIR}/* /tmp/docs/
git add .
git commit -m "Update Pages"
git push -q https://x-oauth-basic:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git gh-pages -f
