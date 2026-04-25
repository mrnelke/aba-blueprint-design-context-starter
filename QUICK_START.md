# Quick Start — The Design Context System

15 minutes from download to a working design enforcement system.

---

## What you're setting up

Three layers that work together:

1. **Docs** — your design rules written where Claude always reads them
2. **Skills** — `/design-context` loads rules before UI work; `/check-design` audits after; `/generate-component` scaffolds correctly
3. **Hooks** — automatic reminders before every edit, validation after

---

## Recommended: Use the Setup Wizard

Instead of filling in placeholders manually, complete `SETUP_WIZARD.md` first (10 min), then ask Claude to generate personalised files from your answers. This produces a ready system with your actual values — no placeholders left to fill.

> Open `SETUP_WIZARD.md` → answer all 16 questions → start Claude Code → run `/design-context` → paste the completed wizard.

Or continue below to set up manually.

---

## Step 1 — Drop in the files (5 min)

Copy these folders into your project root:

```
.claude/         → your project root/.claude/
DESIGN.md        → your project root/DESIGN.md
docs/            → your project root/docs/  (or merge into existing docs/)
```

If you already have a `.claude/` folder:
- Merge `.claude/skills/` — add the three skill folders
- Merge `.claude/hooks/` — add the two hook files
- Merge `.claude/settings.json` — add the hooks block (see ADAPTING.md)

---

## Step 2 — Fill in your design rules (5 min)

Open `DESIGN.md` and replace every `[PLACEHOLDER]` with your actual values.

At minimum, fill in:
- Your brand colors (background, surface, accent, text)
- Your font choices (UI chrome font, reading text font)
- Your spacing scale (or use the golden ratio scale in `docs/design-tokens.md`)
- Your border style

The more specific you are, the better Claude follows the rules.

---

## Step 3 — Add the Known Rules to your CLAUDE.md (3 min)

Open `CLAUDE.md` in this repo. Copy the entire `## Known Rules` section and paste it into your project's `CLAUDE.md`.

Replace the placeholder values with your actual rules.

CLAUDE.md is loaded automatically on every session — this is what makes the rules persistent.

---

## Step 4 — Adapt the hooks to your framework (2 min)

The hooks fire on `.svelte` files by default (SvelteKit). If you use a different framework:

- **React / Next.js**: change `\.svelte$` to `\.tsx$` in both hook files
- **Vue**: change to `\.vue$`
- **Astro**: change to `\.astro$`

See `ADAPTING.md` for full instructions.

---

## Step 5 — Start your first design session

Open your project in Claude Code. Start with:

```
/design-context
```

Claude will read your design rules and confirm what it loaded. From that point on, every `.svelte` (or `.tsx`, `.vue`) edit will trigger a reminder and every save will run validation.

---

## Verify it's working

Make a small edit to any UI component. You should see:

- Before the edit: a one-line design reminder in the terminal
- After the edit: validation output (no output = no violations found)

Run `/check-design` on any file to see a full audit report.

---

## What's in the box

| File | Purpose |
|------|---------|
| `DESIGN.md` | Index — links to all design docs, quick rule summary |
| `docs/design-tokens.md` | Token reference — colors, spacing, typography, borders |
| `docs/design-consistency.md` | UI patterns — cards, buttons, links, badges |
| `docs/design-system.md` | Full system spec — rationale, decision log |
| `.claude/skills/design-context/` | Load rules before any UI session |
| `.claude/skills/check-design/` | Audit components for violations |
| `.claude/skills/generate-component/` | Scaffold new components with correct patterns |
| `.claude/hooks/remind-design-context.sh` | PreToolUse: surfaces rules before every edit |
| `.claude/hooks/validate-component.sh` | PostToolUse: catches violations after every save |
| `examples/sveltekit/tokens.css` | Golden ratio CSS token system — copy to `src/styles/` |
| `examples/sveltekit/component.template.svelte` | Svelte 5 component template with correct patterns |
| `ADAPTING.md` | How to adapt to React, Vue, Astro, or any other framework |
