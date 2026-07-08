# Design Archetype: Dark Precision

## Atmosphere & Mood

A masterclass in dark-mode-first product design. Content emerges from near-black darkness like starlight. The overall impression is extreme precision engineering: every element exists in a carefully calibrated hierarchy of luminance, from barely-visible borders to soft, luminous text. This is not a dark theme applied to a light design — darkness is the native medium.

The type system is built on a clean, geometric sans-serif with OpenType features enabled for a more engineered character. The weight range is subtle and distinctive, with a signature "between" weight that sits between regular and medium for UI emphasis. At display sizes, aggressive negative letter-spacing creates compressed, authoritative headlines that feel engineered rather than designed.

The color system is almost entirely achromatic — dark backgrounds with white/gray text — punctuated by a single brand accent. This accent is used sparingly: only on CTAs, active states, and brand elements. Borders are ultra-thin and semi-transparent, creating structure without visual noise, like wireframes drawn in moonlight.

**Key Characteristics:**
- Dark-mode-native: near-black marketing background, slightly lighter panels, translucent elevated surfaces
- Geometric sans with aggressive negative letter-spacing at display sizes
- Single brand accent (indigo-violet, electric blue, or similar) — the only chromatic color
- Semi-transparent white borders throughout
- Button backgrounds at near-zero opacity — never solid fills
- Multi-layered shadows with inset variants for depth on dark surfaces
- Luminance stacking model: deeper = darker bg, elevated = slightly lighter bg

## Color Philosophy

### Background Surfaces
- **Deepest background**: Near-pure black with an imperceptible undertone (cool or warm depending on brand). The canvas for hero sections.
- **Panel background**: One step up from the deepest background — for sidebars and panels.
- **Elevated surface**: For cards, dropdowns, and elevated containers. Use translucent white overlays (very low opacity) rather than solid colors.
- **Secondary surface**: The lightest dark surface — used for hover states and slightly elevated components.

### Text & Content
- **Primary text**: Near-white with a barely-warm or barely-cool cast. Not pure white, preventing eye strain.
- **Secondary text**: Cool or warm silver-gray for body text and descriptions.
- **Tertiary text**: Muted gray for placeholders, metadata, and de-emphasized content.
- **Quaternary text**: The most subdued text — timestamps, disabled states, subtle labels.

### Brand & Accent
- **Brand accent**: A single chromatic color for CTA button backgrounds, brand marks, and key interactive surfaces.
- **Accent interactive**: A brighter variant for links, active states, and selected items.
- **Accent hover**: A lighter, more saturated variant for hover states on accent elements.

### Border & Divider
- **Primary border**: Solid dark border for prominent separations.
- **Standard border**: Slightly lighter solid border.
- **Subtle border**: Ultra-subtle semi-transparent border — the default for cards and inputs.
- **Standard semi-transparent**: For cards, inputs, code blocks.

### Status Colors
- Green for success/active status.
- Additional semantic colors (orange, red) used only for status indicators, not decoration.

## Typography Direction

### Genre
- **Primary**: Clean geometric sans-serif. Enable OpenType features if available for a cleaner, more geometric character.
- **Monospace**: A technical monospace for code and technical labels.

### Principles
- Use a signature "between" weight for most UI text if the font supports variable weights.
- Aggressive negative letter-spacing at display sizes creating compressed, authoritative headlines.
- OpenType features as identity: alternate letterforms for a cleaner geometric appearance if desired.
- Three-tier weight system: regular for reading, medium for emphasis/navigation, semibold for strong emphasis.
- Compression scales with size: tighter tracking for larger text, relaxing toward normal for small text.

## Component Patterns

### Buttons
- **Ghost / default**: Near-transparent background with near-white text. Thin border. Standard actions and secondary CTAs.
- **Subtle**: Very slightly less transparent background with silver-gray text. Toolbar actions.
- **Primary brand**: The single brand accent color with white text. Reserve for primary CTAs.
- **Icon button**: Circular, near-transparent with thin border. Close, menu toggle, icon-only actions.
- **Pill**: Transparent or near-transparent with thin border, full pill radius. Filter chips, tags.
- **Small toolbar**: Very compact with muted text. Toolbar actions, quick-access controls.

### Cards & Containers
- Background: translucent white at very low opacity (never solid — always translucent).
- Border: thin semi-transparent white. Standard or subtle variants.
- Radius: standard for cards, slightly larger for featured, large for panels.
- Shadow: multi-layered shadow stacks or subtle inset shadows for recessed panels.
- Hover: subtle background opacity increase.

### Inputs & Forms
- Background: translucent white at very low opacity.
- Text: silver-gray or near-white.
- Border: thin semi-transparent.
- Focus shadow: multi-layer stack.

