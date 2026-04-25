#!/bin/bash
# Design Context Reminder — PreToolUse hook
#
# Fires before editing any UI file and surfaces the relevant design rules.
# Three tiers: main pages (full spec), components (token quick-ref), everything else (one-liner).
#
# ADAPTING: Change the file extension patterns to match your framework.
#   SvelteKit: \.svelte$
#   React:     \.(tsx|jsx)$
#   Vue:       \.vue$
#   Astro:     \.astro$
#
# Also update the main page pattern (line ~25) to match your routing convention.

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# ── Only fire for UI files ───────────────────────────────────────────────────
# ADAPT: change \.svelte$ to match your framework
if [[ ! "$FILE_PATH" =~ \.svelte$ ]]; then
  exit 0
fi

# ── Main route/page files: full container spec ───────────────────────────────
# ADAPT: change this pattern to match your main page file convention
# SvelteKit: src/routes/(page1|page2|page3)/\+page\.svelte$
# Next.js:   app/(page1|page2)/page\.tsx$
# Vue/Nuxt:  pages/(page1|page2)/index\.vue$
if [[ "$FILE_PATH" =~ src/routes/[^/]+/\+page\.svelte$ ]]; then
  echo "Design reminder (page file):" >&2
  echo "  - Title/description: use [YOUR PAGE HEADER COMPONENT] — never a custom h1+p combo" >&2
  echo "  - Container: max-width: var(--container-md); margin: 0 auto; padding: 0 var(--space-md)" >&2
  echo "  - Top spacing: padding-top: var(--space-3xl) on the outer page wrapper" >&2
  echo "  Run /design-context for the full rule set." >&2
  exit 0
fi

# ── Component files: token quick-reference ───────────────────────────────────
# ADAPT: change this path to match your components directory
if [[ "$FILE_PATH" =~ src/lib/components ]] || [[ "$FILE_PATH" =~ src/components ]]; then
  echo "Design (component): borders=rgba(0,0,0,0.5) | dark-mode=[YOUR THEME SELECTOR] | spacing=var(--space-*) | fonts: [UI FONT]=chrome, [READING FONT]=body text | Run /design-context for full rules." >&2
  exit 0
fi

# ── All other UI files ───────────────────────────────────────────────────────
echo "Design: run /design-context if not already loaded this session." >&2
exit 0
