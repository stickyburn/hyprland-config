# Color and Themes Reference

Use this reference when creating or changing palettes, semantic tokens, dark
mode, status colors, or data visualization color.

## Derive Roles Before Values

Start with product context:

- What atmosphere should the product create?
- Is the interface read, scanned, operated, or viewed for long periods?
- Which brand colors and constraints already exist?
- Which states must color distinguish?
- Which display conditions and themes matter?

Then define only the roles the interface uses:

```text
canvas -> surface -> elevated surface
primary text -> secondary text -> muted or disabled text
subtle border -> strong border -> focus indicator
primary action -> primary action hover/active
success / warning / danger / information, as needed
```

Choose one main accent unless the product has a justified multi-color
language. Semantic colors should remain distinguishable without color alone.

## Token Depth

Match token architecture to product scale.

For a small standalone artifact, semantic custom properties may be enough:

```css
:root {
  --surface-canvas: #f7f5f1;
  --surface-panel: #ffffff;
  --text-primary: #201f1c;
  --text-secondary: #62605a;
  --action-primary: #9f3f28;
}
```

For a maintained product with themes and many components, use three layers:

1. primitives such as color ramps
2. semantic roles such as `--color-action-primary`
3. component aliases only where components need a stable contract

Do not force a component-token layer into a tiny project, and do not scatter
raw values through a large one. Name semantic tokens by purpose rather than
appearance.

## Building Palettes

OKLCH is useful for perceptual lightness and systematic ramps, but generated
values still require visual and contrast checks. Choose anchor colors first:

1. canvas and text pair
2. surface hierarchy
3. primary action and its text
4. border and focus visibility
5. semantic states actually used
6. intermediate ramp values needed by interaction states

Avoid building ten shades for every hue when the interface uses three. Check
colors on representative surfaces and displays; mathematical uniformity does
not guarantee optical balance.

## Contrast

Verify semantic pairings, including interaction states:

- normal text: 4.5:1 for WCAG AA
- large text: 3:1
- essential controls, boundaries, focus indicators, and meaningful graphics:
  generally 3:1 against adjacent color

Do not assume placeholder or disabled content is exempt when users need to
read it. Disabled controls have an exception, but unnecessary low contrast is
still poor usability.

## Dark Themes

Dark mode is a separate luminance system, not an inverted light palette.

- Choose a canvas appropriate to the product. Near-black is often gentler;
  true black can be valid for OLED, cinematic, or brand-specific contexts.
- Express elevation with surface lightness, borders, overlays, and restrained
  shadows. Shadows alone are weak on dark canvases.
- Retune accent lightness and chroma for equivalent prominence and contrast.
  Do not blindly reuse or blindly desaturate light-theme accents.
- Use off-white text when it improves comfort, but keep required contrast.
  Pure white is not forbidden when the context calls for it.
- Set `color-scheme` so native controls and browser chrome match the theme.
- Check images, charts, syntax colors, focus rings, selection, and form
  controls in each theme.

Honor an existing product default. For new general-purpose products, support
the user's system preference and an explicit override when theme choice is
valuable. Avoid switching themes unexpectedly.

## Data Visualization

- Use position and length before hue to encode important quantitative values.
- Prefer sequential scales for magnitude, diverging scales around a meaningful
  midpoint, and categorical palettes only for separate groups.
- Keep categories few enough to distinguish and label them directly when
  possible.
- Add patterns, shapes, labels, or line styles so meaning does not depend on
  color vision.
- Use tabular or textual alternatives for critical data.

## Quality Check

- Existing brand and product tokens were inspected first.
- Every token has a used semantic role.
- Actual foreground/background/state pairs pass required contrast.
- The palette remains understandable in grayscale and common color-vision
  deficiencies.
- Dark and light themes were tuned and checked separately.
- Accent use is scarce enough to preserve emphasis.
- Raw values are centralized at the level appropriate to project scale.
