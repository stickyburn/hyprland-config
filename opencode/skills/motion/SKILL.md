---
name: motion
description: Designs, implements, and audits interface animation, transitions, feedback, loading, route changes, gestures, springs, choreography, and reduced-motion alternatives. Excludes static visual design, video production, ordinary code review, and root-cause debugging without a motion-design decision.
---

# Motion

Motion should make an interaction feel intentional and an object or state
easier to follow. Use the brief and existing motion language first.

## Preferences and workflow

1. Identify the trigger, what changes, and what the user needs to perceive.
   Give an important moment a distinctive treatment; keep frequent interactions
   fast and quiet. Routine buttons stay spatially stable on hover: use color,
   border, or subtle shadow feedback instead of default lift, scale, or bounce.
2. Choose the simplest mechanism that fits the installed stack. Do not add a
   library for a simple transition. Coordinate origin, distance, timing, and
   easing around the object, rather than animating everything independently.
3. Make application state, focus, and semantics correct without animation.
   Handle interruption, reversal, superseding input, and teardown. Respect
   reduced motion, including preference changes while mounted, with equivalent
   non-spatial feedback. Avoid unsafe flashing.
4. Use `testing` when rendered evidence is needed. Exercise normal input, rapid
   repetition, cancellation, keyboard operation, and reduced motion. Profile
   expensive or continuous effects when warranted; do not claim performance
   from property names alone. Keep verification proportional to the change.

## References

Read only the aid needed for the current decision or implementation risk:

- mechanism, lifecycle, or platform APIs: `references/implementation.md`
- duration, easing, springs, or choreography: `references/easing-and-timing.md`
- overlays, lists, progress, scrolling, gestures, or ambient motion: `references/interaction-patterns.md`

Use `design-ux-ui` when composition or visual identity also needs work. An
actual animation defect starts with `systematic-debugging`, not a redesign.
