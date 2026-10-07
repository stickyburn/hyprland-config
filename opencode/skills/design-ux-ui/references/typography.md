# Typography

Use for type selection, hierarchy, reading rhythm, or dense interfaces.

## Direction and Roles

Use installed fonts and tokens unless the brief calls for a new direction.
Choose type for the subject, audience, and reading task, not a fashionable
pairing. A familiar sans or system face is valid; make its roles intentional.

| Task | Useful direction, not a recipe |
|---|---|
| Operational scanning | Compact, legible sans; tabular numerals |
| Sustained editorial reading | Strong text face; quiet utility typography |
| Technical work | Legible sans; mono reserved for code or meaningful metadata |
| Expressive identity | Characterful display treatment with a readable supporting system |

Define a small role set: title, heading, body, control, metadata, and numeric
or code treatment as needed. Distinguish roles through size, weight, measure,
and spacing. Heading semantics follow document structure, not visual size.
One versatile family may outperform a decorative pairing.

## Optical Craft

- Fit display type to its composition. Hero-scale text belongs on a hero,
  not automatically inside panels, sidebars, or dashboards.
- Tune line height and tracking to the actual face and size. Avoid automatic
  italic accent words, all-uppercase micro-labels, or monospace decoration.
  Use them when they contribute to a deliberate typographic voice.
- Start body text around 16px and prose measure around 60-70ch when suitable.
  Dense tools and long-form reading need different scales; these are starting
  points, not accessibility requirements. WCAG has no universal minimum font size.
- Allow headings and labels to survive longer content. Use balanced heading
  wraps where supported; expose full values when truncation is necessary.
- Use tabular numerals for comparisons. Check symbols, language coverage,
  long words, and multi-line labels with the actual font.
- Fluid sizing is useful when it preserves hierarchy and zoom. Bound it;
  do not let viewport units alone control readable text.

## Delivery

Verify licensing, supplied weights, language coverage, and font availability
before adding a face. Avoid synthetic weights. Reuse project loading, limit
families/subsets/axes, choose `font-display` deliberately, and use compatible
fallbacks to reduce layout shift. Self-host when project policy requires it.

Inspect the loaded result at narrow and wide sizes and with enlarged text.
Correct awkward wrapping and optical alignment before adding ornament.
