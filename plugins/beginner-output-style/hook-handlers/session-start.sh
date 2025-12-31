#!/bin/bash

# Beginner Teacher Plugin - SessionStart Hook
# Reads teaching instructions from TEACHING_INSTRUCTIONS.md and injects them into context

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTRUCTIONS_FILE="${SCRIPT_DIR}/../TEACHING_INSTRUCTIONS.md"

# Read and escape the markdown content for JSON
# - Escape backslashes first
# - Escape double quotes
# - Convert newlines to \n
CONTENT=$(cat "$INSTRUCTIONS_FILE" | \
    sed 's/\\/\\\\/g' | \
    sed 's/"/\\"/g' | \
    sed 's/\t/\\t/g' | \
    awk '{printf "%s\\n", $0}' | \
    sed 's/\\n$//')

# Output the JSON structure
cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "${CONTENT}"
  }
}
EOF

exit 0
