#!/bin/sh

bibfile="$1"

{
  echo "## $bibfile"
  echo ""
} >> "$GITHUB_STEP_SUMMARY"

# jabkit emits one output format per run: txt is a Markdown table for the job summary,
# github-actions emits workflow commands, which GitHub turns into annotations.
/jabref/jabkit/bin/jabkit check consistency "$bibfile" --porcelain --output-format=txt >> "$GITHUB_STEP_SUMMARY"
/jabref/jabkit/bin/jabkit check consistency "$bibfile" --porcelain --output-format=github-actions

exit_code=$?

if [ "$exit_code" -eq 0 ]; then
  echo "✅ no inconsistencies" | tee -a "$GITHUB_STEP_SUMMARY"
elif [ "$exit_code" -eq 1 ]; then
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