### Badges & Pills
- Success pill: green background with near-white text, circular or pill.
- Neutral pill: transparent with silver-gray text and thin border.
- Subtle badge: very low opacity background with near-white text.

### Navigation
- Dark sticky header on near-black background.
- Links: geometric sans at medium weight, silver-gray text.
- Active/hover: text lightens to near-white.
- CTA: brand accent button or ghost button.
- Mobile: hamburger collapse.
- Search: command palette trigger.

### Image Treatment
- Product screenshots on dark backgrounds with subtle semi-transparent border.
- Dashboard/issue previews dominate feature sections.
- Subtle shadow beneath screenshots for grounding.

## Layout & Spacing

### Spacing System
- Base unit: 8px is standard.
- Scale includes micro-adjustments for optical alignment.
- Primary rhythm: standard grid increments.

### Grid & Container
- Max content width: approximately 1200px.
- Hero: centered single-column with generous vertical padding.
- Feature sections: 2–3 column grids for feature cards.
- Full-width dark sections with internal max-width constraints.

### Whitespace Philosophy
- **Darkness as space**: On a dark canvas, empty space is absence. The near-black background IS the whitespace.
- **Compressed headlines, expanded surroundings**: Dense and compressed display text sits within vast dark padding. The contrast creates tension.
- **Section isolation**: Each feature section is separated by generous vertical padding with no visible dividers.

### Border Radius Scale
- Micro: inline badges, toolbar buttons
- Standard: buttons, inputs, functional elements
- Card: cards, dropdowns, popovers
- Panel: panels, featured cards, section containers
- Large: large panel elements
- Full pill: chips, filter pills, status tags
- Circle: icon buttons, avatars, status dots

## Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | No shadow, deepest bg | Page background |
| Subtle | Tiny offset shadow | Toolbar buttons, micro-elevation |
| Surface | Translucent bg + thin semi-transparent border | Cards, input fields, containers |
| Inset | Subtle inner shadow | Recessed panels |
| Ring | Border-as-shadow technique | Dividers |
| Elevated | Soft drop shadow | Floating elements, dropdowns |
| Dialog | Multi-layer stack | Popovers, command palette, modals |

**Shadow Philosophy**: On dark surfaces, traditional shadows are nearly invisible. Communicate elevation through background luminance steps — each level slightly increases the surface background lightness. Inset shadows create a unique "sunken" effect for recessed panels.

## Do's and Don'ts

### Do
- Use geometric sans with OpenType features on all text if available.
- Use the signature medium emphasis weight as the default UI weight.
- Apply aggressive negative letter-spacing at display sizes.
- Build on near-black backgrounds with subtle undertones.
- Use semi-transparent white borders instead of solid dark borders.
- Keep button backgrounds nearly transparent.
- Reserve the brand accent for primary CTAs and interactive accents only.
- Use near-white for primary text — not pure white.
- Apply the luminance stacking model: deeper = darker, elevated = slightly lighter.

### Don't
- Don't use pure white as primary text.
- Don't use solid colored backgrounds for buttons.
- Don't apply the brand accent decoratively.
- Don't use positive letter-spacing on display text.
- Don't use visible opaque borders on dark backgrounds.
- Don't skip OpenType features if they are part of the typeface identity.
- Don't introduce warm colors into the UI chrome unless the brand demands it.
- Don't use drop shadows for elevation on dark surfaces.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a hero section on a near-black background. Headline at large display size geometric sans with tight tracking, near-white color. Subtitle in muted gray with relaxed line-height. Brand accent CTA button and ghost button with thin border."
- "Design a card on dark background: very low opacity translucent background, thin semi-transparent white border, standard radius. Title in geometric sans at medium weight, near-white. Body in muted gray sans."
- "Build a pill badge: transparent background, silver-gray text, full pill radius, thin border."
- "Create navigation: dark sticky header on panel background. Geometric sans medium weight for links in silver-gray. Brand accent CTA right-aligned with standard radius. Bottom border semi-transparent."
- "Design a command palette: elevated dark background, thin semi-transparent border, panel radius, multi-layer shadow. Input in geometric sans regular, near-white text. Results list with medium weight labels and muted metadata."

### Iteration Guide
1. Always enable OpenType features if they are part of the chosen typeface identity.
2. Letter-spacing scales with font size: tightest at largest sizes, normal below body size.
3. Three weights: regular (read), medium (emphasize/navigate), semibold (announce).
4. Surface elevation via background opacity or luminance stepping — never solid backgrounds on dark.
5. Brand accent is the only chromatic color — everything else is grayscale.
6. Borders are always semi-transparent, never solid dark colors on dark backgrounds.
7. Monospace for any code or technical content, geometric sans for everything else.
