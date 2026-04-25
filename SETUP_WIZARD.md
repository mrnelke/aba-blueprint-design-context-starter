# Setup Wizard — Design Context System

Answer these questions, then follow the instructions at the bottom to generate your personalised system.

Work through this once at the start of a new project. It takes about 10 minutes.

---

## Section 1 — Project identity

**Q1. What is your project name?**
```
Answer: 
```

**Q2. What framework are you using?**
```
[ ] SvelteKit
[ ] Next.js (App Router)
[ ] Next.js (Pages Router)
[ ] Vue / Nuxt
[ ] Astro
[ ] Other: ___________
```

**Q3. What component file extension does your framework use?**
```
Answer (e.g. .svelte / .tsx / .vue / .astro): 
```

**Q4. Where do your components live?**
```
Answer (e.g. src/lib/components / src/components / components): 
```

**Q5. Where do your page/route files live?**
```
Answer (e.g. src/routes / app / pages): 
```

---

## Section 2 — Visual identity

**Q6. What are your brand colors?**

Fill in what you have. Leave blank if you haven't decided yet.

```
Background (page bg, darkest):        #
Surface (cards, panels, slightly lighter): #
Accent (your one highlight color):    #
Text primary:                         #
Text secondary (muted):               #
Success color (verdicts only):        #
Error color (verdicts only):          #
Warning color (verdicts only):        #
```

**Q7. What is your default theme?**
```
[ ] Dark (recommended - dark is the default, light is the override)
[ ] Light (light is the default, dark is the override)
```

**Q8. How do you apply theme overrides in CSS?**
```
[ ] data-theme attribute  →  [data-theme="light"] { }
[ ] class on html element →  .light { }
[ ] prefers-color-scheme  →  @media (prefers-color-scheme: light) { }
[ ] Other: ___________
```

---

## Section 3 — Typography

**Q9. What font do you use for UI chrome (labels, badges, buttons, nav, code)?**

UI chrome font is typically monospace or a condensed sans-serif. It signals structure and precision.

```
Font name: 
CSS value (e.g. 'Inconsolata', monospace): 
```

**Q10. What font do you use for reading text (body copy, descriptions, notes)?**

Reading font is typically a humanist sans-serif or serif. It signals content and trust.

```
Font name: 
CSS value (e.g. 'Inter', system-ui, sans-serif): 
```

**Q11. What spacing scale do you prefer?**
```
[ ] Golden ratio (φ = 1.618) - recommended, produces natural-feeling gaps
[ ] Powers of 2 (4px / 8px / 16px / 32px / 64px)
[ ] Custom - I'll define my own
```

---

## Section 4 — Layout and pages

**Q12. What is your standard content column width?**
```
Answer (e.g. 61.8rem / 960px / 1200px): 
```

**Q13. Do you use a standard page header component (single component for title + description on every page)?**
```
[ ] Yes - component name: ___________
[ ] No - I use custom h1+p per page  (you should create one — the system enforces it)
[ ] Not yet - I'll create one after setup
```

**Q14. What is your primary mobile breakpoint?**
```
Answer (e.g. 38.2rem / 768px): 
```

---

## Section 5 — Existing code

**Q15. Do you have an existing design token file (CSS custom properties)?**
```
[ ] Yes - path: ___________
[ ] No - I'll create one (use examples/sveltekit/tokens.css as a starting point)
```

**Q16. Do you already have a CLAUDE.md file?**
```
[ ] Yes - I'll merge the Known Rules section in
[ ] No - I'll use the template CLAUDE.md directly
```

---

## Generate your system

Once you've answered all questions, start a Claude Code session in your project and run:

```
/design-context
```

Then paste this file into the conversation with the message:

> "I've completed the Setup Wizard. Use my answers to generate a customised version of each file in this blueprint — DESIGN.md, docs/design-tokens.md, docs/design-consistency.md, CLAUDE.md Known Rules section, and both hook files. Replace all placeholders with my actual values. Adapt file paths and extension patterns to my framework."

Claude will read your answers and generate personalised files ready to drop into your project.

---

## What gets personalised

| File | What changes |
|------|-------------|
| `DESIGN.md` | Your project name, your colors, your font names, your token file path |
| `docs/design-tokens.md` | Your actual color values, spacing scale, font stacks |
| `docs/design-consistency.md` | Your component name, your framework syntax in examples, your breakpoint |
| `CLAUDE.md` Known Rules | Your page header component name, your theme selector, your container width |
| `.claude/hooks/remind-design-context.sh` | Your file extension, your component path, your page path pattern |
| `.claude/hooks/validate-component.sh` | Your file extension, your component path, your page header component name |

---

## v2 — Web generator (planned)

A web-based version of this wizard is planned for a future release. It will:
- Accept these same answers via a form at agentbuilderacademy.com/tools/design-context-setup
- Generate and download a ready ZIP with all files pre-filled
- Require no manual Claude session to produce the output
- Be free to use as a lead tool; full system download requires blueprint purchase

If you want early access when it launches, email hello@agentbuilderacademy.com with subject "Design Context Generator".
