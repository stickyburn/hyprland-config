# Typography Reference

Use this reference when choosing typefaces, defining type roles, repairing
hierarchy, or tuning text for dense, editorial, responsive, or dark surfaces.

## Start With Existing Constraints

Use the product's installed fonts and type tokens unless the brief calls for a
new direction. Check licensing, available weights, language coverage, variable
font axes, loading cost, and platform rendering before introducing a face.

System fonts can be the right choice for native familiarity and performance.
Inter, Roboto, or a popular display serif can also be right when deliberately
matched to the subject. The failure is an unexplained default, not the font.

## Define Roles

Use the smallest role set that creates clear hierarchy. A product often needs:

- display or page title
- section heading
- body
- label or control
- caption or metadata
- numeric or code treatment when relevant

Three to six roles usually suffice. HTML heading levels express document
structure; their visual size should fit the interface rather than a browser
default.

## Choose Type From the Subject

| Character | Possible direction |
|---|---|
| Precise, operational | compact grotesk or humanist sans; tabular numerals |
| Technical | legible sans with restrained mono for code or metadata |
| Editorial, reflective | text serif with a quiet sans for utility roles |
| Friendly, service-oriented | open humanist or softly constructed sans |
| Expressive, cultural | characterful display face used in one controlled role |

Treat these as search directions, not recipes. The same subject can support
different typography depending on audience and posture.

## Scale and Rhythm

Choose sizes by role and viewing condition, then test with real content. A
modular ratio can provide a starting point but should not dictate every value.

- Product body text commonly starts around 16px; dense expert tools may use
  smaller text when legibility, contrast, line height, and zoom are protected.
- Long-form reading often benefits from 17-20px text and 1.5-1.7 line height.
- Large display type usually needs tighter line height and tracking.
- Small labels often need more line height and slightly more tracking, not
  simply reduced opacity.
- Use fluid sizes such as `clamp()` when continuous scaling helps, but cap the
  range so hierarchy remains stable.

WCAG does not define a universal minimum font size. Readability depends on
size, x-height, weight, contrast, spacing, language, display, and zoom support.

## Measure and Wrapping

- Keep sustained reading roughly 45-80 characters per line; around 60-70ch is
  a useful default for prose.
- Interface labels should be allowed to wrap or truncate only when the full
  value remains available.
- Test headings with one, two, and several lines. `text-wrap: balance` can
  help short headings; `text-wrap: pretty` can help prose where supported.
- Use `font-variant-numeric: tabular-nums` for columns and comparisons.
- Test languages with longer words, different scripts, and missing glyphs.

## Pairing and Weight

One family with a strong range is often more coherent and faster than a pair.
When pairing, create a clear relationship through contrast in structure while
sharing enough proportion or tone to coexist.

Use weight to clarify hierarchy, not to compensate for weak layout. Confirm
that requested weights actually exist; synthetic bold and italic can render
poorly. Bold italic is valid when the typographic voice calls for it, but it
should not become a default emphasis style.

## Loading

- Reuse project font infrastructure.
- Load only used families, subsets, axes, and weights.
- Use `font-display` deliberately and provide compatible fallbacks to reduce
  layout shift.
- Self-host when privacy, reliability, or policy requires it; otherwise use a
  stable approved source.
- Preload only genuinely critical font files.

## Quality Check

- Type choices have a product-specific reason.
- Roles remain distinct without relying on color alone.
- Prose measure and line height support the reading task.
- Long labels, localization, numeric data, and zoom were considered.
- Font loading does not create avoidable layout shift or privacy issues.
- Installed faces and weights are used rather than guessed.
