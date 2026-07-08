# Design Archetype: Warm Editorial

## Atmosphere & Mood

A literary salon reimagined as a digital product. The experience is built on a warm, paper-like canvas that deliberately evokes high-quality stationery rather than a cold digital surface. Every neutral carries a subtle yellow-brown undertone; there are no cool blue-grays anywhere. The emotional tone is thoughtful, unhurried, and quietly intellectual.

The signature move is a warm serif for headlines — medium weight, generous proportions, giving every heading the gravitas of a book title. Combined with organic illustrations and a single earthy brand accent, the visual language says "thoughtful companion" rather than "powerful tool."

**Key Characteristics:**
- Warm parchment-like canvas as the emotional foundation
- Serif headlines at a single, consistent medium weight for authority
- Earthy, un-tech brand accent (burnt orange, terracotta, or ochre)
- Exclusively warm-toned neutrals in every surface and text role
- Organic, editorial illustrations replacing geometric iconography
- Ring-based shadow system creating border-like depth without visible borders
- Magazine-like pacing with generous section spacing and serif-driven hierarchy

## Color Philosophy

### Primary Roles
- **Primary surface**: A warm cream or parchment tone — the emotional base of the design. Not pure white.
- **Elevated surface**: A slightly lighter warm white for cards and containers, creating subtle layering.
- **Primary text**: A warm near-black with an olive or brown undertone — gentler than pure black.
- **Brand accent**: A burnt orange, terracotta, or earthy ochre. Used sparingly for primary CTAs and highest-signal brand moments.
- **Secondary text**: A warm medium gray with yellow-brown undertones.
- **Tertiary text**: A lighter warm gray for metadata and de-emphasized content.

### Surface & Border Logic
- Light-theme borders should be barely visible warm creams, creating the gentlest possible containment.
- Dark surfaces (if used) should maintain the warm olive or brown undertone — never cool charcoal.
- Shadows, when used, should be warm transparent blacks or warm ring shadows.

### Gradient Strategy
- Avoid traditional gradients. Depth comes from the interplay of warm surface tones and light/dark section alternation.

## Typography Direction

### Genre
- **Headlines**: Warm serif typeface. Use a single, consistent medium weight for all headlines to create a unified "authorial voice."
- **Body / UI**: Clean humanist sans-serif. Use regular weight for reading, medium for UI labels.
- **Code / Mono**: A crisp monospace for inline code and technical labels.

### Principles
- Tight-but-comfortable line-heights for headings (1.10–1.30) to create a reading cadence like an essay.
- Relaxed body line-height (1.50–1.70) for a literary reading experience.
- Generous letter-spacing for very small labels to maintain readability.
- Maintain a clear serif/sans split: serif for content headlines, sans for functional UI text.

## Component Patterns

### Buttons
- **Secondary / workhorse**: Warm sand or cream background with warm dark text. Asymmetric padding is acceptable for icon-first layouts. Use ring shadows for depth.
- **Primary CTA**: The brand accent color with light cream or ivory text. Reserve this for the highest-priority action.
- **Dark variant**: Warm charcoal background with warm light text, used on dark sections.
- **White / elevated**: Pure white or warm ivory with warm near-black text, for cards or light sections.

### Cards & Containers
- Background: elevated surface color on light backgrounds; warm charcoal on dark.
- Border: thin, barely visible warm cream. Prefer ring shadows over visible borders.
- Radius: comfortably rounded (8–12px) for standard cards; generously rounded (16–32px) for hero containers and media.
- Shadow: whisper-soft, extremely subtle drop shadow for elevated cards; ring shadows for interactive states.

### Inputs & Forms
- Compact vertical padding with standard warm borders.
- Focus ring: a single accessible cool blue may be used here if needed for accessibility, but keep it minimal.
- Generously rounded corners to maintain softness.

### Navigation
- Sticky top nav with warm background matching the primary surface.
- Links in warm near-black, olive gray, or dark warm tones.
- CTA: brand accent button or white surface button.
- Hover: text shifts to foreground color, no underline decoration.

