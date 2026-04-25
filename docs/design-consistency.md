# Design Consistency Guide

Quick reference for maintaining visual consistency. Fill in your values and patterns.

---

## Color Rules

### The rule

Content pages use **one accent color only**: `[YOUR ACCENT COLOR]`. Semantic colors (safe/critical/warning) are reserved for system alerts, verdicts, and status indicators — never for decorative use.

### Neutral cards (no tint)

```css
background: var(--color-surface);
border: 1px solid rgba(0, 0, 0, 0.5);
border-radius: var(--radius-lg);
```

### Where semantic colors are allowed

| Color | Token | Allowed in |
|-------|-------|------------|
| Accent | `var(--color-accent)` | CTAs, highlights, interactive elements |
| Safe | `var(--color-safe)` | Success states, verdicts |
| Critical | `var(--color-critical)` | Error states, risk warnings |
| Warning | `var(--color-warning)` | Caution states, alerts |

---

## Typography on Pages

### The rule

Two fonts, two jobs:

| Role | Font | Token | Used for |
|------|------|-------|---------|
| Reading text | [YOUR READING FONT] | `var(--font-heading)` | Body paragraphs, descriptions, list items, notes |
| UI chrome | [YOUR UI FONT] | `var(--font-primary)` | Labels, badges, buttons, nav, prices, short titles |

### What gets reading font

- Body paragraphs
- Descriptive text under headings
- List items that form sentences
- Explanatory notes

### What keeps UI font

- Buttons and form inputs
- Navigation links
- Tags, badges, pills
- Prices
- Short bold card titles

---

## Button Rules

### Casing

**Sentence case only.** First word capitalised, rest lowercase unless a proper noun.

| Correct | Wrong |
|---------|-------|
| Get started | Get Started |
| Book a session | BOOK A SESSION |
| Learn more | Learn More |

### Tiers

| Tier | Use |
|------|-----|
| Primary | Main CTA — one per section max |
| Secondary | Supporting action alongside primary |
| Ghost | Tertiary / nav-level, least emphasis |

---

## Card Patterns

### Standard card

```css
.card {
  background: var(--color-surface);
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: var(--radius-lg);
  padding: var(--space-lg);
}
```

### Interactive card (clickable)

```css
.card-interactive {
  background: var(--color-surface);
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: var(--radius-lg);
  padding: var(--space-md);
  text-decoration: none;
  transition: transform 150ms ease, box-shadow 150ms ease;
}

.card-interactive:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
}
```

### Light mode override (on white background)

```css
:global([data-theme="light"]) .card {
  background: #F5F5F7;
}
```

---

## Card System

Three variations. No others.

| Variation | Name | Used for |
|-----------|------|----------|
| 1 | Product Catalog Card | Purchasable products in a grid |
| 2 | Feature/Info Card | Structured information inside product/landing pages |
| 3 | Light Card | Simple content container — visual boundary only |

### Variation 1 — Product Catalog Card (shell — identical across all instances)

```css
.card {
  display: flex;
  flex-direction: column;
  background: var(--color-surface);
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: var(--radius-lg);
  overflow: hidden;
  text-decoration: none;
  color: inherit;
  transition: border-color 0.15s, transform 0.15s, box-shadow 0.15s;
}
:global([data-theme="light"]) .card {
  background: #F5F5F7;
  border-color: rgba(0, 0, 0, 0.12);
}
.card:hover {
  border-color: var(--color-text);
  transform: translateY(-2px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
}
:global([data-theme="light"]) .card:hover {
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}
```

**Typography rules (locked):**
- Title: `font-size: 1.272rem; font-weight: 700; line-height: 1.2` — fixed value, never a variable
- Description: `font-family: var(--font-heading)` — always the reading font, never UI font
- Body padding: `var(--space-lg)` always
- Body gap: `var(--space-sm)` always
- Grid gap between cards: `var(--space-xl)`

---

## Page Header Standard

Every main content page uses `[YOUR PAGE HEADER COMPONENT]` for its title and description. Never a custom heading + paragraph.

```[YOUR FRAMEWORK SYNTAX]
<PageHeader
  title="Page Title"
  description="One-sentence description. Max 40 words."
/>
```

Container spec:
```css
.page-header-wrap {
  max-width: var(--container-md);
  margin: 0 auto;
  padding: var(--space-3xl) 0 0;
}

.page {
  padding: var(--space-3xl) var(--space-md) [BOTTOM PADDING];
}
```

---

## Link Rules

Text links must not use accent color:

```css
a {
  color: var(--color-text);
  text-decoration: underline;
  text-underline-offset: 2px;
}

a:hover {
  opacity: 0.7;
}
```

---

## Icon Rules

- Decorative SVGs always have `aria-hidden="true"`
- Icon buttons have `aria-label` on the button, `aria-hidden` on the SVG
- Icon containers: 2.618rem width/height (golden ratio)

---

## Checklist: Before Shipping a New Page

- [ ] Uses `[YOUR PAGE HEADER COMPONENT]` for title/description
- [ ] Container matches spec: `max-width: var(--container-md); margin: 0 auto; padding: 0 var(--space-md)`
- [ ] Reading text uses `var(--font-heading)`, UI chrome uses `var(--font-primary)`
- [ ] All buttons: sentence case labels
- [ ] Card backgrounds: `var(--color-surface)` dark / `#F5F5F7` light
- [ ] Borders: `rgba(0, 0, 0, 0.5)` — no colored borders
- [ ] Hover states: `translateY(-2px)` + shadow
- [ ] Spacing: all tokens, no arbitrary `px` values
- [ ] Light mode `:global([data-theme="light"])` overrides present
- [ ] Mobile breakpoint styles at `[YOUR MOBILE BREAKPOINT]`
- [ ] No em-dashes in any user-facing text
