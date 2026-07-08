---
name: motion
description: "Motion design and micro-interaction skill. Creates animations, transitions, micro-interactions, animated icons, ambient motion, and generative movement — using CSS, SVG animation, p5.js, WebGL, or animation libraries (lucide-animated, LivelyIcons, Motion, GSAP). Covers: motion archetypes, spring physics, morphing transitions, proximity-aware interactions, cascade reveals, temporal animation, and anti-patterns for avoiding AI-slop. Use when users request: animations, micro-interactions, hover states, page transitions, animated icons, motion design, living interfaces, ambient backgrounds, or anything that moves."
metadata:
  hermes:
    tags: [motion, animation, micro-interaction, transition, hover, animated-icons, p5js, generative-motion, ambient, alive]
    related_skills: [design-ux-ui]
---

# Motion Design

## Scope

This skill owns **everything that moves**. The design skill owns **everything that sits still**.

| This skill handles | Design skill handles |
|---|---|
| Motion timing, easing, duration | Layout structure, grids |
| Hover, focus, active states | Color palettes, typography |
| Page/screen transitions | Spacing, rhythm |
| Animated icons (lucide-animated, LivelyIcons, etc.) | Component architecture |
| Ambient/generative motion (p5.js, canvas) | Static visual hierarchy |
| Scroll-driven animation | Border radius, shadows, depth |
| Particle systems, flow fields | Content structure |
| Spring physics, morphing transitions | — |

**When a user asks for both static design and motion**, use the design skill for layout/visual system, then apply this skill's motion archetypes and patterns on top.

## Philosophy

**Motion is behavior, not decoration.** Every animation communicates something: weight, intention, relationship, or state. If an animation doesn't communicate, remove it.

**Alive, not animated.** The goal is never "add an animation." The goal is to make the interface feel like it has presence — elements that breathe, respond with weight, and reveal themselves with intention. Stillness is fine. Fidgeting is not.

**Surprise through specificity.** Generic animations (fade-in, scale-up, slide-right) read as templates. Specific animations (a shape that deforms before settling, content that reveals character-by-character, a hover state that shifts color temperature instead of scaling) feel authored.

**First-render excellence is non-negotiable.** If the output looks like a tutorial example, a library default, or "AI-generated animation," it is wrong. Rethink before shipping.

**Go beyond the reference vocabulary.** The easing curves, spring formulas, and p5.js techniques in the references are a starting vocabulary. For every project, combine, layer, and invent. The catalog is a palette of paints — you write the painting.

## How to Use

1. **Read the user's prompt** and identify the motion context: what's moving, why, and how the user will experience it.
2. **Match to a motion archetype** from the catalog below (or blend 2–3).
3. **Select the right tool** — CSS, p5.js, icon library, or WebGL — based on the archetype and complexity.
4. **Load references on demand:** `skill_view(name="motion", file_path="references/<file>.md")` — only load what the chosen tool needs.
5. **Generate the animation** following the code patterns below. Apply all Quality Principles.
6. **Verify:** Does it feel alive? Would you notice it if it stopped? Does it avoid every anti-pattern?

## Motion Archetypes

Each archetype defines a **motion personality** — how things move, settle, and respond. The visual design (colors, fonts, layout) comes from the design skill or the project context. This skill only defines *how* things move.

### Archetype Catalog

