#!/bin/sh -ex

git config credential.helper 'cache --timeout=120'
git config user.email "anil@recoil.org"
git config user.name "Github Action"

rm -rf /tmp/docs
mkdir /tmp/docs
cd /tmp/docs
git init
git checkout --orphan gh-pages
git reset
git clean -dxf
#cp -r $GITHUB_WORKSPACE/_build/default/_doc/_html/* /tmp/docs/
cp -r $GITHUB_WORKSPACE/*.opam /tmp/docs/
git add .
git commit -m "Update Pages"
git push -q https://${GITHUB_PERSONAL_TOKEN}@github.com/${GITHUB_REPOSITORY}.git gh-pages -f
