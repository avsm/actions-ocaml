#!/bin/sh -ex

rm -rf /tmp/docs
mkdir /tmp/docs
rsync -av $GITHUB_WORKSPACE/.git /tmp/docs/.git

git config credential.helper 'cache --timeout=120'
git config user.email "anil@recoil.org"
git config user.name "Github Action"

git -C /tmp/docs checkout --orphan gh-pages
git -C /tmp/docs reset
git -C /tmp/docs clean -dxf
cp -r $GITHUB_WORKSPACE/_build/default/_doc/_html/* /tmp/docs/
git -C /tmp/docs add .
git -C /tmp/docs commit -m "Update Pages"
git -C /tmp/docs push -q https://${GITHUB_PERSONAL_TOKEN}@github.com/${GITHUB_REPOSITORY}.git gh-pages -f
rm -rf /tmp/docs
