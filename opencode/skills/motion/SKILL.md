---
name: motion
description: Designs, implements, or audits interface motion, including transitions, feedback, loading, route changes, gestures, choreography, and reduced-motion behavior. Do not use for static visual design, video production, ordinary code review, or root-cause debugging without a motion-design decision.
---

# Motion

- Give motion a clear purpose and use the simplest mechanism that fits the project's patterns; do not add a library for a simple transition. Keep frequent interactions quick and unobtrusive.
- Preserve state, focus, and semantics through cancellation, reversal, and teardown. Respect reduced-motion preferences without losing information, and avoid unsafe flashing.
- Test the rendered interaction, including repeated input, interruption, cleanup, keyboard use, reduced motion, and performance where relevant.

Load only the reference needed for the task:

- technology choice or implementation detail: `references/implementation.md`
- timing, easing, springs, or choreography: `references/easing-and-timing.md`
- overlays, lists, loading, scrolling, gestures, or ambient motion: `references/interaction-patterns.md`