### Image Treatment
- Product screenshots with generous border-radius.
- Organic, hand-drawn-feeling illustrations for conceptual sections.
- Dark UI screenshots can provide contrast against warm light canvas.

## Layout & Spacing

### Spacing System
- Base unit: 8px is standard, but the scale can be organic.
- Section vertical spacing: generous (80–120px) to create magazine-like pacing.
- Card internal padding: approximately 24–32px.
- Button padding: can be asymmetric for icon+text layouts.

### Grid & Container
- Max container width: approximately 1100–1200px, centered.
- Feature sections: single-column editorial or 2–3 column card grids.
- Full-width dark sections can break the container for emphasis, creating chapter-like rhythm.

### Whitespace Philosophy
- **Editorial pacing**: Each section breathes like a magazine spread. Generous margins create natural reading pauses.
- **Serif-driven rhythm**: Serif headings establish a literary cadence that demands more whitespace than sans-serif designs.
- **Content island approach**: Sections can alternate between light and dark environments, creating distinct "rooms" for each message.

## Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | No shadow, no border | Primary surface background |
| Contained | Thin warm border | Standard cards, sections |
| Ring | Ring shadow using warm grays | Interactive cards, buttons, hover states |
| Whisper | Extremely soft drop shadow | Elevated feature cards, product screenshots |
| Inset | Subtle inner shadow | Active/pressed button states |

**Shadow Philosophy**: Communicate depth through warm-toned ring shadows rather than traditional drop shadows. The ring shadow creates a border-like halo that is softer than an actual border. When drop shadows appear, they should be barely visible (very low opacity, large blur) — suggesting floating rather than casting.

## Do's and Don'ts

### Do
- Use the warm parchment/cream surface as the primary light background.
- Use a single, consistent medium weight for all serif headlines.
- Use the brand accent only for primary CTAs and highest-signal brand moments.
- Keep all neutrals warm-toned.
- Use ring shadows for interactive element states instead of heavy drop shadows.
- Maintain generous body line-height (1.50+) for a literary reading experience.
- Alternate between light and dark sections to create chapter-like page rhythm.
- Apply generous border-radius for a soft, approachable feel.

### Don't
- Don't use cool blue-grays anywhere.
- Don't use bold or heavy weights on serif headlines — keep them at a single medium weight.
- Don't introduce saturated colors beyond the single earthy accent.
- Don't use sharp corners on buttons or cards.
- Don't apply heavy drop shadows.
- Don't use pure white as a page background.
- Don't use geometric or tech-style illustrations.
- Don't reduce body line-height below 1.40.
- Don't use monospace fonts for non-code content.
- Don't mix sans-serif into headlines — maintain the serif/sans split.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a hero section on a warm parchment background with a serif headline at a large display size, tight line-height, in warm near-black text. Add a subtitle in warm medium gray with relaxed line-height. Place a single earthy terracotta CTA button with cream text."
- "Design a feature card on an ivory surface with a barely visible warm cream border and comfortably rounded corners. Title in warm serif at medium weight, description in warm olive gray sans-serif. Add a whisper-soft shadow."
- "Build a dark section on warm near-black with cream headline text in serif. Use warm silver for body text. Borders in warm charcoal."
- "Create a button in warm sand with warm dark text and a ring shadow. Asymmetric padding for icon-first layout."
- "Design a model comparison grid with three cards on ivory surfaces. Each card gets a warm border separation, model name in serif, and description in warm gray sans-serif."

### Iteration Guide
1. Focus on ONE component at a time.
2. Reference color roles semantically — "use warm secondary gray" not "use hex #5e5d59."
3. Always specify warm-toned variants.
4. Describe serif vs sans usage explicitly.
5. Use "ring shadow" or "whisper shadow" — never generic "drop shadow."
6. Specify the warm background semantically.
7. Keep illustrations organic and conceptual.
