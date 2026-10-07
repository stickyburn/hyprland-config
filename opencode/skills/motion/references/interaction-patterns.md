# Motion Patterns

Use for interaction-specific motion decisions. Adapt to the product rather
than copying a treatment or its timing mechanically.

## Controls and Selection

Use immediate state feedback. Routine buttons remain in place on hover;
color, border, subtle shadow, or a highlight often suffice. A deliberate press
response or direct manipulation is different from automatic hover lift.
Keep focus stable and provide touch/keyboard equivalents.

Toggle position can animate, but checked state changes immediately and has
proper semantics/name. Retarget rapid input; reduced motion keeps the same
state with immediate position or non-spatial feedback.

## Disclosure and Overlays

Use spatial origin to explain where an accordion, drawer, or popover belongs.
Height/grid-track animation can be correct for genuine layout change; test
dynamic content and rapid reversal rather than assuming transforms solve it.

Backdrop and dialog are one event, possibly with different properties.
Coordinate focus, `aria-expanded`, and hidden/inert state. Escape and repeated
open/close input must interrupt safely; restore focus on close. Reduced motion
can use immediate state or a short dissolve. Avoid operable invisible content.

## Lists, Routes, and Continuity

Animate changed items rather than the whole collection. Stable keys and
layout animation/FLIP can preserve identity during reorder. Stagger only for
meaningful order/grouping; do not withhold long-list content.

Shared elements should represent the same recognizable object. Route direction
should agree with navigation. History, focus, deep links, and scroll restoration
must work without transitions; rapid navigation and Back gestures must not
leave obsolete views or blocking overlays.

## Loading and Attention

| Wait/context | Feedback |
|---|---|
| Very short action | Immediate control state, often no spinner |
| Unknown structure | Compact status/progress |
| Known structure | Skeleton matching final geometry |
| Measurable operation | Real progress, with useful text |
| Optimistic action | Immediate state plus failure recovery |

Keep the object being acted on visible. Avoid fake progress, endless shimmer,
and layout shift. Locate a notification with motion, then settle; do not steal
focus or pulse indefinitely. Important messages need readable duration and
persistent recovery. Animation is never the only error/success cue.

## Scrolling and Gestures

Use scroll linkage when position communicates progress or a spatial story.
Keep essential content available, preserve native scrolling, stop offscreen
work, and test wheel, keyboard, trackpad, touch, and reduced motion. Prefer
supported CSS scroll-driven animation or a scoped observer over scrolljacking.

Drag follows input without decorative lag. On release, carry measured velocity
into a bounded settle/snap/return. Provide a non-drag control and keyboard path.

For custom pointer handling, track one `pointerId`, choose `touch-action`
before start, and set capture after DOM moves. Compute velocity from elapsed
time, not event count. Handle `pointercancel`, `lostpointercapture`, superseding
input, and unmount as idempotent rollback/commit paths. Release capture and
listeners; preserve the intended native scroll axis and accessible operation.

## Brand and Ambient Motion

Build one meaningful expressive moment around the subject: a useful diagram,
an object's transformation, or a transition that reveals its relationship.
Treatments seen in inspiration still need interruption and reduced-motion
behavior; a screenshot cannot prove their timing or correctness.

Ambient effects are appropriate when atmosphere is part of the experience.
Keep them away from sustained reading and controls, inspect several cycles,
and account for mobile power. Pause when hidden and provide pause/stop/hide
when persistent auto-starting motion requires it. Use a static reduced-motion
composition and avoid unsafe flashes. Particles, glows, and animated gradients
need a subject-specific purpose, not a blanket ban or automatic inclusion.
