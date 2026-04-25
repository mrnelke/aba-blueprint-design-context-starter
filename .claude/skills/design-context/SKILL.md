---
name: design-context
description: Load your design system documentation before working on UI. Use at the start of any session that involves creating or modifying components, pages, layouts, or styling.
user-invocable: true
allowed-tools:
  - Read
  - Grep
  - Glob
---

# Design Context Loader

Load the project design system before making any UI change.

## Steps

### 1. Always read — core rules and tokens

Read these two files on every invocation:

```
DESIGN.md
docs/design-tokens.md
```

### 2. Always read — consistency patterns

```
docs/design-consistency.md
```

### 3. Read based on task type

| Task type | Read this |
|-----------|-----------|
| Building or editing a **product or landing page** | `docs/design-system.md` |
| Building a **new component** | `docs/design-consistency.md` (already read) + check reference implementation |
| Checking actual **token values** in source | Your tokens file (see DESIGN.md for path) |

### 4. After reading, confirm context

State which files were read and list the 3-5 rules most relevant to the current task. This surfaces conflicts before writing code.

---

## Quick Reference (fill in your values after setup)

### Colors
| Token | Value | Use |
|-------|-------|-----|
| `--color-background` | [YOUR VALUE] | Page bg |
| `--color-surface` | [YOUR VALUE] | Cards, panels |
| `--color-accent` | [YOUR VALUE] | Accent — one color |
| `--color-text` | [YOUR VALUE] | Primary text |
| `--color-text-secondary` | [YOUR VALUE] | Secondary text |

### Typography
| Font | Token | Use |
|------|-------|-----|
| [UI FONT] | `var(--font-primary)` | Labels, badges, buttons, nav, code |
| [READING FONT] | `var(--font-heading)` | Body copy, descriptions, notes |

### Spacing (key values)
| Token | Value | Use |
|-------|-------|-----|
| `--space-md` | [YOUR VALUE] | Component internal padding |
| `--space-lg` | [YOUR VALUE] | Section padding |
| `--space-3xl` | [YOUR VALUE] | Page top spacing |

### Borders
All cards: `border: 1px solid rgba(0, 0, 0, 0.5);`
No colored borders anywhere.

### Dark mode
Dark is the default. Light overrides use `[YOUR THEME SELECTOR]`.

---

## Reference Implementations

| Task | Reference file |
|------|---------------|
| Page with standard header | [PATH TO YOUR REFERENCE PAGE] |
| Standard component | [PATH TO YOUR REFERENCE COMPONENT] |
