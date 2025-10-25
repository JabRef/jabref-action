#!/usr/bin/env bash
set -o pipefail

echo "# $1" >> $GITHUB_STEP_SUMMARY
echo "" >> $GITHUB_STEP_SUMMARY

shift

/jabref/jabkit/bin/jabkit "$@" 2>&1 | tee -a "$GITHUB_STEP_SUMMARY"
exit ${PIPESTATUS[0]}
