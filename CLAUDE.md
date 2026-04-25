# [YOUR PROJECT NAME]

> This is a template. Replace every [PLACEHOLDER] with your actual values.
> The sections marked "KEEP" should stay as-is — they are used by the design enforcement hooks.

---

## Known Rules (never break these)

### Page title and description standard — KEEP, adapt component name

Every main content page uses `[YOUR PAGE HEADER COMPONENT]` for its title and description. Never a custom heading + paragraph combo.

The wrapper container must use:
```css
max-width: [YOUR MAX CONTENT WIDTH];
margin: 0 auto;
padding: 0 [YOUR HORIZONTAL EDGE PADDING];
```

The outer page wrapper must use `padding-top: [YOUR TOP SPACING]` to match all other pages.

### Typography on product and content pages — KEEP

Two fonts, different jobs:

- **[YOUR UI FONT]**: labels, badges, buttons, nav, prices, code, short titles
- **[YOUR READING FONT]**: body copy, descriptions, list items, notes — anything requiring reading

### Borders — KEEP

All cards and panels: `border: 1px solid rgba(0, 0, 0, 0.5);`

No colored borders. No accent-colored left borders.

### Dark mode — KEEP

Dark is the default. Light mode overrides use `[YOUR THEME OVERRIDE SELECTOR]`.

Never invert this — don't write light-first styles.

### No em-dashes in user-facing text — KEEP

Use hyphens (`-`) not em-dashes. Applies to all rendered text, SEO fields, and aria-labels.

---

## Design System

Read `DESIGN.md` before any UI work. It links to all design documentation.

Run `/design-context` at the start of any session that involves UI changes.

---

## Development Guidelines

1. Before building any new page or component: read `DESIGN.md`
2. Before building a product/landing page: read `docs/design-consistency.md`
3. Use `/generate-component` to scaffold new components — do not write from scratch
4. Run `/check-design` on any new file before shipping
5. Use design tokens for all spacing and color — no arbitrary values
