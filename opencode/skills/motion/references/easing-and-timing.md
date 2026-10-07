# Easing and Timing

Use for durations, easing, springs, and choreography. Reuse motion tokens
first; the values below are starting points, not acceptance criteria.

## Timing

Tune to distance, size, frequency, input method, and what must be tracked.
Direct manipulation follows input immediately; animation should not defer
state changes. Shorten frequent interactions and exits that need no tracking.

| Effect | Starting range |
|---|---:|
| Press or immediate feedback | 60-160ms |
| Small state change, hover, focus | 100-220ms |
| Toggle or compact reveal | 140-300ms |
| Menu or tooltip transition | 100-250ms |
| Modal, drawer, accordion | 180-400ms |
| Route or large shared element | 220-500ms |
| One-time expressive moment | 400-900ms if it does not block use |

Judge the actual distance and rendered feel. A rigid maximum is not useful
for every product, but routine UI should rarely make people wait half a second.

## Velocity and Springs

Use deceleration for arriving/settling objects, acceleration for exits,
ease-in-out between visible positions, linear for constant progress, and
springs for velocity-aware release or deliberate physical character.
CSS keywords are valid when they fit; explicit curves help a reusable system.

```css
--ease-out: cubic-bezier(.16, 1, .3, 1);
--ease-in: cubic-bezier(.7, 0, .84, 0);
--ease-in-out: cubic-bezier(.65, 0, .35, 1);
```

For springs, tune stiffness, damping, mass, and initial velocity, or the
library's perceptual controls. Start with little bounce for routine work;
overshoot belongs to an intentional object/brand model. Measure settling,
not just arrival. Predetermined bezier or sampled CSS `linear()` curves
cannot retarget from gesture velocity like a physical spring.

## Choreography

Sequence by causality or spatial origin, not an arbitrary stagger. A backdrop
and dialog form one event and may begin together with different curves.
Related dependent elements can follow the focal object.

Inter-item delays around 20-80ms can be a starting point, but cap the total
wait and do not withhold later content in long lists. Expressive motion earns
attention by clarifying a relationship, not by multiplying moving elements.

## Reduced Motion and Flash Safety

| Full treatment | Alternative |
|---|---|
| Large slide or zoom | Immediate replacement or short dissolve |
| Parallax or scroll transform | Static composition |
| Spring layout | Immediate layout plus stable highlight |
| Autoplay background | Poster frame |
| Repeated pulse or orbit | Stable icon or text status |

Preserve state, focus, and progress, including when preferences change at
runtime. A global duration reset is not a substitute for designing alternatives.

Avoid flashing. Otherwise stay at no more than three flashes in any one-second
period or demonstrate with analysis that general-flash/red-flash thresholds
are not exceeded. Opacity can flash too. Pause controls and reduced-motion
settings do not remediate unsafe flashing before the user can act.
