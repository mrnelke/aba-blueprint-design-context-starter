#!/bin/bash
# Design System Validator — PostToolUse hook
#
# Fires after every Edit/Write to a UI file.
# Catches border violations, missing page headers, and component structure issues.
#
# ADAPTING: Change file extension and path patterns to match your framework.
#   See comments on each section below.

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# ── Only validate UI files ───────────────────────────────────────────────────
# ADAPT: change \.svelte$ to your framework extension
if [[ ! "$FILE_PATH" =~ \.svelte$ ]]; then
  exit 0
fi

# Get content — works for both Write (content) and Edit (new_string)
CONTENT=$(echo "$INPUT" | jq -r '.tool_input.content // .tool_input.new_string // empty')

# ── Border checks ─────────────────────────────────────────────────────────────
# Catches white rgba borders (common mistake when copying from light-mode examples)
if echo "$CONTENT" | grep -qE 'border.*rgba\(255, 255, 255'; then
  echo "Warning: Borders should use rgba(0, 0, 0, 0.5) in all modes — not white rgba" >&2
fi

# Catches colored accent borders on cards
# ADAPT: replace the color values below with your accent color
if echo "$CONTENT" | grep -qE 'border.*rgba\(0, 217, 255'; then
  echo "Warning: Card borders should use rgba(0, 0, 0, 0.5) — not the accent color" >&2
fi

# ── Page header check ─────────────────────────────────────────────────────────
# ADAPT: update the path pattern and component name to match your project
# SvelteKit: src/routes/(page1|page2)/\+page\.svelte$
# Next.js:   app/(page1|page2)/page\.tsx$
if [[ "$FILE_PATH" =~ src/routes/[^/]+/\+page\.svelte$ ]]; then
  # ADAPT: replace PageHeader with your actual page header component name
  if ! echo "$CONTENT" | grep -q 'PageHeader'; then
    echo "Warning: Page file is missing the standard page header component. Every main page must use [YOUR PAGE HEADER COMPONENT] — not a custom h1+paragraph. See docs/design-consistency.md." >&2
  fi
fi

# ── Component structure checks ────────────────────────────────────────────────
# ADAPT: update the path to match your components directory
if [[ "$FILE_PATH" =~ src/lib/components ]] || [[ "$FILE_PATH" =~ src/components ]]; then

  # Svelte 5 specific — remove for React/Vue
  if ! echo "$CONTENT" | grep -q '\$props()'; then
    echo "Warning: Component should use Svelte 5 \$props() pattern" >&2
  fi

  if ! echo "$CONTENT" | grep -q 'interface Props'; then
    echo "Warning: Component should define a Props interface" >&2
  fi

  # Framework-agnostic
  if ! echo "$CONTENT" | grep -q '<style'; then
    echo "Warning: Component should include a scoped style block" >&2
  fi

fi

exit 0
