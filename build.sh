#!/usr/bin/env bash

set -euo pipefail

if [ -z "${SLACK_JOIN_URL:-}" ]; then
  echo "error: SLACK_JOIN_URL environment variable is not set." >&2
  echo "Set it locally, e.g.: SLACK_JOIN_URL='https://join.slack.com/...' bash build.sh" >&2
  echo "On Netlify, set it under Site settings > Environment variables." >&2
  exit 1
fi

rm -rf target
mkdir -p target

cp resources/favicon.png resources/_redirects target/

encoded="$(printf '%s' "$SLACK_JOIN_URL" | base64 | tr -d '\n')"
# Base64 can have `/` but cannot have `#`.
sed "s#__JOIN_URL_B64__#${encoded}#" resources/index.html > target/index.html
