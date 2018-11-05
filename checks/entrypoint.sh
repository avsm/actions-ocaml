#!/bin/sh -ex

cat /github/workflow/event.json


PAYLOAD=$(echo '{}' | jq ".name = \"testcheck\" | .head_sha=\"$GITHUB_SHA\"")

curl -X POST -S -H "Authorization: token $GITHUB_TOKEN" --header "Content-Type: application/json" --header "Accept: application/vnd.github.antiope-preview+json" --data="$PAYLOAD" https://api.github.com/avsm/actions-test/check-runs 
