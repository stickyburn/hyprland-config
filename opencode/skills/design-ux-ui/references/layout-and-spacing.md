# Layout and Spacing

Use for composition, density, responsive behavior, and data-heavy surfaces.

## Composition

Arrange orientation, primary content, action, secondary context, and recovery
around the task. Make priority evident through position, scale, alignment,
and space even without color. The first viewport should show the subject and
what the user can do; a working app should open on the experience, not a
marketing hero.

Vary scale and rhythm where the content warrants it. Give a signature region
room to dominate, with quieter supporting regions. Equal cards are appropriate
for true peers, not a substitute for deciding what matters.

## Density and Grouping

- Frequent expert work, comparison, and high data volume favor compact,
  organized layouts. Infrequent decisions and sustained reading favor more
  space. Both need readable type, usable targets, and efficient paths.
- Reuse the spacing scale. For a new one, selected 4px-based steps are a
  practical start, not a law. Keep internal gaps smaller than group gaps.
- Use alignment and whitespace first; add a container, border, or background
  when it communicates actual grouping, interaction, selection, or elevation.
- Align to a few clear lines. Apply optical corrections in the component
  rather than proliferating global tokens.
- Use available width for simultaneous operational context; constrain prose
  to a readable measure. Choose document flow, Grid, or Flexbox as needed.

## Responsive Decisions

Let content pressure set breakpoints. At narrow widths, deliberately choose
which regions stay, stack, collapse, change control, or scroll. Preserve the
primary task and logical DOM/focus order. Check either side of a breakpoint,
not just phone and desktop endpoints. Prefer CSS media/container queries to
JavaScript measurement; account for mobile safe areas when relevant.

- Handle long labels and unbroken values; use `min-width: 0` for shrinkable
  flex/grid children where appropriate.
- Find accidental overflow instead of hiding it. Horizontal scrolling is
  justified for a real axis such as a table, timeline, map, or canvas; make
  the region discoverable and operable.
- Reserve space for media and asynchronous content to reduce layout shift.
- Verify enlarged text, validation messages, and long content. Do not remove
  critical context merely to make a screenshot fit.

## Data and Transitional States

Choose the view by the question: tables for exact comparison, lines for trends,
bars for magnitude, distributions for spread, grouped lists or matrices for
triage. Do not turn every data set into KPI cards.

On narrow screens, use meaningful priority columns, row details, or intentional
scrolling with stable identifiers. Loading should retain useful geometry;
empty, no-results, partial, denied, and error states should preserve context
and offer the next valid action. Illustration is optional, not a substitute
for recovery.
