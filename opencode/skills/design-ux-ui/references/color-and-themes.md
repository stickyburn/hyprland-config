# Color and Themes

Use for palettes, semantic tokens, theme changes, and visualization color.

## Choose a Luminance and Accent System

Inspect the existing brand and tokens. For a new system, choose atmosphere
and roles before values: canvas, surfaces, text hierarchy, borders, focus,
actions, and the semantic states actually used.

- Build clear lightness hierarchy before adding hue. Muted text still needs
  to be legible; it should not collapse into primary text or the background.
- Give accents a deliberate job and enough quiet surroundings to matter.
  Multiple hues are valid when identity or information warrants them.
- Choose the palette from content and intended character. Do not default to
  violet glass/glow, cream/terracotta, or near-black/neon because they are
  familiar model habits. Those palettes remain valid when the brief supports them.
- OKLCH helps construct ramps; check actual rendered pairings and optical
  balance. Generate only shades the interface needs.

## Tokens and Contrast

Reuse the semantic contract. A small project can use semantic CSS properties;
larger systems may need primitives and component aliases. Do not add unused
layers or scatter raw values. Name tokens by purpose.

Verify foreground/background pairs, including hover, selected, focus, and
error states, rather than assuming a token name guarantees accessibility:

| Pair | WCAG AA baseline |
|---|---:|
| Normal text | 4.5:1 |
| Large text | 3:1 |
| Essential UI boundaries and meaningful graphics | 3:1 against adjacent colors |

Large text means 24 CSS px normal or about 18.7 CSS px bold. Check focus
indicators against adjacent surfaces. Color cannot be the sole state cue.
Disabled controls have exceptions; placeholder text is not a general exception.

## Themes

Dark mode needs its own luminance system, not inversion. Distinguish surfaces
through lightness and borders; retune accent chroma/lightness for prominence
and contrast. Pure black or white is a context choice, not a forbidden value.

Set `color-scheme` and inspect native controls, images, charts, syntax,
selection, and focus in each supported theme. Respect the existing default;
for new products, use system preference and an explicit override when useful.
Do not add extra themes outside the requested scope.

## Data Visualization

Use position and length for quantitative comparisons; sequential color for
magnitude, diverging color around a meaningful midpoint, categorical color
for distinct groups. Limit categories, label directly, and use patterns,
shapes, or line styles where needed. Preserve exact values through readable
text or tables. Recheck chart meaning in grayscale and color-vision deficiencies.
