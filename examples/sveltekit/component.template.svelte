<!--
  Component Template — Svelte 5
  Copy this file, rename it, and fill in your component logic.

  Patterns pre-applied:
  - Svelte 5 $props() with Props interface
  - Design tokens for all spacing, color, and radius
  - Light mode override
  - Hover state (translateY + shadow)
  - aria-hidden on decorative SVG
  - :focus-visible outline
-->

<script lang="ts">
  interface Props {
    title: string;
    description?: string;
    variant?: 'default' | 'accent';
    href?: string;
  }

  let {
    title,
    description,
    variant = 'default',
    href,
  }: Props = $props();

  const tag = href ? 'a' : 'div';
</script>

<!--
  Use <a> when the card is a navigation element, <div> when it is just display.
  The {tag} pattern above handles this — pass href to make it a link.
-->
<svelte:element
  this={tag}
  {href}
  class="card"
  class:card--accent={variant === 'accent'}
  class:card--interactive={!!href}
>
  <!--
    Optional icon — add aria-hidden to any decorative SVG.
    Replace with your actual icon or remove this block.
  -->
  <div class="card-icon" aria-hidden="true">
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
      <circle cx="12" cy="12" r="10"/>
    </svg>
  </div>

  <div class="card-body">
    <span class="card-title">{title}</span>
    {#if description}
      <p class="card-description">{description}</p>
    {/if}
  </div>
</svelte:element>

<style>
  /* ── Base card ─────────────────────────────────────────────────────────── */
  .card {
    display: flex;
    align-items: flex-start;
    gap: var(--space-md);
    padding: var(--space-md) var(--space-lg);
    background: var(--color-surface);
    border: 1px solid rgba(0, 0, 0, 0.5);
    border-radius: var(--radius-lg);
    text-decoration: none;
    color: inherit;
  }

  /* Light mode override */
  :global([data-theme="light"]) .card {
    background: #F5F5F7;
  }

  /* ── Accent variant ────────────────────────────────────────────────────── */
  .card--accent {
    background: rgba(0, 217, 255, 0.08);   /* Replace with your accent color */
    border-color: rgba(0, 217, 255, 0.3);
  }

  /* ── Interactive (link) card ───────────────────────────────────────────── */
  .card--interactive {
    transition: transform var(--transition-fast), box-shadow var(--transition-fast);
    cursor: pointer;
  }

  .card--interactive:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
  }

  .card--interactive:focus-visible {
    outline: 2px solid var(--color-accent);
    outline-offset: 2px;
  }

  /* ── Icon ──────────────────────────────────────────────────────────────── */
  .card-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 2.618rem;    /* Golden ratio icon size */
    height: 2.618rem;
    flex-shrink: 0;
    background: rgba(0, 217, 255, 0.08);   /* Replace with your accent color */
    border-radius: var(--radius-md);
    color: var(--color-accent);
  }

  /* ── Content ───────────────────────────────────────────────────────────── */
  .card-body {
    display: flex;
    flex-direction: column;
    gap: var(--space-3xs);
    min-width: 0;
  }

  .card-title {
    /* UI chrome — stays in the primary (monospace) font */
    font-family: var(--font-primary);
    font-size: var(--font-body-size);
    font-weight: 600;
    color: var(--color-text);
    line-height: var(--line-height-normal);
  }

  .card-description {
    /* Reading text — uses the secondary (reading) font */
    font-family: var(--font-heading);
    font-size: var(--font-small);
    color: var(--color-text-secondary);
    line-height: var(--line-height-relaxed);
    margin: 0;
  }
</style>
