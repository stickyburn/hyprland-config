# Real-World Examples & Studio References

These are the studios, sites, and techniques that embody the Nordic-Avant-Garde
philosophy. Study them. Reverse-engineer their patterns. Don't copy — understand
the *why* behind each decision.

---

## 1. Linear (linear.app)

**What they do right:**
- Blur-reveal on hero text (the pattern that popularized this technique)
- Custom easing on every animation — nothing feels generic
- Zero shadows. Depth comes from color contrast alone
- Binary hover states (white→black or black→white) on buttons
- Monochrome palette with surgical accent color
- Character-level animation on key headings

**Key techniques to extract:**
- Text un-blur entrance: `initial={{ filter: "blur(12px)", opacity: 0 }}`
- Inversion buttons: `hover:bg-black hover:text-white`
- Consistent 200ms transitions on micro, 600ms+ on macro

**URL:** https://linear.app

---

## 2. Vercel (vercelel.com)

**What they do right:**
- Typography-forward: the type IS the design
- Sharp corners everywhere. Zero border-radius on buttons
- Monochrome with a single accent (blue)
- Gradient borders (1px) instead of shadows
- Clip-path reveals on feature sections
- Zero hover-scale anywhere on the entire site

**Key techniques to extract:**
- `border-image` with gradients for accent borders
- `clip-path: inset()` scroll-triggered reveals
- Massive display text with tight tracking

**URL:** https://vercel.com

---

## 3. Apple Product Pages (apple.com)

**What they do right:**
- Scroll-driven clip-path animations
- Hero text that un-blurs character by character
- No shadows — depth is communicated through parallax and scale
- Deliberate, dramatic timing (800ms+ for hero elements)
- Custom cubic-bezier on every interaction

**Key techniques to extract:**
- Scroll-based animation triggers with `useScroll` + `useTransform`
- Circular clip-path reveals for modal/page transitions
- Stagger delays at 30ms per character

**URL:** https://apple.com (any product page)

---

## 4. Raycast (raycast.com)

**What they do right:**
- Command-palette-first design (their whole product IS a command palette)
- Filter: invert() for "x-ray" hover effects on cards
- Border-draw SVG animations on feature cards
- Extremely tight 4-8px spacing grid
- Monochrome with teal accent — exactly 1 accent color

**Key techniques to extract:**
- `filter: invert(1)` hover on card backgrounds
- SVG `stroke-dasharray`/`stroke-dashoffset` for border animations
- Keyboard-first interaction patterns

**URL:** https://raycast.com

---

## 5. Harmless Studios (harmless.studio)

**What they do right:**
- Avant-garde Scandinavian aesthetic
- Typography as the primary visual element
- Asymmetric layouts that feel intentional, not random
- Hover effects that use internal content shifts, never scale
- Dramatic use of white space (96px+ between sections)

**Key techniques to extract:**
- Grid layouts with deliberate asymmetry (7/5 or 8/4 splits)
- Display serif at 120px+ paired with mono at 14px
- `overflow-hidden` + `translate-x` for slide-in arrow indicators

**URL:** https://harmless.studio

---

## 6. Typographic Institute (typographicinstitute.org)

**What they do right:**
- Pure type-driven design. No images needed.
- Micro-typographic animations (tracking shifts, weight transitions)
- Clip-path wipes on section transitions
- Brutalist borders (1px solid, always)
- Academic, editorial aesthetic

**Key techniques to extract:**
- `letter-spacing` transitions on hover
- `font-variation-settings` for variable font weight animation
- Horizontal rules as design elements, not just separators

---

## 7. Neo-Brutalist Framework (static.brutalistframework.com)

**What they do right:**
- Complete rejection of "polished" AI aesthetics
- Raw, honest HTML structure
- High-contrast color combinations
- System fonts used with intention (not laziness)
- Line borders as the ONLY decoration

**Key techniques to extract:**
- `border: 4px solid black` for maximum brutalist impact
- `box-shadow: 4px 4px 0px black` as HARDCODED offset (not gradient shadow)
  — NOTE: This is the ONE exception where shadow-like effects are allowed,
  because it's a deliberate brutalist choice, not a subtle depth simulation

---

## 8. Anti-AI UI Framework (codinhood.com)

**What they do right:**
- Framework specifically designed to be hostile to AI scrapers
- Prioritizes human perception over machine readability
- Uses visual patterns that confuse automated systems but delight humans
- Advocates for "humane web" principles

**Key philosophy:**
- Design for the humans who see it, not the bots that crawl it
- Make choices that a machine wouldn't make statistically
- Embrace imperfection and asymmetry as signatures of human intent

**URL:** https://codinhood.com/post/introducing-anti-ai-ui-framework

---

## Technique Cross-Reference

| Technique | Linear | Vercel | Apple | Raycast | This Skill |
|-----------|--------|--------|-------|---------|------------|
| Blur-reveal | ✓ | | ✓ | | ✓ |
| Clip-path wipe | | ✓ | ✓ | | ✓ |
| Color inversion hover | ✓ | | | ✓ | ✓ |
| Border-draw SVG | | | | ✓ | ✓ |
| Magnetic cursor | | | ✓ | | ✓ |
| Arrow slide-in CTA | ✓ | | | ✓ | ✓ |
| Custom cubic-bezier | ✓ | ✓ | ✓ | ✓ | ✓ |
| Staggered character | ✓ | | ✓ | | ✓ |
| Zero border-radius | | ✓ | | ✓ | ✓ |
| Zero shadows | ✓ | ✓ | ✓ | ✓ | ✓ |

---

## Font Pairing Reference

| Display Font | Body Font | Mono Font | Vibe |
|-------------|-----------|------------|------|
| Instrument Serif | Inter | JetBrains Mono | **Primary (Nordic-Avant-Garde)** |
| Playfair Display | Inter | JetBrains Mono | Classical editorial |
| Cormorant | Work Sans | IBM Plex Mono | Elegant, editorial |
| Newsreader | Source Sans 3 | Fira Code | Newspaper, serious |
| EB Garamond | DM Sans | Dank Mono | Warm, literary |

**Primary pairing is non-negotiable for this skill.** Others are acceptable alternatives
only if the primary fonts are unavailable.

---

## External Resources

- **Cubic-Bezier Generator:** https://cubic-bezier.com
- **Easing Curves Reference:** https://easings.co
- **Framer Motion Docs:** https://motion.dev/docs
- **Clip-Path Animations Deep Dive:** https://karlkoch.me/writing/on-clip-path-animations
- **Blur-Reveal Tutorial (Cruip):** https://cruip.com/blur-reveal-effect-with-framer-motion-and-tailwind-css/
- **Codrops Scroll Blur:** https://tympanus.net/codrops/2024/04/23/blurry-text-reveal-on-scroll/
- **Brutalist Framework:** https://static.brutalistframework.com/
- **Augmentatism Manifesto:** https://augmentatism.com/
- **Humane Web Manifesto:** https://humanewebmanifesto.com/