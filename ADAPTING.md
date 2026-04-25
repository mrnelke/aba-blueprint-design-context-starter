# Adapting to Your Framework

The Design Context System ships with SvelteKit as the reference implementation. This guide covers adapting it to any other framework.

---

## What's framework-specific vs universal

| Part | Universal | Framework-specific |
|------|-----------|-------------------|
| `DESIGN.md` | Yes | No |
| `docs/` templates | Yes | No |
| `CLAUDE.md` Known Rules section | Yes | No |
| `.claude/skills/` | Yes | No |
| `.claude/hooks/` file pattern (`.svelte`) | No | Adapt the regex |
| `examples/` | No | Per-framework examples |

---

## Adapting the hooks

Both hooks filter by file extension. Change the regex pattern to match your framework.

### remind-design-context.sh

Find this line near the top:
```bash
if [[ ! "$FILE_PATH" =~ \.svelte$ ]]; then
```

Replace with your extension:
- **React / Next.js**: `\.tsx$` or `\.(tsx|jsx)$`
- **Vue**: `\.vue$`
- **Astro**: `\.astro$`
- **Multiple**: `\.(svelte|tsx|vue)$`

Also update the main page pattern:
```bash
# SvelteKit (original)
if [[ "$FILE_PATH" =~ src/routes/(hub|blog|courses)/\+page\.svelte$ ]]; then

# Next.js App Router
if [[ "$FILE_PATH" =~ app/(.*)/page\.tsx$ ]]; then

# Vue / Nuxt
if [[ "$FILE_PATH" =~ pages/(.*)/index\.vue$ ]]; then
```

Replace the reminder text with your own page header component name.

### validate-component.sh

Same extension change applies. Also update the component path check:

```bash
# SvelteKit (original)
if [[ "$FILE_PATH" =~ src/lib/components ]]; then

# React (common convention)
if [[ "$FILE_PATH" =~ src/components ]]; then

# Vue / Nuxt
if [[ "$FILE_PATH" =~ components/ ]]; then
```

The Svelte 5 `$props()` check only applies to Svelte. Remove or replace it:

```bash
# Remove these for React/Vue:
if ! echo "$CONTENT" | grep -q '\$props()'; then ...
if ! echo "$CONTENT" | grep -q 'interface Props'; then ...

# Add React equivalent:
if ! echo "$CONTENT" | grep -q 'interface.*Props'; then
  echo "Warning: Component should define a Props interface" >&2
fi
```

---

## Adapting the settings.json

If you already have a `.claude/settings.json`, merge the hooks block — don't overwrite the file.

Add the `PreToolUse` and `PostToolUse` entries from this repo's `settings.json` into your existing hooks list.

---

## Adapting the component template

### React (TypeScript)

The Svelte 5 component template maps to:

```tsx
interface Props {
  variant?: 'default' | 'accent';
}

export function ComponentName({ variant = 'default' }: Props) {
  return (
    <div
      className={`component ${variant === 'accent' ? 'component--accent' : ''}`}
      style={{
        padding: 'var(--space-md) var(--space-lg)',
        background: 'var(--color-surface)',
        border: '1px solid rgba(0, 0, 0, 0.5)',
        borderRadius: 'var(--radius-lg)',
      }}
    >
      {/* content */}
    </div>
  );
}
```

CSS custom properties (tokens) work the same — define them in a global CSS file and reference with `var(--token-name)`.

### Vue 3

```vue
<script setup lang="ts">
interface Props {
  variant?: 'default' | 'accent';
}
const props = withDefaults(defineProps<Props>(), {
  variant: 'default'
});
</script>

<template>
  <div class="component" :class="{ 'component--accent': variant === 'accent' }">
    <slot />
  </div>
</template>

<style scoped>
.component {
  padding: var(--space-md) var(--space-lg);
  background: var(--color-surface);
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: var(--radius-lg);
}
</style>
```

---

## Adapting the token system

The golden ratio token system in `examples/sveltekit/tokens.css` is pure CSS custom properties — it works in any framework.

Copy it to wherever you define global CSS:
- **Next.js**: `app/globals.css` or `styles/tokens.css` imported in `_app.tsx`
- **Vue / Nuxt**: `assets/css/tokens.css` imported in `nuxt.config.ts`
- **Astro**: `src/styles/tokens.css` imported in your base layout

---

## Adapting the design docs

The three docs in `docs/` are pure markdown — framework-agnostic. Fill in your values and keep the structure. Claude reads any markdown file you point it to in `DESIGN.md`.

One change worth making for non-Svelte projects: in `docs/design-consistency.md`, update the component example code blocks to match your framework's syntax.

---

## Quick checklist per framework

### React / Next.js
- [ ] Change `.svelte` → `.tsx` in both hooks
- [ ] Update component path check in `validate-component.sh`
- [ ] Replace Svelte 5 `$props()` check with Props interface check
- [ ] Update DESIGN.md component example blocks to JSX
- [ ] Copy `tokens.css` to `app/globals.css` or equivalent

### Vue / Nuxt
- [ ] Change `.svelte` → `.vue` in both hooks
- [ ] Update component path (usually `components/`)
- [ ] Replace `$props()` check with `defineProps` check
- [ ] Copy `tokens.css` to `assets/css/`

### Astro
- [ ] Change `.svelte` → `.astro` in both hooks (or keep `.svelte` if using Svelte components in Astro)
- [ ] Update DESIGN.md for Astro component conventions
- [ ] Copy `tokens.css` to `src/styles/`
