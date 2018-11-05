#!/bin/sh -ex

ls -la /github/workflow
jq . /github/workflow/event.json
env

PAYLOAD=$(echo '{}' | jq ".name = \"testcheck\" | .head_sha=\"$GITHUB_SHA\"")

curl -X POST -S -H "Authorization: token ${GITHUB_TOKEN}" --header "Content-Type: application/json" --header "Accept: application/vnd.github.antiope-preview+json" --data "$PAYLOAD" https://api.github.com/repos/avsm/actions-test/check-runs 
