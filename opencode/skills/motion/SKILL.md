---
name: motion
description: Designs, implements, or audits interface motion, including transitions, feedback, loading, route changes, gestures, choreography, and reduced-motion behavior. Do not use for static visual design, video production, ordinary code review, or root-cause debugging without a motion-design decision.
---

# Motion

## Workflow

1. Inspect the component, state logic, styles, motion tokens, existing libraries, nearby patterns, target platforms, and input methods. Use `design-ux-ui` first if layout or hierarchy is unresolved; use `systematic-debugging` for animation defects.
2. Define the trigger, purpose, stable start and end states, changed properties, interruption behavior, cleanup, frequency, and reduced-motion equivalent.
3. Choose the simplest mechanism that fits: CSS transitions or keyframes for simple motion, platform APIs for runtime control, and the repository's existing library for gestures, springs, layout, or timelines. Do not add a library for a simple transition.
4. Tune timing and easing to distance, scale, frequency, and product character. Keep frequent interactions fast and quiet.
5. Implement cancellation, reversal, and teardown correctly. Preserve focus and semantics, list transition properties explicitly, and prefer `transform` and `opacity` for frequent large motion when visually correct.
6. Replace or remove non-essential translation, zoom, parallax, spin, loops, and autoplay under reduced motion while preserving state and information. Avoid unsafe flashing.
7. Test the rendered interaction for entry, exit, repeated input, interruption, teardown, keyboard and pointer behavior, reduced motion, clipping, and relevant performance. Run applicable project checks.

Load only the reference needed for the task:

- technology choice or implementation detail: `references/implementation.md`
- timing, easing, springs, or choreography: `references/easing-and-timing.md`
- overlays, lists, loading, scrolling, gestures, or ambient motion: `references/interaction-patterns.md`
