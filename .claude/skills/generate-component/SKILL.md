---
name: generate-component
description: Scaffold a new component following the project's design system conventions. Use instead of writing components from scratch.
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Glob
---

# Component Generator

Scaffold a new component with correct patterns pre-applied.

## Input
$ARGUMENTS

Provide: component name and type (e.g. "StatusCard, interactive card" or "PriceTag, badge").

## Steps

### 1. Load design context

Before generating, read:
- `docs/design-tokens.md` — tokens to use
- `docs/design-consistency.md` — patterns to follow
- The reference implementation (see DESIGN.md)

### 2. Determine the component type

| Type | Pattern |
|------|---------|
| Display card | Standard card: surface bg, rgba border, border-radius-lg |
| Interactive card | Standard + hover lift (translateY(-2px) + shadow) |
| Badge / tag | Pill shape, font-primary, uppercase, letter-spacing |
| Button | Use global button classes — do not write custom button CSS |
| Icon container | 2.618rem size, flex center, surface bg |
| Page section | Container with max-width, margin: 0 auto, space-3xl padding |

### 3. Generate the component

Apply these rules automatically — do not ask about them:

**Structure:**
- Props interface with typed properties and defaults
- Single root element
- Scoped styles using CSS custom properties
- Light mode override if the component has a background or border

**Tokens:**
- All spacing: `var(--space-*)` — no hardcoded px values
- All colors: `var(--color-*)` — no hardcoded hex values
- Borders: `1px solid rgba(0, 0, 0, 0.5)` — never colored
- Border radius: `var(--radius-lg)` for cards, `var(--radius-md)` for buttons/inputs

**Typography:**
- Reading text: `font-family: var(--font-heading)`
- UI chrome: `font-family: var(--font-primary)` (default — no need to specify unless overriding)

**Accessibility:**
- Decorative SVGs: `aria-hidden="true"`
- Interactive elements: minimum 44px height
- Focus: `:focus-visible` outline using `var(--color-accent)`

**Dark mode:**
- Dark is the default — write dark-first styles
- Light overrides use `[YOUR THEME SELECTOR]`

### 4. Output

Write the component file to the appropriate directory, then state:
- What patterns were applied
- Any decisions that required judgment (e.g. chose interactive over display)
- Any placeholders the user needs to fill in

---

## Framework templates

### SvelteKit (Svelte 5)

```svelte
<script lang="ts">
  interface Props {
    variant?: 'default' | 'accent';
    // add props here
  }

  let { variant = 'default' }: Props = $props();
</script>

<div class="component" class:component--accent={variant === 'accent'}>
  <!-- content -->
</div>

<style>
  .component {
    background: var(--color-surface);
    border: 1px solid rgba(0, 0, 0, 0.5);
    border-radius: var(--radius-lg);
    padding: var(--space-md) var(--space-lg);
  }

  :global([data-theme="light"]) .component {
    background: #F5F5F7;
  }

  .component--accent {
    background: rgba(0, 217, 255, 0.08);
    border-color: rgba(0, 217, 255, 0.3);
  }
</style>
```

See `ADAPTING.md` for React, Vue, and Astro equivalents.
