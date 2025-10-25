#!/usr/bin/env bash
set -o pipefail

echo "# $1" >> $GITHUB_STEP_SUMMARY
echo "" >> $GITHUB_STEP_SUMMARY

shift

/jabref/jabkit/bin/jabkit "$@" 2>&1 | tee -a "$GITHUB_STEP_SUMMARY"

exit_code=${PIPESTATUS[0]}

if [ "$exit_code" -eq 0 ]; then
  echo "✅ no inconsistencies" | tee -a "$GITHUB_STEP_SUMMARY"
fi

exit "$exit_code"
