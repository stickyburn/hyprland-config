# Easing and Timing Reference

Use this reference when setting durations, easing curves, spring parameters,
or choreography. Values are starting ranges, not acceptance criteria.

## Timing Inputs

Tune duration from:

- distance and visual size
- whether input is direct or system-triggered
- frequency of use
- information that must be tracked
- device and input method
- product character
- reduced-motion strategy

The same drawer may need different timing on a compact phone and a large
desktop. Judge the rendered result rather than treating a table as a standard.

## Starting Ranges

| Motion | Typical starting range |
|---|---:|
| Press or immediate control feedback | 60-160ms |
| Hover, focus, small state change | 100-220ms |
| Toggle, icon morph, compact reveal | 140-300ms |
| Tooltip or menu | 100-250ms |
| Modal, drawer, accordion | 180-400ms |
| Route or large shared element | 220-500ms |
| One-time expressive moment | 400-900ms, if it does not block use |
| Ambient cycle | several seconds or event/physics driven |

Shorten high-frequency motion and exits that need no tracking. Lengthen motion
only when distance, comprehension, or expression earns the time. A hard 500ms
ceiling is not useful for every product, though routine UI movement should
rarely make users wait that long.

## Easing by Velocity

| Shape | Use |
|---|---|
| Decelerating / ease-out | an element arrives and must settle visibly |
| Accelerating / ease-in | an element leaves the current context |
| Ease-in-out | movement between visible positions |
| Linear | constant progress, rotation, or scroll-linked mapping |
| Steps | discrete frames, counters, sprite or terminal effects |
| Spring | gesture release, direct manipulation, elastic product character |

CSS keywords are valid when they fit and match the product. Explicit curves
or tokens are valuable when the system needs consistency, not as ceremony.

Useful starting curves:

```css
--ease-out: cubic-bezier(.16, 1, .3, 1);
--ease-in: cubic-bezier(.7, 0, .84, 0);
--ease-in-out: cubic-bezier(.65, 0, .35, 1);
--ease-emphasized: cubic-bezier(.2, 0, 0, 1);
```

Test curves with the actual distance. A curve that feels crisp over 8px can
feel abrupt across a viewport.

## Springs

Use a spring when velocity and settling matter. Prefer perceptual controls
such as bounce and duration when the library offers them; otherwise tune:

- stiffness: pull toward the target
- damping: how quickly oscillation stops
- mass: perceived inertia
- initial velocity: continuity from the gesture

Start critically damped or with little bounce for routine product UI. Add
overshoot only when object behavior and brand tone support it. Evaluate
settling time, not just the first arrival at the target.

A cubic-bezier curve can imitate one overshoot but cannot respond to gesture
velocity like a physical spring. Modern CSS `linear()` can encode sampled
spring curves, but it remains a predetermined easing function.

## Choreography

Sequence by causal order or distance from the trigger. Common inter-item delay
starts around 20-80ms, but cap the total wait rather than enforcing a fixed
item count. For long collections, animate a visible group or use a very short
distribution so later items are not withheld.

Elements that form one object, such as a dialog and backdrop, often begin
together with different curves. A dependent label or action may follow the
primary surface once its relationship becomes clear.

## Reduced Motion

Choose an alternative for each effect:

| Full motion | Reduced alternative |
|---|---|
| large slide or zoom | instant replacement or short dissolve |
| parallax or scroll transform | static composition |
| spring layout movement | immediate layout plus highlight |
| autoplay background | static poster frame |
| repeated pulse or orbit | stable icon or text status |

Opacity can be safer than large spatial transforms, but it can still create
unsafe flashes. Avoid flashing; otherwise keep it to no more than three flashes
in any one-second period or use an appropriate analysis tool to demonstrate
that it remains below the WCAG general-flash and red-flash thresholds. A pause
control or reduced-motion mode is not a substitute because harm can occur
before either takes effect. Preserve focus, state, and progress.

## Quality Check

- Input receives immediate acknowledgment.
- Duration fits scale, distance, and frequency.
- Velocity changes make the origin and destination legible.
- Repeated input can reverse or retarget without a jump.
- Choreography does not delay access to content.
- Reduced motion is an intentional alternative, not a global reset.
- Repeated and embedded effects meet the flash-safety gate.
