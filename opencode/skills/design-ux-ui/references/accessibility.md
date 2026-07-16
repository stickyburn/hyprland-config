# Accessibility Reference

Use this reference when accessibility, forms, focus, contrast, responsive
reflow, or inclusive interaction is material to the task. Target WCAG 2.2 AA
unless the product requires another standard. Automated checks help but do not
replace keyboard, screen-reader, zoom, and visual inspection.

## Contents

- Contrast and color
- Semantics and names
- Keyboard and focus
- Targets and input
- Forms and feedback
- Reflow, zoom, and content
- Motion and time
- Verification

## Contrast and Color

| Content | WCAG AA minimum |
|---|---:|
| Normal text | 4.5:1 |
| Large text | 3:1 |
| Essential UI boundaries and graphical objects | 3:1 against adjacent color |

WCAG large text means at least 18pt (24 CSS px) at normal weight, or 14pt
(about 18.7 CSS px) when bold. Test the rendered foreground/background pair,
including hover, disabled, selected, dark-theme, and focus states. Do not rely
on a color token's name as proof of contrast.

Color cannot be the only cue for status, errors, categories, or chart series.
Add text, shape, pattern, iconography, or position while keeping the meaning
available to assistive technology.

## Semantics and Names

- Prefer native elements: `button` for actions, links for navigation, and
  native form controls when they meet the need.
- Give controls an accessible name through visible text or a proper label.
  Add `aria-label` only when no visible label can provide the name.
- Give informative images useful alternative text and decorative images empty
  alt text. Hide decorative icons from the accessibility tree.
- Keep headings hierarchical and landmarks meaningful. Include a skip link on
  pages with repeated navigation.
- Use ARIA to fill semantic gaps, not to recreate native controls casually.
- Announce important asynchronous status with an appropriate live region, but
  avoid chatty announcements.

## Keyboard and Focus

- Functionality must be available by keyboard unless the underlying operation
  depends on the path of movement, such as freehand drawing. Native controls
  already provide expected keyboard behavior; custom widgets must follow their
  ARIA Authoring Practices interaction pattern. For path-dependent tasks,
  provide an equivalent outcome or alternative input where practical without
  misrepresenting it as an unconditional WCAG AA requirement.
- Use `:focus-visible` for a strong visible indicator. Never remove outlines
  without an equivalent replacement.
- Ensure sticky headers, dialogs, and overlays do not fully obscure focused
  elements. This is part of WCAG 2.2 Focus Not Obscured (Minimum).
- Keep focus order aligned with reading and visual order. Avoid positive
  `tabindex` values.
- Move and restore focus deliberately for dialogs, menus, route changes, and
  validation summaries.

A 2px contrasting outline with separation from the component is a robust
starting point, not a universal prescription. Test it against every adjacent
surface and when the component is near a clipping container.

## Targets and Input

WCAG 2.2 AA Target Size (Minimum) requires a target of at least 24 by 24 CSS
pixels or sufficient spacing, with defined exceptions. WCAG AAA uses 44 by 44
CSS pixels. Mobile platform guidance commonly recommends 44pt on Apple and
48dp on Android.

Use 44 by 44 CSS pixels as a strong touch baseline for primary controls, while
handling dense-tool and inline-link exceptions intentionally. Do not make
hover the only way to discover or operate a control. Support pointer, touch,
keyboard, zoom, and text selection without disabling expected browser
behavior.

## Forms and Feedback

- Use persistent, programmatically associated labels. Placeholder text is an
  example or hint, not a label.
- Use meaningful `name`, `type`, `inputmode`, and `autocomplete` values.
- Keep paste and password managers working.
- Place help and errors near the field and associate them with it. For long
  forms, provide an error summary and move focus there after failed submit.
- Validate when feedback becomes useful. Avoid scolding on every blur before
  the user had a reasonable chance to finish.
- Preserve entered values after an error and avoid asking for known data again
  in multi-step flows.
- Make required, optional, disabled, and read-only states unambiguous without
  color alone.

## Reflow, Zoom, and Content

- Support 200% text resize and browser zoom without losing content or
  operation.
- Reflow ordinary vertical content at a width equivalent to 320 CSS pixels
  without two-dimensional scrolling. Complex tables, maps, and diagrams have
  scoped exceptions but still need a usable strategy.
- Do not disable pinch zoom with viewport metadata.
- Test long labels, large text, translated copy, empty values, and validation
  messages. DOM order should remain logical when the layout changes.

## Motion and Time

- Respect `prefers-reduced-motion` and provide an equivalent non-motion cue.
- Avoid large zooming, parallax, rapid flashing, and movement that is not
  necessary to understand state.
- Let users pause or stop non-essential moving or auto-updating content when
  required.
- Do not impose short time limits without warning, extension, or a genuine
  real-world need.

## Verification

For substantial UI work, verify:

1. Navigate the primary path using only the keyboard.
2. Inspect accessible names, roles, values, and live updates.
3. Check contrast for each semantic state, not just default text.
4. Test zoom or text resize and a narrow viewport.
5. Enable reduced motion.
6. Run available automated accessibility checks and review their false
   positives and blind spots.
7. If screen-reader behavior is central, test with the target browser and
   screen-reader combination rather than assuming from markup.

Useful primary sources: WCAG 2.2, WAI-ARIA Authoring Practices, Apple Human
Interface Guidelines, and Material Design accessibility guidance.
