#!/bin/sh -l

/jabref/jabkit/bin/jabkit check-consistency "$@" --porcelain >> $GITHUB_STEP_SUMMARY
