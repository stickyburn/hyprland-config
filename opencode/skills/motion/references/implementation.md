# Implementation Reference

Use this reference when selecting an animation technology or reviewing
implementation correctness. Check project versions and current platform
support instead of relying on remembered APIs.

## Selection

| Mechanism | Best fit |
|---|---|
| CSS transition | two-state style changes |
| CSS keyframes | fixed multi-step or looping animation |
| Web Animations API | runtime playback control without a library |
| View Transitions API | document or state continuity and shared elements |
| Motion / existing UI library | React gestures, springs, layout animation |
| GSAP | authored timelines and complex orchestration already using GSAP |
| Native platform API | mobile or desktop application motion |
| Canvas/WebGL | many animated objects, simulation, generative work |

Prefer the repository's existing mechanism. Feature-detect progressive web
APIs and ensure the state change works without animation.

## CSS

Use transitions for state changes and keyframes for authored sequences.
Specify intended properties:

```css
.disclosure {
  transition:
    opacity 160ms var(--ease-out),
    transform 220ms var(--ease-out);
}
```

`transform` and `opacity` are strong defaults for large or frequent motion.
Color, `clip-path`, filter, grid tracks, and dimensions can be valid when visual
correctness requires them. Measure their cost, contain their impact where
possible, and avoid layout work on every frame across large subtrees.

Do not add `will-change` preemptively. Layers consume memory and can make
performance worse. Add it only after profiling and scope it to the period near
the animation.

Avoid keeping hidden content focusable. Pair visual transitions with correct
`hidden`, `inert`, popover/dialog state, or conditional rendering behavior.

## Web Animations and View Transitions

Web Animations API is useful when code needs `play`, `pause`, `reverse`,
`cancel`, `finished`, or timeline control. Retain the animation object and
make application state or underlying styles own the stable endpoint.
`Animation.cancel()` removes the effect and resets its timing, so a final state
that exists only in keyframes will revert. Avoid indefinite `fill: forwards`;
when appropriate, set the underlying state or use `commitStyles()` and then
cancel the filling animation. Canceling a non-idle animation rejects the
current `finished` promise with an expected `AbortError`, and a new promise is
created whenever the animation leaves the finished state. Retain the relevant
promise, catch cancellation, use `finally` for cleanup, and guard completion
with animation identity, a generation counter, or current application state so
an obsolete completion cannot commit stale visual or semantic state.

For same-document View Transitions, wrap the real state or DOM update with
`document.startViewTransition()` or use a supported element-scoped transition
API when isolation is valuable. For same-origin cross-document navigation,
both documents can opt in declaratively:

```css
@view-transition {
  navigation: auto;
}
```

Use `pageswap` and `pagereveal` when cross-document transitions need dynamic
names or navigation-specific setup. Clear temporary names and state so
back-forward-cache restores do not produce duplicates. In every mode, normal
state change or navigation is the baseline: it must succeed when transition
support is absent or reduced motion is active. Preserve focus, scroll, history,
deep links, and Back/Forward behavior. Do not trade navigation correctness for
a visual morph.

For same-document lifecycle handling, `updateCallbackDone` reports whether the
state update completed, `ready` can reject when snapshot setup fails (including
duplicate names), and `finished` settles after the final view is visible. Do
not wait for animation completion before allowing navigation. On superseding
input, update state immediately and skip or replace the active transition;
`skipTransition()` skips animation but still runs its update callback. Handle
promise rejection, guard stale work by transition identity or generation, and
clear temporary names in `finished.finally()`. Under reduced motion, perform
the update directly or skip the animation without skipping the update.

## React and UI Libraries

Before importing Motion, GSAP, or another package, inspect dependencies and
existing code. Follow the installed version's API.

- Keep render output deterministic; start imperative animation in the correct
  lifecycle and scope selectors to the component.
- Cancel timelines, observers, subscriptions, and animation frames on cleanup.
- Do not restart entrance animations on every render.
- For concurrent updates, make visual state derive from application state
  rather than an animation callback alone.
- Use the library's reduced-motion configuration or hook, then design bespoke
  alternatives for large transforms, layout movement, parallax, and autoplay.
- Layout animation and FLIP techniques are often better than hand-animating
  `top`, `left`, `width`, and `height`, but verify text rasterization, clipping,
  and hit testing during transforms.

## SVG

Transform SVG groups when several paths form one visual object. Set an
explicit transform box and origin when browser defaults are ambiguous. Path
drawing and morphing should preserve the icon's accessible name and state; a
second SVG swapped in place may be simpler and more robust than a morph.

## Native Platforms

Use the repository's native animation system and accessibility setting:

- SwiftUI: platform transitions and `accessibilityReduceMotion`
- Android/Compose: platform motion conventions and animator-duration settings
- React Native: `AccessibilityInfo` and the installed animation library
- Flutter: `MediaQuery.disableAnimations` for requests to disable or minimize
  animation, plus `PlatformDispatcher.accessibilityFeatures.reduceMotion` for
  simplified motion and removed parallax on iOS

Verify lifecycle, backgrounding, navigation gestures, text scaling, safe
areas, runtime preference changes, and lower-end target devices. Observe the
framework's accessibility-change signal when custom controllers persist. Do
not force web easing or hover patterns onto native controls.

## Canvas, WebGL, and Generative Motion

- Drive interactive frames with `requestAnimationFrame`.
- Use elapsed time rather than assuming a fixed refresh rate.
- Cap device-pixel ratio and object count based on measured needs.
- Pause when hidden or offscreen and release resources on teardown.
- Keep export or capture paths deterministic when reproducibility matters.
- Provide a static reduced-motion frame and a user pause control for persistent
  decorative motion.

## Profiling

Profile the real interaction on representative hardware:

- frame duration and dropped frames
- long tasks and script work
- style recalculation and layout per frame
- paint area and expensive filters or shadows
- layer count and memory
- idle CPU/GPU usage for loops
- input responsiveness while motion runs

Paint or layout events are not automatically defects. Broad, repeated work
that misses the frame budget is. Optimize from evidence.