| Archetype | Motion Personality | Best For |
|-----------|-------------------|----------|
| `ambient-breathe` | Slow, organic, never perfectly still. Elements drift, pulse imperceptibly, or shift density over time. Motion is barely noticeable until absent. | Living backgrounds, ambient surfaces, meditative spaces, breathing indicators |
| `spring-settle` | Physical response with real mass. Overshoot, oscillate, recover. Different elements have different stiffness and damping — a button feels heavier than a badge. | Interactive elements, drag responses, toggle states, confirmation feedback |
| `elastic-deform` | Shapes change form before settling into a new state. Morphing, fluid boundaries, organic transformation. Never simple scale/translate. | State changes, mode transitions, icon morphs, card expansion |
| `cascade-reveal` | Content appears with directional intent and staggered rhythm. Not uniform delay — each element enters with its own timing based on position, importance, or type. | Page transitions, list reveals, content loading, modal appearance |
| `proximity-reactive` | Elements respond to the user's approach before contact. Magnetic pull, color temperature shift, subtle reorientation. The interaction begins before the click. | Buttons, cards, navigation items, interactive surfaces |
| `temporal-evolve` | Motion driven by algorithms, not timelines. Generative patterns that never repeat exactly. Noise-driven wandering, emergent flocking, reaction-diffusion growth. | Ambient art, data visualization, generative backgrounds, living wallpapers |

### Archetype Blending

Blend archetypes for richer motion. Pick one as **primary** (dominant behavior) and one as **secondary** (accent layer):

- `proximity-reactive` + `spring-settle` → magnetic hover that overshoots and settles with weight
- `cascade-reveal` + `elastic-deform` → content that reveals as shapes morph into position
- `ambient-breathe` + `temporal-evolve` → living surface with generative motion underneath
- `spring-settle` + `proximity-reactive` → interactive elements that anticipate and respond physically

## Tool Selection

Choose the simplest tool that achieves the motion personality:

| Tool | Use When | Examples |
|------|----------|----------|
| **CSS transitions/animations** | Single-element motion, hover states, simple sequences, page transitions | Morphing buttons, cascade reveals, proximity reactions |
| **CSS + SVG** | Animated icons, shape morphs, path animations | Icon state changes, loading indicators, progress visuals |
| **Icon animation libraries** | Pre-built animated icon sets needed | `lucide-animated`, `LivelyIcons`, `@animated-color-icons/*`, `motion-icons-react` |
| **Motion / Framer Motion** | React projects needing layout animations, shared element transitions, orchestration | Route transitions, list reordering, complex sequences |
| **p5.js canvas** | Generative motion, particle systems, ambient art, complex motion that CSS can't express | Living backgrounds, generative compositions, flow fields, noise-driven atmospheres |
| **WebGL / shaders** | 3D motion, post-processing, GPU-accelerated effects with thousands of elements | Particle fields, fluid simulation, depth-based parallax |
| **GSAP** | Complex timeline sequencing, scroll-driven animation with precise control | Scroll-triggered narratives, multi-element choreography |

### Icon Animation Libraries

For animated icons, prefer these based on project needs:

- **`lucide-animated`** — CSS-driven animated Lucide icons, zero JS overhead, MIT licensed. Best for: lightweight projects, hover-triggered icon states.
- **`LivelyIcons`** — 1,300+ icons with Motion (Framer fork), 14 motion types, 4 trigger modes. Best for: React projects needing rich icon animations with programmatic control.
- **`@animated-color-icons/*`** — CSS-only hover animations with two-tone color via CSS custom properties. Supports React, Vue, Svelte, Solid. Best for: cross-framework projects, color-reactive icons.
- **`motion-icons-react`** — Framer Motion powered, React-focused. Best for: React projects already using Motion.

## Anti-Patterns — What to Never Do

These patterns are the visual language of AI-generated animation. **If your solution uses any of these, it is wrong.** Rethink the interaction before shipping.

### Banned Hover/Click Patterns

| Anti-Pattern | Why It Reads as AI-Slop | Replace With |
|---|---|---|
| `transform: scale(1.05)` on button/card hover | The most generic "make it interactive" signal. Every AI uses it. | Color temperature shift, border animation, content displacement, icon state change, texture response |
| Card hover: `translateY(-4px)` + increased `box-shadow` | Tutorial default since 2015. Reads as boilerplate. | Border color shift, subtle content reflow, ambient particle response, elastic corner deformation |
| Ripple effect on every click | Material Design copied everywhere without context. | Localized color bloom, ripple with physics propagation, shape morph, content displacement |
| `transform: scaleX(0) → scaleX(1)` for underline | Mechanical, linear, reads as template. | Draw the path with stroke-dashoffset, morph a custom shape, reveal through a mask |

