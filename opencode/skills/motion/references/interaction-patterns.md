# Interaction Patterns Reference

Use this reference for overlays, disclosure, lists, loading, scrolling,
gestures, choreography, and ambient motion. Adapt patterns to the product
rather than copying values mechanically.

## Control Feedback

A control needs immediate acknowledgment through state, not necessarily
movement. Press compression, fill change, shadow change, haptic feedback, or a
short highlight may all work. Keep focus styling stable and avoid transforms
that shift neighboring layout or make text visibly blur.

Hover is an enhancement, not the only feedback. Ensure touch and keyboard
users receive equivalent state information.

## Toggle and Selection

Position can show state transition, but final state also needs semantic value,
contrast, and an accessible name. A toggle may use a short slide or spring;
reduced motion can switch position immediately while retaining state color,
label, and announcement.

Do not delay the underlying state change until animation completes.

## Disclosure, Accordion, and Expand/Collapse

Animate from the control's spatial origin and preserve reading order. Height
animation can be correct because the content genuinely changes layout. Use a
measured technique, grid-track transition, clip/transform treatment, or the
existing library based on content and support. Test dynamic content and rapid
reversal.

During close, do not move focus into hidden content. Update `aria-expanded`
and hidden state in the correct sequence.

## Modal, Popover, and Drawer

- Backdrop and surface form one transition but can use different properties.
- Use origin and direction to reinforce where the surface belongs.
- Move focus according to dialog or popover semantics; restore it on close.
- Let Escape, backdrop behavior, and repeated open/close input interrupt
  safely.
- Under reduced motion, use immediate state or a short dissolve without large
  scale or travel.

## Lists and Reordering

Animate changed items, not the entire collection. New items can enter from the
insertion point; removed items can leave while neighbors move into place.
Preserve stable keys and application state.

Stagger only when sequence communicates grouping, order, or spatial origin.
For long lists, do not withhold later content. Layout animation or FLIP can
preserve object continuity during sort and reorder.

## Loading and Progress

Match feedback to the wait:

- very short action: immediate control state, often no spinner
- unknown content structure: compact progress or status
- known content structure: skeleton that matches final geometry
- determinate operation: real progress with text when useful
- optimistic action: immediate state plus recovery if the operation fails

Avoid endless shimmer, layout shift when content arrives, fake determinate
progress, and spinners that replace the object users were acting on. Announce
important async status without making live regions noisy.

## Notifications and Attention

Use motion to locate a change, then let it settle. Repeated pulsing competes
with the primary task. Toasts and banners need enough time to read, must not
steal focus unexpectedly, and should expose persistent recovery when the
message matters.

Animation cannot be the only error or success cue.

## Route and Shared-Element Transitions

Direction should agree with information architecture and platform navigation.
Shared elements work when users recognize the object across states. Avoid
morphing unrelated objects just because geometry permits it.

Keep navigation, focus, history, deep links, and scroll restoration correct
without the transition. Back gestures and rapid navigation must cancel or
retarget cleanly.

## Scroll-Linked Motion

Use scroll linkage for information that benefits from position-based progress,
such as reading progress, a controlled narrative, or a spatial diagram. Do not
animate every section into existence.

- Keep essential content available without animation.
- Avoid scrolljacking and large multi-speed parallax.
- Prefer CSS scroll-driven animation or a well-scoped observer when support and
  fallback are acceptable.
- Stop work for offscreen content.
- Test trackpad, wheel, keyboard, touch, and reduced motion.

## Gesture and Drag

Direct manipulation should track input without decorative lag. On release,
carry velocity into a bounded settle, snap, or return. Provide keyboard or
button alternatives for the resulting operation, and avoid making a precise
drag the only path.

Handle cancellation, pointer capture, scroll conflict, reduced motion, and
screen-reader operation explicitly. For custom pointer handling, accept one
active `pointerId`, set capture after any DOM move, and choose `touch-action`
before the gesture starts so the intended scroll axis remains native. Compute
velocity from position and elapsed time rather than event count. Treat
`pointercancel`, `lostpointercapture`, unmount, and superseding input as
idempotent rollback or commit paths; release capture when needed and remove all
listeners on teardown.

## Ambient and Brand Motion

Ambient motion is appropriate when atmosphere is part of the product or
story. Keep it away from sustained reading and frequent controls. Evaluate it
for at least several cycles, on mobile power constraints, and in peripheral
vision.

Persistent auto-starting motion presented alongside content may require a
pause, stop, or hide mechanism under WCAG 2.2.2. Reduced motion should use a
static composition or poster frame. Pause loops when the page is hidden.
Avoid flashes; reduced motion or a pause control cannot remediate content that
already exceeds the WCAG flash threshold.

Animated gradients, glows, particles, and floating objects are not inherently
wrong; they are generic when disconnected from subject, structure, or brand.

## Choreography Check

- Focal element is clear.
- Sequence follows causality or spatial origin.
- Content is not withheld for spectacle.
- New input can interrupt the sequence.
- Final state is correct without animation.
- Reduced motion communicates the same change.
