# Design Archetype: Minimal Monochrome

## Atmosphere & Mood

Developer infrastructure made invisible — a design system so restrained it borders on philosophical. The page is overwhelmingly white with near-black text, creating a gallery-like emptiness where every element earns its pixel. This is not minimalism as decoration; it is minimalism as engineering principle.

The type system treats the interface like a compiler treats code — every unnecessary token is stripped away until only structure remains. Aggressive negative letter-spacing at display sizes creates headlines that feel compressed, urgent, and engineered. The monospace companion serves as the "developer console" voice for technical labels.

What distinguishes this archetype is its shadow-as-border philosophy. Instead of traditional CSS borders, subtle zero-offset, zero-blur spread shadows create border-like lines without box-model implications. The entire depth system is built on layered, multi-value shadow stacks where each layer serves a distinct purpose.

**Key Characteristics:**
- Near-pure white canvas with near-black text — gallery-like emptiness
- Aggressive negative letter-spacing at display sizes
- Monospace companion for code and technical labels
- Shadow-as-border technique replacing traditional borders
- Multi-layer shadow stacks for nuanced depth
- Workflow-specific accent colors (reserved strictly for functional pipeline stages)
- Focus ring using a saturated blue for accessibility
- Pill badges with tinted backgrounds for status indicators

## Color Philosophy

### Primary
- **Primary text**: Near-black. Not pure black — the slight warmth prevents harshness.
- **Primary surface**: Pure white or very slightly tinted white.
- **True black**: Reserved for specific console/code contexts only.

### Workflow / Functional Accents
- If the product has a linear workflow, assign a distinct accent color to each step.
- These colors are functional, never decorative. They must correspond to real pipeline stages.

### Console / Code Colors
- Syntax highlighting colors for code blocks: blue, purple, pink.
- These are restricted to code contexts only.

### Interactive
- **Link color**: A bright, focused blue.
- **Focus ring**: Saturated blue for accessibility on interactive elements.

### Neutral Scale
- A tight grayscale from near-black through medium grays to off-white.
- Use for text hierarchy, borders, disabled states, and placeholders.

### Surface & Overlay
- Modal/dialog backdrops: very light translucent overlay.
- Selection highlights: subtle light gray.
- Badge backgrounds: tinted surfaces matching the badge text color.

### Shadows & Depth
- **Border shadow**: The signature technique — a zero-offset, minimal-spread shadow that replaces traditional borders.
- **Subtle elevation**: Minimal lift for cards.
- **Card stack**: Full multi-layer shadow combining border, ambient softness, depth at distance, and an inner highlight ring.

## Typography Direction

### Genre
- **Primary**: Geometric sans-serif with aggressive tracking.
- **Monospace**: Technical monospace for code, terminal output, and technical labels.

### Principles
- Compression as identity: display sizes use the most aggressive negative tracking, creating text that feels minified.
- Ligatures everywhere if the font supports them — structural, not decorative.
- Three weights: regular for reading, medium for interaction, semibold for headings/emphasis.
- Monospace in uppercase for technical labels, connecting the marketing site to the product.

## Component Patterns

### Buttons
- **Primary white**: White background with near-black text. Shadow-border technique. Hover shifts to dark background.
- **Primary dark**: Dark background with white text. Primary CTA.
- **Pill badge**: Tinted background with matching darker text, full pill radius. Status badges and tags.
- **Large pill**: Transparent or dark background, large radius. Tab navigation, section selectors.

### Cards & Containers
- Background: white.
- Border: via shadow-as-border technique, not traditional CSS border.
- Radius: standard for cards, slightly larger for featured/image cards.
- Shadow stack: multi-layer combining border shadow, subtle elevation, ambient depth, and inner highlight.
- Hover: subtle shadow intensification.

### Inputs & Forms
- Focus shadow and outline using the focus blue.
- Border via shadow technique.

### Navigation
- Clean horizontal nav on white, sticky.
- Links: geometric sans medium weight, near-black text.
- Active: weight increase or underline.
- CTA: dark pill buttons.
- Mobile: hamburger menu collapse.

