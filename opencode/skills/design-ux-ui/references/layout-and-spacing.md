# Layout and Spacing Reference

Use this reference for composition, grids, density, responsive behavior,
spacing systems, and empty or data-heavy surfaces.

## Compose From the Task

Start with content priority and interaction sequence, not a standard grid.
Sketch the major regions without color or decoration:

```text
orientation -> primary content or decision -> primary action
            -> secondary context          -> recovery/help
```

The layout should still communicate its surface when reduced to grayscale
blocks. Give the most important content the strongest combination of position,
scale, and space; do not make every region equally card-shaped and prominent.

## Density

Density is a product decision.

| Favor density when | Favor space when |
|---|---|
| users are trained and visit frequently | users are new or visit rarely |
| comparison and simultaneous context matter | one decision or reading path matters |
| desktop, keyboard, and precise pointing dominate | touch and mixed devices dominate |
| data volume is high | content volume is low |

Dense interfaces still need strong grouping, readable text, keyboard access,
and usable targets. Sparse interfaces still need efficient paths. Use staged
disclosure when novices and experts share the same product.

## Spacing Systems

Use an existing scale first. For a new system, a 4px base with selected steps
such as `4, 8, 12, 16, 24, 32, 48, 64, 96` is a practical start, not a law.

- Use fewer, repeated values rather than arbitrary one-off gaps.
- Keep component-internal gaps generally smaller than gaps between groups.
- Use optical corrections when geometry looks wrong; record reusable
  corrections in the component rather than creating a global token.
- Let type metrics, target size, content, and density determine component
  padding.
- Prefer whitespace and alignment for grouping; use borders and surfaces when
  the boundary carries meaning.

## Grids and Alignment

- Use Grid for two-dimensional page regions and Flexbox for one-dimensional
  flow; use normal document flow when it already solves the problem.
- Align content to a small number of meaningful lines. Intentional breaks can
  create emphasis, but accidental near-alignment looks broken.
- Constrain prose by readable measure, not an arbitrary page max-width.
- Let operational and data surfaces use available width where simultaneous
  context is valuable.
- Avoid nested containers that repeat padding and border treatment without
  adding hierarchy.

## Responsive Strategy

Design around content pressure, not a fixed list of device labels.

1. Establish the narrow layout and primary task.
2. Expand until content has enough room to form a better composition.
3. Add a breakpoint at that pressure point.
4. Verify the transition just below and above it.

At narrower widths, decide explicitly whether each region should:

- stay visible
- stack or reorder
- collapse behind disclosure
- become a different control
- scroll within a labeled, usable region
- move to a secondary route

Prefer CSS media or container queries to JavaScript layout measurement.
Preserve logical DOM and focus order when visual order changes. Account for
safe areas on full-bleed mobile layouts.

## Overflow and Long Content

- Treat horizontal overflow as a bug unless the content genuinely requires a
  horizontal axis, such as a timeline, wide table, or canvas.
- Do not hide overflow before finding its source.
- Give flex and grid children permission to shrink with `min-width: 0` where
  appropriate.
- Decide how long names, unbroken strings, translated labels, and user content
  wrap, clamp, or reveal their full value.
- Reserve image and async-content space to reduce layout shift.

## Tables and Data Views

Do not turn every data set into KPI cards. Choose the representation that
supports the question:

- lookup and exact values: table
- trend over time: line or area chart
- magnitude comparison: bars
- distribution: histogram or box plot
- status scanning: grouped list, matrix, or compact table

For narrow layouts, consider priority columns, horizontal scroll with clear
affordance, frozen identifiers, row detail views, or a task-specific summary.
Never remove critical context merely to make a screenshot fit.

## Empty and Transitional States

Design first-use, no-results, cleared, loading, partial, permission-denied,
and error states where relevant. Keep the current context visible when it
helps recovery. An empty state should explain why the surface is empty and
offer the next valid action, not fill space with illustration.

## Quality Check

- The composition exposes the primary task before decoration.
- Density matches audience, frequency, data volume, and input method.
- Spacing values repeat coherently without suppressing optical judgment.
- Breakpoints follow content pressure and preserve logical order.
- Long content, zoom, localization, and required state changes fit.
- Any horizontal scrolling is intentional, visible, and usable.
- Containers, cards, and borders communicate real grouping.
