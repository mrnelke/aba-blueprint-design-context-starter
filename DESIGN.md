# Design Guide — [YOUR PROJECT NAME]

All design documentation lives in `docs/`. This file is the index.

---

## Quick reference

| Need | File |
|------|------|
| Colors, spacing, typography tokens | [`docs/design-tokens.md`](docs/design-tokens.md) |
| Card patterns, buttons, badges, icons | [`docs/design-consistency.md`](docs/design-consistency.md) |
| Full design system spec and rationale | [`docs/design-system.md`](docs/design-system.md) |

---

## Core rules (read before building any new page or component)

1. **Colors** — `[YOUR ACCENT COLOR]` is the only accent color in content. Semantic colors (green=success, red=error, amber=warning) are reserved for system alerts and verdicts only.

2. **Typography** — two fonts: `[YOUR UI FONT]` for UI chrome (labels, badges, buttons, nav); `[YOUR READING FONT]` for body copy, descriptions, and any text that requires reading.

3. **Button casing** — sentence case only. First word capitalised, rest lowercase unless a proper noun.

4. **Borders** — `rgba(0, 0, 0, 0.5)` for all cards and panels. No colored borders anywhere.

5. **Spacing** — use design tokens only. No arbitrary `px` values.

6. **Dark mode** — dark is the default theme. Light mode overrides use `[YOUR FRAMEWORK'S THEME OVERRIDE PATTERN]`.

---

## Design token source

Tokens are defined in `[PATH TO YOUR TOKENS FILE]`. The quick reference in `docs/design-tokens.md` mirrors them but the source file is authoritative.
