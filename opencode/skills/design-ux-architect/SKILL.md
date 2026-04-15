---
name: design-ux-architect
description: >
  Elite UI/UX design methodology for crafting bespoke, tactile web interfaces.
  Use when: Creating or revamping UIs, designing components, building layouts,
  implementing animations, establishing design systems, or when the user says
  "create a ui", "design this", "revamp", "redesign", "make it look good",
  "build a component", "add animations", "style this", "improve the UX",
  "make it modern", "design system", or requests any visual/interaction work.
  Trigger on any frontend UI task, CSS work, component styling, layout design,
  motion design, or accessibility improvements.
version: "2026-04"
---

# Design & UX Architecture Methodology

## Core Philosophy

Design is not decoration—it's communication through interaction. Every pixel should earn its place. Every animation should guide attention. Every color choice should evoke emotion.

**Anti-AI-Slop Principles:**
- Reject generic gradients, soft shadows, and "corporate safe" palettes
- Avoid symmetrical layouts—embrace intentional imbalance
- Never use placeholder copy (lorem ipsum) in final designs
- Refuse predictable hover states (simple opacity changes are lazy)

## Studio Vibe System

When the user specifies a vibe, adapt these characteristics:

| Vibe | Color Approach | Typography | Motion Language |
|------|---------------|------------|-----------------|
| **Nordic** | Muted earth tones, warm grays, single accent | Clean sans-serif, generous whitespace | Smooth, understated, purposeful |
| **LA** | High contrast, bold primaries, neon accents | Display fonts, tight tracking | Bouncy, energetic, playful |
| **Tokyo** | Electric neons, deep blacks, hyper-saturated | Compressed Japanese-inspired, stacked | Rapid, glitchy, layered |
| **Brutalist** | Raw black/white, system defaults, no smoothing | System fonts, aggressive sizing | Abrupt, instant, no easing |
| **Organic** | Natural gradients, stone/moss colors | Serif-touched, flowing | Fluid, physics-based, breathing |

**Default (no vibe specified):** Create timeless, bold designs that feel hand-crafted. Think: if Dieter Rams and a graffiti artist collaborated.

## Color Architecture

### The 60-30-10 Rule (Modified for Impact)
- **60%** Dominant: Your canvas—often off-white, deep charcoal, or rich cream
- **30%** Secondary: Structural—navigation, cards, secondary surfaces
- **10%** Accent: ONE bold accent, used sparingly but memorably

### Color Selection Protocol

1. **Start with ONE anchor color** that carries emotional weight
2. **Build contrast pairs** using complementary or split-complementary schemes
3. **Add tension** with an unexpected "wrong" color that shouldn't work but does
4. **Test under different conditions**—light mode, dark mode, high contrast

