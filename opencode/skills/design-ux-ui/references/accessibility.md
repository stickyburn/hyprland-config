# Accessibility

Use for accessibility requirements and remediation. Target WCAG 2.2 AA for
web unless another standard is required. For native apps, use platform
semantics and accessibility guidance rather than transplanting web widgets.

## Contrast and Targets

| Requirement | Baseline |
|---|---|
| Normal text | 4.5:1 |
| Large text | 3:1; at least 24 CSS px normal or about 18.7 CSS px bold |
| Essential UI boundaries and graphics | 3:1 against adjacent colors |
| WCAG 2.2 AA targets | 24 × 24 CSS px or sufficient spacing, with defined exceptions |
| Practical primary touch target | Prefer 44 × 44 CSS px; native guidance commonly uses Apple 44pt / Android 48dp |

Check actual default, hover, selected, error, focus, and theme pairings.
Disabled controls have contrast exceptions, but unnecessarily faint content
still hurts usability. Color and animation cannot be the only state cues.
WCAG's 44px AAA target criterion is not an unconditional AA requirement.

## Semantics and Input

- Prefer native buttons, links, and form controls. Associate persistent labels;
  use ARIA to fill gaps, and follow APG keyboard patterns for custom widgets.
- Accessible names should match visible labels. Name icon-only controls,
  hide decorative icons, and give informative images useful alternative text.
- Keep hierarchical headings, meaningful landmarks, and a skip path through
  repeated navigation. Announce important async updates without chatty live regions.
- Support keyboard functionality, except where the operation fundamentally
  depends on the movement path. Offer practical alternative outcomes for such
  tasks. Dragging operations generally also need a non-drag pointer alternative.
- Hover must not be the sole way to discover or operate controls. Preserve
  text selection, paste, autofill, and password-manager behavior.

## Focus and Recovery

Use a visible focus indicator; do not remove outlines without an equivalent.
Check contrast, clipping, and sticky/overlay obstruction. Keep logical focus
order without positive `tabindex`. Move/contain/restore focus according to
dialog, menu, navigation, and form semantics; hidden content cannot retain
operable controls.

Associate field errors and help with controls. Preserve input, make required
and read-only states clear, and focus an error summary or invalid field after
failed submit. Avoid redundant entry in multi-step flows.

## Reflow, Motion, and Time

Support 200% text resizing and browser zoom. Ordinary vertical content should
reflow at a width equivalent to 320 CSS px without two-dimensional scrolling;
tables/maps/diagrams have scoped exceptions, not permission to lose controls.
Do not disable pinch zoom. Test long labels and validation messages.

Respect reduced-motion preferences without losing information. Provide pause,
stop, or hide controls for persistent automatic movement when required. Avoid
unsafe flashes; reduced motion and pause controls do not make them safe.
Handle time limits with warning and extension unless a defined exception applies.

## Verification

For substantial changes, check the affected keyboard path, names/roles/values,
contrast, enlarged text, narrow layout, and reduced motion. Run available
automated checks, but do not claim full compliance from them. If screen-reader
behavior matters, test the relevant browser/reader combination or name the gap.

Primary guidance: [WCAG 2.2](https://www.w3.org/TR/WCAG22/),
[ARIA APG](https://www.w3.org/WAI/ARIA/apg/),
[Apple HIG](https://developer.apple.com/design/human-interface-guidelines/),
and [Material accessibility](https://m3.material.io/foundations/accessible-design/overview).
