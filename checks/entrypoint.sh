#!/bin/sh -ex

jq . /github/workflow/event.json

curl -S \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/commits/${GITHUB_SHA}/check-runs?check_name=${GITHUB_ACTION}"

PAYLOAD=`echo '{}' | jq ".name = \"checks\" | .head_sha=\"$GITHUB_SHA\" | .output.title=\"checkrunresult\" | .output.summary=\"summary here\" | .output.text=\"longer text here\n### test headings\nand some more *bold*\""`

CHECK_RUN_URL=`cat /github/workflow/event.json | jq -r .url`


curl -X POST -S \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.antiope-preview+json" \
  --data "$PAYLOAD"  ${CHECK_RUN_URL}
