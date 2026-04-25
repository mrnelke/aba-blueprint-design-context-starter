# Design System — [YOUR PROJECT NAME]

Full system specification. Fill in your values. Delete sections that don't apply.

---

## Philosophy

[Write 2-3 sentences about your design philosophy. Example: "We use a golden ratio spacing system because it creates natural visual harmony without arbitrary decisions. Dark mode is the default because our audience works in developer environments. Two fonts because monospace signals precision, and a readable serif/sans builds trust in content."]

---

## Color System

### Brand palette

| Name | Hex | Role |
|------|-----|------|
| Background | `[e.g. #030213]` | Page background — dark mode |
| Surface | `[e.g. #0A0E27]` | Cards, panels, sidebars — dark mode |
| Accent | `[e.g. #00D9FF]` | The one color. CTAs, highlights, key interactions |
| Text | `[e.g. #F5F5F5]` | Primary text — dark mode |
| Text Secondary | `[e.g. #A0A8C0]` | Supporting text, captions, placeholders |
| Safe | `[e.g. #10B981]` | Success — verdicts and system status only |
| Critical | `[e.g. #F43F5E]` | Error — verdicts and system alerts only |
| Warning | `[e.g. #F59E0B]` | Caution — verdicts and system alerts only |

### Light mode equivalents

| Token | Light value |
|-------|-------------|
| `--color-background` | `[e.g. #FFFFFF]` |
| `--color-surface` | `[e.g. #F5F5F7]` |
| `--color-text` | `[e.g. #030213]` |

### Rules

- Accent is for interactive elements and highlights — not decoration
- Semantic colors (safe/critical/warning) never appear inside content cards
- No gradients on text
- No colored borders

---

## Typography System

### Fonts

| Font | Token | Character |
|------|-------|-----------|
| [UI font name] | `var(--font-primary)` | [Why you chose it] |
| [Reading font name] | `var(--font-heading)` | [Why you chose it] |

### Scale

Three sizes. No intermediate values.

| Role | Token | Value | Use |
|------|-------|-------|-----|
| Display | `var(--font-display)` | `[e.g. 2.618rem]` | Main headlines only |
| Body | `var(--font-body-size)` | `[e.g. 1rem]` | Primary text, UI |
| Small | `var(--font-small)` | `[e.g. 0.786rem]` | Captions, labels, nav |

### Assignment

**UI font** goes on: labels, badges, buttons, nav, prices, code, form inputs, short card titles

**Reading font** goes on: body paragraphs, descriptions, list items, explanatory notes, anything users read for comprehension

---

## Spacing System

### Scale

[Describe your spacing rationale. Example: "Based on golden ratio φ = 1.618. Each step is the previous multiplied by φ. This produces natural-feeling gaps without having to make arbitrary decisions."]

| Token | Value | px |
|-------|-------|----|
| `--space-xs` | [value] | [px] |
| `--space-sm` | [value] | [px] |
| `--space-md` | [value] | [px] |
| `--space-lg` | [value] | [px] |
| `--space-xl` | [value] | [px] |
| `--space-2xl` | [value] | [px] |
| `--space-3xl` | [value] | [px] |

### Rules

- All spacing via tokens — no hardcoded `px` values
- Padding inside components: `space-md` to `space-lg`
- Gap between sections: `space-2xl` to `space-3xl`
- Page top padding: `space-3xl` (consistent across all pages)

---

## Dark / Light Mode

Dark is the default theme. CSS custom properties are defined for dark mode at the root.

Light mode overrides use `[YOUR THEME SELECTOR]`:

```css
/* Example: data-theme attribute */
:root { --color-background: #030213; }
[data-theme="light"] { --color-background: #FFFFFF; }

/* Scoped component override */
:global([data-theme="light"]) .card {
  background: #F5F5F7;
}
```

Never write light-first styles. Dark is always the base.

---

## Layout System

### Page structure

```
Header (sticky, [height])
  Main content
    [YOUR LAYOUT PATTERN - single column / 3-column / etc.]
Footer
```

### Content widths

| Name | Value | Use |
|------|-------|-----|
| Narrow | `[e.g. 560px]` | Forms, focused content |
| Content | `var(--container-md)` | Main reading column |
| Wide | `[e.g. 960px]` | Dashboard layouts |
| Full | `var(--container-xl)` | Full-bleed wrappers |

### Breakpoints

| Name | Width | Behavior |
|------|-------|----------|
| Mobile | `< [value]` | Single column, sidebars hidden |
| Tablet | `[range]` | [describe] |
| Desktop | `> [value]` | [describe] |

---

## Component Conventions

### Structure (adapt to your framework)

Every component should have:
1. A typed Props interface
2. Default prop values
3. Scoped styles using design tokens
4. Light mode override if it has a background or border color
5. `aria-hidden="true"` on decorative SVGs

### Reference implementation

[Link to your reference component — the one you'd show a new team member as "build it like this"]

---

## Decision Log

Use this section to record design decisions that aren't obvious from the tokens alone.

| Date | Decision | Reason |
|------|----------|--------|
| [date] | [decision] | [why] |

Example:
| 2026-02-01 | Borders use `rgba(0,0,0,0.5)` in both modes | Single border value means no per-component theme override needed |
| 2026-03-15 | No colored left-borders on cards | Left borders signal urgency/status — content cards are neutral |
