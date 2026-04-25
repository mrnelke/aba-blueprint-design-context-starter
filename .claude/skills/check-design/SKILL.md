---
name: check-design
description: Audit components and pages for design system violations. Use after building any new UI, or when reviewing styling for consistency issues.
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Glob
---

# Design System Consistency Check

Audit files for compliance with the project design system.

## Files to Check
$ARGUMENTS

If no files specified, check recently modified components.

## Checklist

### 1. Borders (CRITICAL)

All borders must use the project standard. No colored borders.

Search for violations:
```
rgba(255, 255, 255, *)  →  replace with rgba(0, 0, 0, 0.5)
rgba([ACCENT COLOR], *) →  replace with rgba(0, 0, 0, 0.5)
border-color: var(--color-accent)  →  remove colored border
```

### 2. Card Backgrounds (Light Mode)

Cards must contrast with their container:
- On white/light bg: use grey (`#F5F5F7` or equivalent)
- On grey bg: use white (`#FFFFFF`)
- On dark bg: use `var(--color-surface)`

### 3. Links

Text links must not use accent color:
- Use `color: var(--color-text)` with `text-decoration: underline`
- Hover: `opacity: 0.7` — no color change
- Flag any `color: var(--color-accent)` on a text link

### 4. Typography

Check font assignment:
- Reading text (body, descriptions, list items): `font-family: var(--font-heading)` — [YOUR READING FONT]
- UI chrome (labels, badges, buttons, nav): `font-family: var(--font-primary)` — [YOUR UI FONT]

Flag: wrong font on reading text, or explicit font-family that bypasses tokens.

### 5. Spacing

Must use design tokens:
- `var(--space-xs)` through `var(--space-3xl)`
- Flag: hardcoded `px` or `rem` values that don't match the token scale

### 6. Page Header Standard

For main content pages:
- Must use `[YOUR PAGE HEADER COMPONENT]` — flag any custom h1+p combinations
- Container must have `max-width: var(--container-md)` and correct padding

### 7. Accessibility

- Interactive elements: minimum 44px height
- Focus states: `:focus-visible` — not `:focus`
- Decorative SVGs: `aria-hidden="true"`
- Icon buttons: `aria-label` on the button element

### 8. Dark Mode

Light mode overrides must use `[YOUR THEME OVERRIDE SELECTOR]`:
```css
/* Correct */
:global([data-theme="light"]) .card { background: #F5F5F7; }

/* Wrong */
.card { background: white; }
```

### 9. Button Casing

All button labels: sentence case. First word capitalised, rest lowercase unless a proper noun.

Flag: all-caps labels, title-case labels.

## Output Format

Report findings as:

**Issues found:**
- `file.ext:line` — description of violation — suggested fix

**Files that pass all checks:**
- List passing files

**Summary:**
- X issues found across Y files
