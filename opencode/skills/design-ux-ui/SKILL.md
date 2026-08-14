---
name: design-ux-ui
description: Designs, implements, or critiques web, mobile, and desktop interfaces. Use for pages, components, redesigns, forms, navigation, design systems, visual polish, responsive behavior, and accessibility. Do not use for motion-only work, product strategy, or isolated implementation debugging.
---

# Design UX UI

## Workflow

1. Inspect the brief, content, assets, relevant source, shared components, tokens, typography, and nearby UI patterns. In an existing product, preserve its established visual language unless redesign is requested.
2. Identify the primary user task, content hierarchy, required states, platform constraints, and one visual direction specific to the subject. Ask only questions that would materially change the result.
3. Define the interaction and responsive behavior before visual polish. Cover relevant loading, empty, error, success, disabled, long-content, destructive, and narrow-layout states.
4. Implement the smallest coherent solution in the repository's stack. Reuse its components and tokens. Use real content when available; do not invent claims, testimonials, or metrics.
5. Make the interface semantic, keyboard-operable, responsive, and accessible. Target WCAG 2.2 AA for web unless the project specifies another standard.
6. Verify the rendered result at narrow and wide sizes, exercise the primary flow and relevant failure states, and run applicable project checks.

Load only the reference needed for the task:

- interaction, forms, navigation, data, or copy: `references/interaction-and-content.md`
- typography: `references/typography.md`
- color, tokens, or themes: `references/color-and-themes.md`
- layout, density, or responsiveness: `references/layout-and-spacing.md`
- accessibility: `references/accessibility.md`
- generic-looking output or a broad redesign: `references/anti-patterns.md`

Use the `motion` skill when movement is a substantial part of the work. For critique, return prioritized evidence-based findings, concrete remedies, and meaningful tradeoffs.