### Banned Entrance/Reveal Patterns

| Anti-Pattern | Why It Reads as AI-Slop | Replace With |
|---|---|---|
| `opacity: 0; transform: translateY(20px)` with staggered delay | The single most common AI entrance animation. Instant giveaway. | Character-level reveals, clip-path expansions, elastic deformations, progressive masking, stagger by element type not position |
| Simple fade between pages (`opacity` crossfade) | No spatial relationship communicated. Reads as default. | Directional wipe, content morph, spatial push/pull, progressive layer reveal, shared element transition |
| Uniform stagger delay on list items (`delay: i * 0.1s`) | Mechanical rhythm. Reads as algorithmic, not authored. | Stagger by importance, content type, or visual weight. Use varied delays. Cascade from focal point. |
| Skeleton loaders: gray rect with opacity pulse | Generic placeholder. No personality. | Progressive shape assembly, content skeleton with organic growth, ambient noise texture, blurred-to-sharp reveal |

### Banned Generic Animations

| Anti-Pattern | Why It Reads as AI-Slop | Replace With |
|---|---|---|
| Rotating gradient background (`background-size: 200% 200%` + `animation: gradient 3s ease infinite`) | The AI gradient. Instantly recognizable. | Noise-driven color fields, proximity-reactive gradients, layered atmospheric color with temporal drift |
| Everything uses spring physics | Springs become meaningless when everything springs. Some things should be snappy, some languid, some mechanical. | Vary motion personality per element. Heavy things spring differently than light things. |
| `transition: all 0.3s ease` | The AI transition. Generic duration, generic timing, generic property. | Custom cubic-bezier with character, spring physics for interactive elements, noise-driven timing for ambient motion |
| Rainbow/gradient text as default decoration | Overused in AI outputs. Reads as "look how creative I am." | Use gradient text only when it communicates something: state, data, or hierarchy. |
| Tutorial particle systems following mouse | Every p5.js tutorial produces this. Instantly recognizable. | Particle ecologies with emergent behavior, depth-layered atmospheres, proximity-reactive fields, curl noise flow |
| Generic hamburger-to-X morph | The most copied animation on the web. | Morphing icon with organic curve, shape dissolve/reform, contextual icon swap with motion |
| Basic accordion: height transition + fade | Mechanical. Content doesn't "open" — it stretches. | Content reveal with elastic curtain, staggered character appearance, progressive disclosure with spring settling |
| Over-animated everything | When every element moves, nothing stands out. | Motion hierarchy: one primary animation, supporting accents, and intentional stillness. |

## Quality Principles — What Makes It Feel Alive

These are the non-negotiable principles that separate "alive" from "animated."

### 1. Nothing is perfectly still (when it shouldn't be)

Elements that represent living, active, or ambient things should have *some* motion — even if imperceptible. A subtle scale oscillation. A brightness pulse. A drift. Stillness reads as dead. But don't animate static things — a heading shouldn't breathe.

### 2. Easing has character — never generic

Every transition uses an easing curve with personality. Springs for interactive response. Custom cubic-bezier for authored motion. Noise-driven timing for organic wandering. Never `ease` or `ease-in-out` unless deliberately bland.

### 3. Interaction has weight and anticipation

When the user approaches or interacts, something should respond — but not instantly, not uniformly, not mechanically. Add delay for weight, spring for physicality, or propagation for surface-feel. The element should feel like it has mass.

### 4. Motion reveals hierarchy

Not everything moves the same way. Primary content enters with more intention. Secondary content follows. Decorative elements barely move. Motion communicates importance.

### 5. Backgrounds have atmosphere (when generative)

When using p5.js or canvas for ambient motion, the background is never empty. Always layered: a slow atmospheric layer, a moderate motion layer, a detail layer. Each at different speeds, with different noise scales.

### 6. Micro-detail rewards attention

