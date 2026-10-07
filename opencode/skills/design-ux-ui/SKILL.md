---
name: design-ux-ui
description: Designs, implements, and critiques distinctive web, mobile, and desktop UI/UX. Use for pages, components, redesigns, visual polish, design inspiration, forms, navigation, design systems, responsive layouts, and accessibility. Excludes motion-only work, business strategy, and isolated implementation debugging.
---

# Design UX UI

Deliver a distinctive, fully usable interface, not just a styled wireframe.
Apply the user's brief and project constraints first; the preferences below
guide decisions the brief leaves open.

## Design preferences

- Aim for a memorable visual idea, confident typography, precise spacing, and
  excellent interaction detail. Restraint around the focal point makes it stronger.
- Make everyday app controls calm, crisp, and spatially stable. Buttons stay in
  place on hover; prefer color, border, or subtle shadow feedback to automatic
  upward translation, enlargement, or bounce.
- Be expressive where it fits the subject: imagery, composition, data
  visualization, and purposeful motion can carry the identity. Do not turn every
  surface into a neutral minimalist template or add spectacle to routine work.
- Avoid starting from a centered hero, equal card grid, or glass/glow package
  unless the content calls for it. A different palette alone is not originality.

## Workflow

1. **Establish the task.** Inspect the existing UI, components, tokens, assets,
   dependencies, and relevant states. Preserve the product's visual language
   unless a redesign is requested. Ask only about gaps that materially change
   the result; otherwise make reasonable assumptions and proceed within scope.
2. **Choose a direction.** For a new design or broad redesign, read
   `references/inspiration-and-direction.md` and inspect a few relevant visual
   references when available. Choose one coherent concept that connects the
   subject to composition, type, color, and a signature detail. “Modern” or
   “premium” alone is not a direction. Skip external research for small changes
   or an already specified design.
3. **Build the real experience.** Prioritize the user's content and primary
   action. Reuse project components and tokens; introduce only what the concept
   needs. Use suitable, authorized assets and representative data. Do not invent
   testimonials, metrics, or product claims. Implement the relevant loading,
   empty, error, success, and interaction states. Support responsive layout,
   semantics, keyboard use, and WCAG 2.2 AA for web unless specified otherwise.
4. **Inspect and refine.** Use `testing` for rendered verification when needed.
   Inspect narrow and wide screenshots, exercise the changed flow, and run
   proportionate project checks. Fix composition and hierarchy before effects;
   then refine wrapping, alignment, contrast, assets, and feedback. Report any
   verification limits honestly. For specifications or critiques, inspect the
   supplied evidence rather than claiming to have tested an implementation.

## References

Load only what the current decision needs. These are compact decision aids,
not a required reading list; consult them when detail or confidence is missing.

- inspiration, art direction, or a broad redesign: `references/inspiration-and-direction.md`
- flows, forms, navigation, data, or copy: `references/interaction-and-content.md`
- type choices or hierarchy: `references/typography.md`
- palettes, tokens, or themes: `references/color-and-themes.md`
- composition, density, or responsiveness: `references/layout-and-spacing.md`
- accessibility requirements or remediation: `references/accessibility.md`
- generic-looking output or a final visual critique: `references/anti-patterns.md`

Use `motion` for substantial animation decisions. For critique, prioritize
evidence, user impact, and concrete repairs over personal style preferences.
