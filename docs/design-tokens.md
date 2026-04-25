# Design Tokens — Quick Reference

> Fill in your values. Keep the structure — the skills read this file.

---

## Colors

| Token | Value | Use |
|-------|-------|-----|
| `--color-background` | `[e.g. #030213]` | Page background (dark mode) |
| `--color-surface` | `[e.g. #0A0E27]` | Cards, panels, nav (dark mode) |
| `--color-accent` | `[e.g. #00D9FF]` | Primary accent — one color only |
| `--color-text` | `[e.g. #F5F5F5]` | Primary text (dark mode) |
| `--color-text-secondary` | `[e.g. #A0A8C0]` | Secondary text, captions |
| `--color-safe` | `[e.g. #10B981]` | Success states only |
| `--color-critical` | `[e.g. #F43F5E]` | Error states only |
| `--color-warning` | `[e.g. #F59E0B]` | Warning states only |

Light mode: override `--color-surface`, `--color-text`, `--color-background` via your theme selector.

---

## Typography

| Token | Value | Use |
|-------|-------|-----|
| `--font-primary` | `[e.g. 'Inconsolata', monospace]` | UI chrome: labels, badges, buttons, nav, code |
| `--font-heading` | `[e.g. 'Inter', sans-serif]` | Reading text: body copy, descriptions, notes |
| `--font-display` | `[e.g. 2.618rem]` | Main page headlines (H1) |
| `--font-body-size` | `[e.g. 1rem]` | Body text, most UI |
| `--font-small` | `[e.g. 0.786rem]` | Captions, labels, nav items |

---

## Spacing

> Recommended: use a consistent ratio (golden ratio φ = 1.618 works well).

| Token | Value | ~px |
|-------|-------|-----|
| `--space-xs` | `[e.g. 0.618rem]` | 10px |
| `--space-sm` | `[e.g. 0.786rem]` | 13px |
| `--space-md` | `[e.g. 1.129rem]` | 18px |
| `--space-lg` | `[e.g. 1.618rem]` | 26px |
| `--space-xl` | `[e.g. 2.058rem]` | 33px |
| `--space-2xl` | `[e.g. 2.618rem]` | 42px |
| `--space-3xl` | `[e.g. 4.236rem]` | 68px |

---

## Borders

```css
/* Standard card/panel border — all themes */
border: 1px solid rgba(0, 0, 0, 0.5);

/* Subtle border (product page cards) */
border: 1px solid rgba(0, 0, 0, 0.08);

/* No colored borders anywhere */
```

---

## Border Radius

| Token | Value | Use |
|-------|-------|-----|
| `--radius-sm` | `[e.g. 0.236rem]` | Tags, pills |
| `--radius-md` | `[e.g. 0.382rem]` | Buttons, inputs |
| `--radius-lg` | `[e.g. 0.618rem]` | Cards, panels |
| `--radius-full` | `9999px` | Circular elements |

---

## Breakpoints

| Name | Width | Use |
|------|-------|-----|
| Mobile | `< [e.g. 38.2rem]` | Single column, panels hidden |
| Tablet | `[e.g. 38.2–61.8rem]` | Two-column possible |
| Desktop | `> [e.g. 61.8rem]` | Full layout |

---

## Container widths

| Token | Value | Use |
|-------|-------|-----|
| `--container-md` | `[e.g. 61.8rem]` | Main content column |
| `--container-lg` | `[e.g. 100rem]` | Wide layouts, header |
| `--container-xl` | `[e.g. 161.8rem]` | Full bleed (3-column layout max) |