Something small that only appears on close inspection: a particle that occasionally catches light, a border that subtly shifts hue, an icon that occasionally breathes. These details are what make an interaction feel authored, not generated.

### 7. Temporal variation in color

When motion involves color, it should shift over time — hue drift, saturation response to activity, brightness pulse. Static colors in animated contexts read as frozen.

### 8. Composition over feature count

One well-crafted animation is infinitely better than three mediocre ones. Every animated element should share:
- A motion energy (calm or energetic, not randomly mixed)
- A timing vocabulary (related easing curves, related durations)
- A response personality (snappy, languid, mechanical, or organic — consistent per element type)

## Pipeline

Every motion project follows the same path:

```
CONTEXT → ARCHETYPE → TOOL → CODE → PREVIEW → VERIFY
```

1. **CONTEXT** — What's moving? Why? What should the user feel? What's the mood?
2. **ARCHETYPE** — Match to a motion archetype (or blend). This defines the motion personality.
3. **TOOL** — Choose the simplest tool: CSS, SVG, icon library, p5.js, WebGL, or GSAP.
4. **CODE** — Generate the animation. Apply all Quality Principles. Avoid every Anti-Pattern.
5. **PREVIEW** — Test in browser. Does it feel alive? Does it avoid AI-slop patterns?
6. **VERIFY** — Would you notice if it stopped? Does it communicate something? Is it specific, not generic?

## Code Patterns

### CSS — Hover with Proximity Reactivity

Never scale. Never translate. Respond with character:

```css
/* GOOD: Color temperature shift on hover */
.element {
  --hue: /* derive from project context */;
  transition: background-color /* derive duration from motion archetype */;
  transition-timing-function: /* derive from motion personality */;
}

.element:hover {
  --hue: /* shift hue based on proximity */;
}

/* GOOD: Border animation instead of scale */
.element {
  border: 1px solid /* derive color from context */;
  transition: border-color, box-shadow;
  transition-timing-function: /* custom cubic-bezier with character */;
}

.element:hover {
  border-color: /* shifted hue */;
  box-shadow: /* derive from motion archetype — not a generic lift */;
}
```

### CSS — Cascade Reveal (Non-Uniform)

Never uniform stagger. Reveal with intention:

```css
/* GOOD: Stagger by element type, not position */
.list-item[data-priority="primary"] {
  animation: reveal-primary /* derive duration */ /* derive easing */;
  animation-delay: /* derive from cascade origin */;
}

.list-item[data-priority="secondary"] {
  animation: reveal-secondary /* derive duration */ /* derive easing */;
  animation-delay: /* longer than primary */;
}

@keyframes reveal-primary {
  /* derive from motion archetype — NOT opacity + translateY */
}
```

### CSS — Morphing Transition

Never scale/translate for state changes. Morph:

```css
/* GOOD: Shape morph using clip-path or stroke-dashoffset */
.underline {
  stroke-dasharray: /* derive length */;
  stroke-dashoffset: /* derive length */;
  transition: stroke-dashoffset /* derive duration */ /* derive easing */;
}

/* GOOD: Custom shape morph with CSS */
.icon-state {
  clip-path: /* derive initial shape from context */;
  transition: clip-path /* derive duration */ /* derive easing */;
}

.icon-state.active {
  clip-path: /* derive target shape from context */;
}
```

### Icon Libraries — Animated Icons

```jsx
// GOOD: LivelyIcons with trigger-based animation
import { LivelyIcon } from 'lively-icons';

<LivelyIcon
  name="heart"
  trigger="hover"    // or "click", "scroll", "mount"
  speed={/* derive from motion archetype */}
  color={/* derive from project context */}
/>

// GOOD: lucide-animated for lightweight hover icons
import { AnimatedHeart } from 'lucide-animated';

<AnimatedHeart
  onHover
  color={/* derive from project context */}
/>
```

### p5.js — Ambient Motion

When using p5.js for generative motion:

