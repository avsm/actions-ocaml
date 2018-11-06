#!/bin/sh -ex

jq . /github/workflow/event.json

RUN_INFO=`curl -S \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.antiope-preview+json" \
  "https://api.github.com/repos/${GITHUB_REPOSITORY}/commits/${GITHUB_SHA}/check-runs?check_name=${GITHUB_ACTION}"`
CHECK_RUN_URL=`echo "${RUN_INFO}" | jq -r '.check_runs[0].url'`

PAYLOAD=`echo '{}' | jq ".name = \"checks\" | .head_sha=\"$GITHUB_SHA\" | .output.title=\"checkrunresult\" | .output.summary=\"summary here\" | .output.text=\"longer text here\n### test headings\nand some more *bold*\""`

curl -X PATCH -S \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.github.antiope-preview+json" \
  --data "$PAYLOAD"  ${CHECK_RUN_URL}
