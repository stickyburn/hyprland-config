# Design Archetype: Premium Luxury

## Atmosphere & Mood

The visual language of exclusivity, precision, and craftsmanship. Every element is considered, every pixel justified. The design communicates that the product is expensive, well-made, and worthy of attention. This archetype is used by luxury brands, high-end consumer electronics, premium SaaS, and automotive.

The interface retreats until it becomes invisible, allowing the product to be the hero. Typography is machined and precise. Photography is cinematic. Animations are slow, smooth, and deliberate.

**Key Characteristics:**
- Vast expanses of pure black, near-white, or muted neutral backgrounds
- Product-as-hero: large, cinematic photography on solid color fields
- Extremely tight headline line-heights creating billboard-like impact
- Generous whitespace between sections — the viewport is the canvas
- Single accent color (often blue) reserved exclusively for interactive elements
- Subtle negative letter-spacing at all sizes
- Slow, smooth animations and transitions
- Minimal UI chrome

## Color Philosophy

### Primary Roles
- **Primary surface**: Pure black, near-white, or a very light gray with subtle undertone.
- **Primary text**: Near-black on light; white on dark.
- **Accent**: A single, refined color for CTAs, links, and focus states. Often a deep blue or subtle metallic.
- **Secondary text**: Muted gray, slightly softened.
- **Surfaces**: Dark surfaces should have subtle undertones, never flat charcoal.

### Image & Photography
- Product photography dominates. No gradients, no textures behind products.
- Full-bleed imagery with minimal overlays.

## Typography Direction

### Genre
- **Headlines**: Custom or proprietary geometric sans, or a very clean, engineered sans. Medium to semibold.
- **Body**: Same family, regular weight, highly readable.
- **Weights**: Restrained range. 300–600 maximum.

### Principles
- Tight line-heights for headlines (1.05–1.15).
- Negative letter-spacing at all sizes, even body.
- Weight restraint: no heavy bold. Hierarchy through size and tracking.

## Component Patterns

### Buttons
- **Pill CTA**: Large radius (pill-shaped) or minimal radius. Primary accent or dark fill.
- **Text links**: Underline on hover, accent color.
- **Minimal**: No borders unless absolutely necessary.

### Cards
- Background: matching surface.
- Border: thin, subtle.
- Radius: minimal or generous, but consistent.

### Navigation
- Minimal, often hidden or extremely clean.
- Logo and a few links only.

## Layout & Spacing

- Full-width sections.
- Massive vertical padding (120–200px+).
- Centered content with narrow max-width for text.
- Product images full-bleed or edge-to-edge.

## Depth & Elevation

- Almost no shadows. Depth comes from photography, scale, and section contrast.
- Subtle shadows only for floating UI elements.

## Do's and Don'ts

### Do
- Use vast whitespace.
- Use cinematic, high-quality photography.
- Use slow, smooth animations.
- Reserve the accent color exclusively for interactive elements.
- Keep everything precise and machined.

### Don't
- Don't use multiple accent colors.
- Don't use playful illustrations or icons.
- Don't crowd the layout.
- Don't use generic stock imagery.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a product hero section with a pure black background, cinematic product photography, and a machined sans-serif headline in white. Single blue pill CTA."
- "Design a feature section with vast whitespace, centered text, and a full-bleed product image."
- "Build a pricing page with minimal cards, subtle borders, and restrained typography."
