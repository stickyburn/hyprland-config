# Motion Implementation

Use for mechanism selection and lifecycle risks. Inspect installed versions
and current support; do not rely on remembered library APIs.

## Mechanism

| Need | Prefer |
|---|---|
| Two-state styling | CSS transition |
| Authored fixed sequence/loop | CSS keyframes |
| Runtime playback, cancellation, reversal | Web Animations API |
| Shared-element/state or document continuity | Supported View Transitions API |
| React gestures, springs, layout animation | Installed Motion or existing UI library |
| Complex authored timeline | Existing GSAP or equivalent |
| Native app | Platform animation system |
| Many objects or simulation | Canvas/WebGL |

Reuse the stack. Feature-detect progressive APIs and retain a working
non-animated baseline. Specify transition properties instead of `all`.
Transform/opacity often suit frequent motion; dimensions, grid tracks,
filters, and clipping can be valid when measured. Do not add `will-change`
without profiling; scope it because layers cost memory.

## Stable State and Cancellation

Application state owns the stable endpoint. Do not depend on an animation
completion callback for correctness. Hidden content must not remain operable;
coordinate `hidden`, `inert`, dialog/popover state, or conditional rendering.

For WAAPI, retain animation identity and the relevant `finished` promise.
`cancel()` removes the effect, and canceling a non-idle animation rejects that
promise with `AbortError`. A new promise is created when leaving the finished
state. Catch expected cancellation, clean up, and guard stale completion by
identity/generation. Persist endpoint styles through state or, when suitable,
`commitStyles()` followed by cancellation rather than indefinite fill.

## View Transitions

Wrap the real same-document update with `document.startViewTransition()`
where supported. Corresponding shared elements need unique transition names.
Preserve focus, scroll, URL/history, and Back/Forward without animation.

- `updateCallbackDone` reports the update, `ready` can reject snapshot setup,
  and `finished` settles after the final view is visible. Handle failures and
  cleanup-promise rejections rather than leaving them unhandled.
- New input should update state without waiting for `finished`. Skip/replace
  old transitions and guard stale callbacks. `skipTransition()` still runs
  its update callback; skipping animation does not cancel stale application work.
- Under reduced motion, update directly or skip only the effect. Clear temporary
  names after completion/skip without erasing names owned by a newer transition.

For same-origin cross-document transitions, both pages can use
`@view-transition { navigation: auto; }`. Use `pageswap`/`pagereveal` only when
needed; clear temporary state for back-forward-cache restores. Verify platform
support before adopting element-scoped or other newer variants.

## Components and Platforms

In React, keep rendering deterministic, scope imperative selectors, and use
the correct lifecycle. Clean up timelines, listeners, observers, subscriptions,
and animation frames. Avoid restarting entrances on rerender. Library
reduced-motion hooks still need deliberate alternatives and runtime updates.
FLIP/layout animation can help, but inspect text rasterization, clipping,
and hit testing. SVG transforms need deliberate origin/transform-box; morphs
must preserve accessible names and state.

Use native conventions: SwiftUI `accessibilityReduceMotion`, Android animator
settings, React Native `AccessibilityInfo`, or Flutter `disableAnimations`
and platform reduce-motion signals as appropriate. Verify current framework
behavior, lifecycle, backgrounding, gestures, safe areas, text scaling, and
preference changes rather than forcing web timing onto native controls.

## Continuous Motion and Performance

Use elapsed time with `requestAnimationFrame` for interactive frames. Bound
pixel ratio/object count, pause when hidden/offscreen, and release resources.
Persistent decorative motion needs an appropriate pause control and a static
reduced-motion treatment. Keep capture/export deterministic when required.

For expensive effects, profile frame time, dropped frames, long tasks, repeated
layout, paint area, layer memory, and input responsiveness on representative
hardware. Batch reads/writes and fix measured bottlenecks. Paint/layout events
are not automatically defects; broad work that misses the frame budget is.