### Image Treatment
- Product screenshots with thin border shadow.
- Top-rounded images for featured cards.
- Dashboard/code preview screenshots dominate feature sections.
- Soft gradient backgrounds behind hero images (pastel multi-color, barely visible).

## Layout & Spacing

### Spacing System
- Base unit: 8px.
- Scale includes fine increments but notably jumps from small to large gaps.

### Grid & Container
- Max content width: approximately 1200px.
- Hero: centered single-column with generous top padding.
- Feature sections: 2–3 column grids for cards.
- Full-width dividers between major sections.

### Whitespace Philosophy
- **Gallery emptiness**: Massive vertical padding between sections. The white space IS the design.
- **Compressed text, expanded space**: Aggressive negative letter-spacing on headlines is counterbalanced by generous surrounding whitespace.
- **Section rhythm**: White sections alternate with white sections — separation comes from borders and spacing alone.

### Border Radius Scale
- Micro: inline code snippets
- Subtle: small containers
- Standard: buttons, links, functional elements
- Comfortable: cards, list items
- Image: featured cards, image containers
- Large: tab navigation pills
- XL: large navigation links
- Full pill: badges, status pills, tags
- Circle: menu toggle, avatar containers

## Depth & Elevation

| Level | Treatment | Use |
|-------|-----------|-----|
| Flat | No shadow | Page background, text blocks |
| Ring | Shadow-as-border | Most elements |
| Light ring | Lighter ring variant | Tabs, images |
| Subtle card | Ring + minimal lift | Standard cards |
| Full card | Ring + subtle + ambient + inner highlight | Featured cards, highlighted panels |
| Focus | Saturated blue outline | Keyboard focus on all interactive elements |

**Shadow Philosophy**: Rather than using shadows for elevation in the traditional sense, use multi-value shadow stacks where each layer has a distinct architectural purpose: one creates the "border," another adds ambient softness, another handles depth at distance, and an inner ring creates a subtle glow from within.

## Do's and Don'ts

### Do
- Use aggressive negative letter-spacing at display sizes.
- Use shadow-as-border instead of traditional CSS borders.
- Enable ligatures globally if the font supports them.
- Use the three-weight system: regular, medium, semibold.
- Apply workflow accent colors only in their workflow context.
- Use multi-layer shadow stacks for cards.
- Keep the color palette achromatic for UI chrome.
- Use near-black instead of pure black for primary text.

### Don't
- Don't use positive letter-spacing on the primary sans.
- Don't use bold weight on body text — semibold is the maximum for headings.
- Don't use traditional CSS border on cards.
- Don't introduce warm colors into the UI chrome.
- Don't apply workflow accent colors decoratively.
- Don't use heavy shadows.
- Don't increase body text letter-spacing.
- Don't use pill radius on primary action buttons — pills are for badges/tags only.
- Don't skip the inner highlight ring in card shadows.

## Agent Prompt Guide

### Example Semantic Prompts
- "Create a hero section on white background. Headline at large display size geometric sans weight semibold, tight line-height, aggressive negative tracking, near-black color. Subtitle at relaxed line-height in medium gray. Dark CTA button and ghost button with shadow-border."
- "Design a card: white background, no CSS border. Use multi-layer shadow stack combining border shadow, subtle lift, ambient depth, and inner highlight. Standard radius. Title at medium size weight semibold. Body at regular weight in medium gray."
- "Build a pill badge: tinted blue background, darker blue text, full pill radius."
- "Create navigation: white sticky header. Geometric sans medium weight for links, near-black text. Dark pill CTA right-aligned. Shadow-border on bottom."
- "Design a workflow section showing three steps: each step has its own functional accent color. Geometric mono uppercase label + semibold title + regular description."

### Iteration Guide
1. Always use shadow-as-border instead of CSS border.
2. Letter-spacing scales with font size: most aggressive at largest sizes, normal at small sizes.
3. Three weights only: regular (read), medium (interact), semibold (announce).
4. Color is functional, never decorative.
5. The inner highlight ring in card shadows creates the subtle glow.
6. Monospace uppercase for technical labels, geometric sans for everything else.