### Forbidden Patterns
- Gradients with more than 2 color stops (unless intentional chaos)
- Pure black (#000) on pure white (#FFF)—use #0a0a0a and #fafafa minimum
- Desaturated pastels without a bold accent anchor
- More than 3 distinct colors in a single view

### Advanced Techniques
- **Shadow as color**: Use warm shadows (orange/red tint) for depth
- **Isolation effect**: Single full-saturation element on muted background
- **Color as interaction**: Accent color only appears on hover/active states

## Typography System

### Hierarchy Through Tension

Create visual rhythm through deliberate mismatch:

```
Display:  [Bold, tight tracking, large scale]
Body:     [Readable, comfortable measure, breathing room]
Accent:   [Unexpected—serif with sans, condensed with wide]
Micro:    [All caps, spaced, functional]
```

### Rules That Matter

1. **Measure**: Keep line length 45-75 characters (ideal: 66)
2. **Leading**: 1.4-1.6 for body, 1.0-1.2 for display
3. **Scale Ratio**: Use 1.25 (major third) or 1.5 (perfect fifth) for type scale
4. **Contrast Ratio**: Minimum 4.5:1 for body, 7:1 for optimal readability

### Font Pairing Strategies

| Pairing | Use Case |
|---------|----------|
| Geometric Sans + Humanist Sans | Modern apps, SaaS |
| Serif Display + Sans Body | Editorial, blogs, storytelling |
| Monospace + Variable Sans | Developer tools, technical |
| Condensed + Expanded | High-impact marketing |

## Layout & Composition

### Grid Systems

**The Asymmetric Grid:**
- Use 12-column grid but break it intentionally
- Create tension with elements that bleed or float
- Allow negative space to be the loudest element

**Z-Pattern for Content, F-Pattern for Lists:**
- Hero sections: Eye moves top-left → top-right → diagonal → bottom-left
- Content heavy: Scanning in horizontal stripes

### Spacing Philosophy

Use an 8px base with these multipliers:
- `4px`: Micro adjustments, icon padding
- `8px`: Tight internal spacing
- `16px`: Component padding
- `24px`: Section separation
- `48px`: Major section breaks
- `96px+`: Page-level breathing room

**Never use arbitrary values**—every spacing decision should be from the system.

### Depth & Layering

Create depth without default shadows:
- **Overlap**: Elements that break grid boundaries
- **Scale**: Larger elements read as closer
- **Focus**: Blur or desaturate background elements
- **Motion**: Moving elements feel closer than static

## Motion & Interaction Design

### Animation Principles

1. **Purposeful**: Every animation answers "what happened and what's next?"
2. **Physical**: Motion follows natural physics (springs, not linear)
3. **Responsive**: Interface responds to cursor/finger presence before click
4. **Performant**: 60fps minimum, use transform and opacity only

### The Motion Vocabulary

| Pattern | Implementation | Use Case |
|---------|---------------|----------|
| **Reveal** | Clip-path or mask expansion | Content appearance |
| **Lift** | Scale + shadow elevation | Hover states |
| **Slide** | Transform translateX/Y | Navigation, drawers |
| **Morph** | Path interpolation, layoutId | State changes |
| **Pulse** | Scale + opacity rhythm | Attention, loading |
| **Stagger** | Delayed sequential animations | Lists, grids |

### Physics Configuration (Framer Motion)

```typescript
// Standard spring—feels alive
const spring = { type: "spring", stiffness: 300, damping: 30 }

// Bouncy—playful, energetic
const bouncy = { type: "spring", stiffness: 400, damping: 15 }

// Smooth—elegant, refined
const smooth = { type: "spring", stiffness: 200, damping: 25 }

// Snappy—immediate feedback
const snappy = { type: "spring", stiffness: 500, damping: 35 }
```

### Micro-Interaction Checklist

Every interactive element needs:
- [ ] **Rest state**: Clearly identifiable
- [ ] **Hover state**: Anticipates intent (10-50ms response)
- [ ] **Active/Pressed**: Confirms action (scale 0.98 + color shift)
- [ ] **Focus**: Accessible keyboard navigation visible
- [ ] **Disabled**: Clearly non-interactive, maintains hierarchy

## Component Design Patterns

### Buttons

**The 3D Press Effect:**
- Rest: Subtle shadow `shadow-[0_4px_0_0_rgba(0,0,0,0.2)]`
- Hover: Slight lift + shadow intensify
- Active: Translate Y 4px + shadow collapse

**Ghost vs Solid:**
- Solid: Primary actions, high emphasis
- Ghost: Secondary, contextual actions
- Text only: Tertiary, inline actions

### Cards

**Floating Card Pattern:**
- Border: 1px solid with low opacity
- Background: Semi-transparent with blur backdrop
- Shadow: Large, diffuse, colored to match accent
- Hover: Lift 8px + shadow spread increase

### Forms

**Input States:**
- Empty: Subtle border, placeholder visible
- Focus: Border transitions to accent, label floats up
- Filled: Border maintains, label stays floated
- Error: Red border + icon + message below
- Success: Green checkmark appears inline

### Navigation

**Active State Recognition:**
- Current page: Accent color + underline OR pill background
- Hover: Background highlight that doesn't shift layout
- Dropdown: Staggered children reveal on open

## Implementation Stack

### Required Technologies

- **Tailwind CSS v4**: For utility-first, JIT-compiled styles
- **Framer Motion v12+**: For declarative, physics-based animations
- **Lucide Animated**: For living iconography

### Critical CSS Patterns

```css
/* Backdrop blur with fallback */
.glass {
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

/* Text gradient with solid fallback */
.gradient-text {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

/* Smooth scroll with reduced motion respect */
html {
  scroll-behavior: smooth;
}

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

## Anti-Patterns to Avoid

### Visual Crimes
- [ ] Border-radius on everything (4px default is lazy)
- [ ] Box shadows with no color relation to the palette
- [ ] Center-aligned text blocks longer than 3 lines
- [ ] More than 2 font families
- [ ] Icons without labels (unless universally recognized)

### Interaction Failures
- [ ] No loading states for async actions
- [ ] Hover effects on touch devices
- [ ] Modal dialogs without click-outside-to-close
- [ ] Infinite scroll without a "Load More" fallback
- [ ] Form validation only on submit

### Motion Mistakes
- [ ] Animations longer than 400ms (feels sluggish)
- [ ] Elements entering from multiple directions simultaneously
- [ ] No reduced-motion alternative
- [ ] Parallax on scroll (causes motion sickness)

## Quality Checklist

Before finalizing any design:

- [ ] Color palette has tension—one element "shouldn't" work but does
- [ ] Typography has at least 2 distinct personalities
- [ ] Every interactive element has 4+ states defined
- [ ] Layout breaks the grid in at least one intentional place
- [ ] Animation serves purpose, not decoration
- [ ] Works in both light and dark modes (if applicable)
- [ ] Passes WCAG 2.1 AA contrast requirements
- [ ] Feels "designed by a human" not "generated by AI"

## References

- [Framer Motion v12 Documentation](https://motion.dev/)
- [Tailwind CSS v4 Features](https://tailwindcss.com/)
- [Lucide Animated Icons](https://lucide.dev/guide/packages/lucide-react#animation)
- [WCAG 2.1 Contrast Guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
