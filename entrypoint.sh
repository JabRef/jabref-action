#!/usr/bin/env bash
set -o pipefail
/jabref/jabkit/bin/jabkit "$@" 2>&1 | tee -a "$GITHUB_STEP_SUMMARY"
exit ${PIPESTATUS[0]}
