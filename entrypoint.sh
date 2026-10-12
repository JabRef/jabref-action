#!/bin/sh

bibfile="$1"

# A failed redirect exits with 1, which is indistinguishable from "inconsistencies found" later on.
if ! {
  echo "## $bibfile"
  echo ""
} >> "$GITHUB_STEP_SUMMARY"; then
  echo "::error::Cannot write job summary to $GITHUB_STEP_SUMMARY"
  exit 2
fi

# jabkit emits one output format per run: txt is a Markdown table for the job summary,
# github-actions emits workflow commands, which GitHub turns into annotations.
/jabref/jabkit/bin/jabkit check consistency "$bibfile" --porcelain --output-format=txt >> "$GITHUB_STEP_SUMMARY"
summary_exit_code=$?
/jabref/jabkit/bin/jabkit check consistency "$bibfile" --porcelain --output-format=github-actions
exit_code=$?

# jabkit exit codes above 1 are errors, which must not be masked by a passing second run.
if [ "$summary_exit_code" -gt 1 ]; then
  echo "::error::Generating the job summary failed (exit code $summary_exit_code)"
  exit "$summary_exit_code"
fi

if [ "$exit_code" -eq 0 ]; then
  echo "✅ no inconsistencies" | tee -a "$GITHUB_STEP_SUMMARY"
elif [ "$summary_exit_code" -eq 1 ]; then
  # --porcelain drops jabkit's legend together with its progress output, so add the legend back
  cat >> "$GITHUB_STEP_SUMMARY" <<'LEGEND'

| Symbol | Meaning                   |
| ------ | ------------------------- |
| x      | required field is present |
| o      | optional field is present |
| ?      | unknown field is present  |
| -      | field is absent           |
LEGEND
fi

exit "$exit_code"
