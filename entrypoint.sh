#!/bin/sh -l

/jabref/jabkit/bin/jabkit check-consistency "$@" >> $GITHUB_STEP_SUMMARY