```javascript
// GOOD: Layered ambient motion with temporal color variation
// Background layer: slow, atmospheric
// Mid layer: moderate, main motion
// Foreground layer: fast, detail
// Each layer: different noise scale, different speed, different opacity

// Colors shift over time — never static
// Background has texture — never flat
// Elements have imperceptible motion — never perfectly still

// See references/visual-effects.md for noise, flow fields, particles
// See references/animation.md for easing, springs, temporal patterns
```

### Spring Physics — With Personality

Not everything springs the same:

```javascript
// GOOD: Different spring personalities per element
const buttonSpring = { stiffness: /* derive — snappy */, damping: /* derive */ };
const cardSpring = { stiffness: /* derive — heavier */, damping: /* derive */ };
const badgeSpring = { stiffness: /* derive — light */, damping: /* derive */ };

// Heavy things settle slower. Light things settle faster.
// Springs communicate weight, not just motion.
```

## Per-Project Requirements

For every project, deliver:

- **Motion archetype** — which archetype (or blend) defines the motion personality
- **Custom easing/timing** — derived from the archetype, never generic `ease` or `ease-in-out`
- **Interaction with weight** — spring, delay, or propagation — never instant response
- **One invented detail** — a micro-interaction, occasional animation, hidden behavior, or emergent pattern the user didn't ask for
- **Temporal variation** — colors shift, speeds vary, or density changes over time
- **Motion hierarchy** — primary animation, supporting accents, intentional stillness

## Workflow

### Step 1: Articulate the Motion Context

Before any code, define:

- **What's moving?** Which elements, and in what order?
- **Why?** What does the motion communicate? State? Relationship? Weight? Invitation?
- **Motion personality** — snappy, languid, mechanical, organic, or a blend?
- **Interaction character** — how does it respond? Gently? Playfully? Reluctantly? Eagerly?
- **The extra thing** — what's the one detail that makes it feel authored?

### Step 2: Select the Tool

- **CSS/SVG** — for single-element motion, hover states, transitions, icon morphs
- **Icon library** — for pre-built animated icon sets (lucide-animated, LivelyIcons, etc.)
- **p5.js** — for generative motion, ambient art, particle systems, complex atmospheres
- **WebGL** — for 3D motion, GPU-accelerated effects, shader-driven animation
- **GSAP** — for complex timeline sequencing, scroll-driven narratives

### Step 3: Generate the Code

Follow the code patterns above. Apply all Quality Principles. Avoid every Anti-Pattern.

For **CSS animations**: inline in the project's stylesheet or component. Use CSS custom properties for values derived from context.

For **icon libraries**: import the specific icons needed. Configure animation properties based on the motion archetype.

For **p5.js**: single self-contained HTML file for standalone sketches, or integrate into existing projects. Structure: globals → `setup()` → `draw()` → helpers → classes → events.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><!-- derive from project context --></title>
  <script>p5.disableFriendlyErrors = true;</script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.11.3/p5.min.js"></script>
  <style>
    html, body { margin: 0; padding: 0; overflow: hidden; }
    canvas { display: block; }
  </style>
</head>
<body>
<script>
// === Configuration — derive from project context ===
const CONFIG = {
  seed: /* derive */,
  // ... project-specific parameters with meaningful names
};

// === Color System — derive from project mood ===
const PALETTE = {
  bg: /* derive from atmosphere */,
  primary: /* derive from mood */,
  secondary: /* derive from mood */,
  // ...
};

// === Layer Definitions — derive from motion archetype ===
const LAYERS = {
  bg:  { noiseScale: /* derive — slow */, speed: /* derive */ },
  mid: { noiseScale: /* derive — moderate */, speed: /* derive */ },
  fg:  { noiseScale: /* derive — fast */, speed: /* derive */ },
};

// === Global State ===
// ...

function setup() {
  createCanvas(/* derive from context */);
  pixelDensity(1);
  randomSeed(CONFIG.seed);
  noiseSeed(CONFIG.seed);
  colorMode(/* derive from context */);
  // Initialize...
}

