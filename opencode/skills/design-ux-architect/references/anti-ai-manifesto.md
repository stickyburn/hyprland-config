# The Anti-AI Manifesto — Reasoning Behind Every Ban

## Why This Manifesto Exists

The web is drowning in a monoculture. AI-generated interfaces share a visual fingerprint:
soft shadows, gentle fades, purple gradients, springy animations, and hover effects that
make every element "pop" by 5%. This is not design — it's the absence of design. It's
the statistical average of every tutorial ever written, regurgitated without intent.

This manifesto codifies the rejection of that monoculture with surgical specificity.

---

## The Bans, Justified

### 1. NO `scale(1.05)` Hover

**The problem:** Every button, card, and link on the modern web inflates on hover. It says
"I'm interactive!" in the laziest possible visual language. It breaks grid alignment, causes
layout shifts, and is instantly recognizable as AI-default output.

**The replacement:** Internal translation. The container stays perfectly still — no layout
shift, no alignment break. Only the inner content moves. This communicates "I'm responding to
you" without screaming it. It's the difference between leaning in during a conversation vs.
standing up and waving.

**Premium alternative:** Color inversion. Black↔White in 200ms. Maximum contrast, zero
structural change. This is how Linear.app buttons work. It feels like flipping a light switch.

### 2. NO Generic Fade-In / Fade-Up on Load

**The problem:** Fading in is the ambient noise of web animation. It's so common it registers
as no animation at all. It communicates nothing about direction, hierarchy, or intent.

**The replacement:** Blur-reveal. An element exists in a state of visual uncertainty (blur)
and resolves into clarity. This mirrors how human focus works — we don't see things "fade in,"
we see them *come into focus*. The blur→clear transition carries inherent narrative:
"uncertainty → certainty."

**Premium alternative:** Clip-path wipe. A sharp directional reveal that feels like a
physical barrier being removed. Used by Apple, Linear, and every studio that understands
that *how* something appears is as important as *what* appears.

### 3. NO Generic Linear Gradients (purple→pink, blue→purple)

**The problem:** These gradients are the AI's favorite color choice. They appear in every
AI-generated hero section, every "modern" landing page, every template. They signal "I let
a machine pick my colors."

**The replacement:** Tonal gradients. Same hue, different lightness. `snow → frost`.
`carbon → basalt`. A gradient that looks like light hitting a surface, not a rainbow.
If you need two distinct hues, use a hard line — not a blend.

### 4. NO Drop Shadows / Box Shadows / Text Shadows

**The problem:** Shadows are a crutch. They create "depth" without meaning — the depth
equivalent of adding salt to every dish. They also change with OS dark mode preferences,
render differently across browsers, and are the #1 tell that a design was generated without
intent.

**The replacement:** Borders. A 1px border provides separation and hierarchy without
the ambiguity of "how deep is this element?" Borders are honest. They say "this is where
one thing ends and another begins" without pretending the screen is three-dimensional.

**For emphasis:** Use color inversion instead of shadow for elevation. A dark card on a
light background is "above" — no shadow needed.

### 5. NO Spring Animations

**The problem:** Springs are physically inaccurate for 2D interfaces. Real objects on
screens don't bounce — the metaphor comes from 3D physics engines. Spring animations
overshoot their target, create visual noise during the oscillation, and feel juvenile.
Every "playful" startup landing page uses springs. None of them feel premium.

**The replacement:** Custom cubic-bezier curves. A well-tuned bezier gives you all the
"personality" without the chaos:
- `[0.22, 1, 0.36, 1]` — Premium slow-out. Decelerates smoothly. Authority.
- `[0.76, 0, 0.24, 1]` — Aggressive snap. For destructive/confirming actions.
- `[0.87, 0, 0.13, 1]` — Dramatic pause-then-commit. For hero reveals.

### 6. NO `border-radius: 9999px` (Pill Buttons)

**The problem:** Pill buttons are the Comic Sans of shapes. They're used because "rounded
feels friendly" without any consideration for the design system. They waste horizontal space,
can't align to grid, and dominate any composition they're in.

**The replacement:** Sharp corners (0px radius) or micro-radius (2px). Sharp corners
communicate precision, editorial quality, and confidence. They align to the grid. They let
the typography and spacing do the talking instead of the button shape.

### 7. NO `translateY(-2px)` Hover Lift

**The problem:** The "lift on hover" pattern is a shadow substitute that doesn't use shadows.
It's the same visual metaphor (this element is "rising") without the shadow that justifies it.
It causes layout inconsistency and is instantly recognizable as tutorial-default.

**The replacement:** Color shift or internal content shift. The element stays where it is.
Its visual properties change. It acknowledges the interaction without pretending to levitate.

### 8. NO Glassmorphism / Backdrop-Blur

**The problem:** Glassmorphism was a 2021 trend that refused to die because AI models
recommend it constantly. It reduces text readability, performs poorly on mobile, and
creates a "frosted" aesthetic that makes every interface look like a weather widget.

**The replacement:** Solid overlays with `mix-blend-mode: difference` or simple
semi-opaque backgrounds (`bg-black/80`). These provide the same separation without
the performance cost or the visual cliché.

### 9. NO `transition: all`

**The problem:** Animating `all` properties means every repaint triggers a transition —
including `width`, `height`, `font-size`, and other expensive properties. It causes jank,
unexpected animations, and makes debugging impossible.

**The replacement:** Explicit property transitions. `transition: color 200ms cubic-bezier(0.22,1,0.36,1), background-color 200ms cubic-bezier(0.22,1,0.36,1)`.
Every animated property is intentional. Every duration is deliberate.

### 10. NO `cursor: pointer` on Non-Interactive Elements

**The problem:** The pointer cursor signals clickability. Putting it on non-clickable
elements (divs with no handler, labels without inputs, decorative elements) trains users
to distrust your interface. It's the UI equivalent of crying wolf.

**The replacement:** `cursor: default` (the browser default) for non-interactive elements.
`cursor: pointer` ONLY on `<a>`, `<button>`, and elements with `onClick` handlers.

---

## The Deeper Philosophy

Anti-AI design isn't about rejecting technology. It's about rejecting *complacency*.

Every banned pattern exists because it's the path of least resistance — the thing you'd
generate if you weren't thinking. The replacements require more effort, more intention,
and more craft. That's the point.

When you choose a clip-path wipe over a fade, you're saying: "I considered how this
element enters the user's perception, and I chose a motion that mirrors its purpose."

When you choose color inversion over a hover shadow, you're saying: "I want maximum
contrast with minimum structural disruption."

When you choose a custom bezier over a spring, you're saying: "I tuned this curve
specifically for this interaction, and it arrives at its destination with authority."

This is what separates design from decoration.

---

## Real-World References

- **Linear.app** — Blur-reveal text, custom easings, no shadows, binary hover states
- **Stripe (2024 refresh)** — Clip-path reveals, intentional motion hierarchy
- **Vercel** — Monochrome palette, sharp corners, zero shadows, type-forward design
- **Apple (product pages)** — Scroll-driven clip-path wipes, character-level animations
- **Raycast** — Filter-invert interaction patterns, border-draw elements

These companies invest millions in design. None of them use hover-scale.