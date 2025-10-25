#!/bin/sh -l

/jabref/jabkit/bin/jabkit "$@" | tee $GITHUB_STEP_SUMMARY