function draw() {
  // 1. Background (textured, never flat)
  // 2. Background layer (slow, atmospheric)
  // 3. Mid layer (moderate, main motion)
  // 4. Foreground layer (fast, detail)
  // 5. Micro-details (sparkles, occasional events)
}

// === Event Handlers ===
function mousePressed() { /* interaction with weight */ }
function keyPressed() {
  if (key === 's' || key === 'S') saveCanvas('output', 'png');
  if (key === ' ') CONFIG.paused = !CONFIG.paused;
}
function windowResized() { resizeCanvas(windowWidth, windowHeight); }
</script>
</body>
</html>
```

### Step 4: Preview & Iterate

- Open in browser. Verify motion quality.
- **Leave it running for 30 seconds** — does it still feel alive?
- **Test interaction** — does it respond with weight, not instantly?
- **Check for anti-patterns** — any AI-slop patterns? If yes, rethink.

### Step 5: Verify

- **Alive test**: Does it feel alive? Would you notice if it stopped?
- **Anti-pattern test**: Does it avoid every banned pattern in the Anti-Patterns section?
- **Specificity test**: Is the motion specific to this project, or could it be any project?
- **Performance**: 60fps for interactive, 30fps minimum for ambient animation
- **Edge cases**: Resize behavior, after extended running, at different viewport sizes

## Critical Implementation Notes

### Performance — Disable FES for p5.js

```javascript
p5.disableFriendlyErrors = true;  // BEFORE setup() — up to 10x faster
```

In hot loops, use `Math.*` instead of p5 wrappers for measurable speed gains.

### Seeded Randomness for Generative Motion

```javascript
function setup() {
  randomSeed(CONFIG.seed);
  noiseSeed(CONFIG.seed);
}
```

### Color Mode for Generative Motion

Use HSB for intuitive temporal color control — hue rotation, saturation response, brightness pulse. Never hardcode raw RGB values.

### Noise — Multi-Octave, Never Raw

Raw `noise(x, y)` looks like smooth blobs. Layer octaves (fBM) for natural texture. For flowing organic motion, combine: curl noise + domain warp + temporal drift.

### Layering for Depth

Flat single-pass rendering reads as flat. Use multiple layers — offscreen buffers, CSS layers, or z-index stacking — each with different motion speeds and noise scales.

### Agent Workflow

1. **Generate the code** — CSS, icon library import, p5.js sketch, or WebGL shader
2. **Open in browser** — `open file.html` (macOS) or `xdg-open file.html` (Linux)
3. **Preview & iterate** — edit, refresh, verify
4. **Load references** — `skill_view(name="motion", file_path="references/...")` as needed for p5.js technical details

## References

| File | Contents |
|------|----------|
| `references/core-api.md` | Canvas setup, coordinate system, `push()`/`pop()`, offscreen buffers, composition |
| `references/shapes-and-geometry.md` | Primitives, curves, Bezier, custom shapes, `p5.Vector`, SDFs |
| `references/visual-effects.md` | Noise (Perlin, fBM, domain warp, curl), flow fields, particles, pixel manipulation, textures, feedback, reaction-diffusion |
| `references/animation.md` | Easing, springs, state machines, timelines, noise-driven motion, transitions |
| `references/typography.md` | `text()`, `loadFont()`, `textToPoints()`, kinetic typography |
| `references/color-systems.md` | `colorMode()`, HSB/HSL/RGB, `lerpColor()`, `paletteLerp()`, procedural palettes, blend modes, gradients, curated palette library |
| `references/webgl-and-3d.md` | WEBGL, 3D primitives, camera, lighting, GLSL shaders, post-processing |
| `references/interaction.md` | Mouse/touch events, keyboard state, DOM controls, audio (p5.sound), scroll-driven |
| `references/export-pipeline.md` | `saveCanvas()`, `saveGif()`, headless capture, ffmpeg, CCapture.js |
| `references/troubleshooting.md` | Performance profiling, common mistakes, WebGL debugging, memory leaks, CORS |
