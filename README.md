# UI Consistency System

**Stop fixing the same design mistakes every time you use AI.**

AI forgets your design rules between sessions. This system makes it follow them automatically - before every edit, after every save.

---

## How it works

Three layers that enforce your design rules without manual effort:

1. **Docs** - your rules written where Claude always reads them (`DESIGN.md` + `/docs`)
2. **Skills** - `/design-context` loads rules before any UI session; `/check-design` audits after; `/generate-component` scaffolds correctly
3. **Hooks** - PreToolUse reminder fires before every component edit; PostToolUse validator catches violations after every save

---

## Get started

Open `QUICK_START.md` - 15 minutes from clone to a working enforcement system.

**Recommended path:** Complete `SETUP_WIZARD.md` first (10 min). It generates personalised files from your answers so you start with your actual values - no placeholders to fill in manually.

---

## What is included

```
QUICK_START.md              15-minute setup guide
SETUP_WIZARD.md             16-question wizard to generate personalised files
ADAPTING.md                 How to adapt to React, Vue, or Astro
CLAUDE.md                   Template with Known Rules section pre-filled
DESIGN.md                   Design doc index template

docs/
  design-tokens.md          Color, spacing, and typography token reference
  design-consistency.md     Card patterns, button rules, typography guide
  design-system.md          Full system spec + decision log template

.claude/
  settings.json             Hook registration - pre-wired, drop in and go
  skills/
    design-context/         Load your design rules before any UI session
    check-design/           Audit components for violations after every change
    generate-component/     Scaffold new components with correct patterns applied

  hooks/
    remind-design-context.sh  PreToolUse: surfaces your rules before every edit
    validate-component.sh     PostToolUse: catches border, font, and pattern violations

examples/
  sveltekit/
    tokens.css              Golden ratio CSS token system - copy to src/styles/
    component.template.svelte  Svelte 5 component with all patterns pre-applied
```

---

## Requirements

- **Claude Code** (Claude Pro or Max) - the enforcement layer is built for it
- Any web project (SvelteKit reference included; adapting guide covers React, Vue, Astro)

---

## Need help with setup?

Book a free 30-minute call at [agentbuilderacademy.com/consulting](https://agentbuilderacademy.com/consulting) - we walk through the setup together.

---

Built by [Agent Builder Academy](https://agentbuilderacademy.com)
