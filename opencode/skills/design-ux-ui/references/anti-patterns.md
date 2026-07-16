# Generic Output Diagnostic

Use this after a draft exists or when a user says the design feels generic.
These are diagnostic questions, not banned styles. A gradient, centered hero,
card grid, serif, or dark theme can be excellent when the content and brief
justify it.

## Default Clusters

Frontier models tend to converge on a small set of fashionable combinations:

- blue, indigo, or violet gradient plus glass panels and glow
- warm cream plus high-contrast serif and terracotta
- near-black plus acid green or orange and oversized type
- broadsheet rules, tiny uppercase labels, and editorial columns
- centered hero followed by three equal icon cards and large metrics

Treat the combination as suspicious when it could be moved unchanged to an
unrelated product. Do not avoid a cluster that the brand or brief explicitly
calls for; make it specific through content, composition, and craft.

## Structural Tells

### Wrong surface

The composition supports a different task than the user has. Examples include
marketing hierarchy on an operations console, a dashboard made of unrelated
KPI cards, or a settings screen without save and validation states.

Repair: restate the primary task, content priority, and state changes. Redraw
the major regions before touching visual tokens.

### Equal-weight repetition

Every feature, metric, or section receives the same card, icon, and amount of
space. The layout avoids making a decision.

Repair: identify actual relationships and priority. Group, sequence,
subordinate, compare, or remove content. Keep equal treatment only for truly
peer items.

### Container reflex

Cards appear inside cards, and borders, rounded rectangles, or accent rails do
work that alignment and spacing should do.

Repair: flatten the hierarchy. Retain a container only when it communicates
grouping, interaction, selection, or elevation.

### Centering reflex

Center alignment is applied to operational content, long text, forms, and
lists without a task reason.

Repair: choose alignment from reading direction, comparison needs, and action
flow. Center only where symmetry and short content serve the concept.

## Visual Tells

### Unexplained fashionable tokens

The accent, font, radius, gradient, blur, or shadow is recognizable as a trend
but has no connection to the product.

Repair: connect each conspicuous token to the subject or remove it. One
signature decision is stronger than several borrowed effects.

### Decorative semantics

Color rails imply categories that do not exist; numbered sections are not a
sequence; icons repeat headings; huge numbers are not decision-relevant.

Repair: make each visual device encode real information. If it cannot, remove
it.

### Generic type hierarchy

Typography is selected from habit, or every section uses the same display
treatment regardless of content.

Repair: choose type roles from the subject and reading task. A familiar font
can remain if spacing, measure, weight, and role make the system specific.

### Effect without depth or state

Blur, glow, animation, and 3D treatment appear without a spatial or
interaction model.

Repair: define what is elevated, changing, or interactive. Remove effects
that communicate nothing.

## Content Tells

- invented testimonials, users, awards, or performance claims
- round impressive metrics included to fill space
- vague headings such as "Scale," "Transform," or "Insights"
- labels written from the implementation rather than the user's perspective
- every empty region filled with illustration or decoration

Use representative interface data to test layout, but do not present it as a
factual claim. Mark strategic copy as draft. Prefer a truthful gap over fake
social proof.

## Diagnostic Pass

Run this separately from implementation:

1. Hide color, effects, and imagery. Does hierarchy still communicate the
   task?
2. Replace the product name with an unrelated one. Which decisions still fit
   unchanged?
3. Identify the first moment the design becomes specific to this subject.
4. Name any visual device that does not encode content, state, or identity.
5. Check whether the signature has enough quiet space around it.
6. Inspect narrow and wide screenshots, not source code alone.

Classify repairs before editing:

| Symptom | Repair level |
|---|---|
| wrong task, equal hierarchy, repetitive sections | recomposition |
| unclear path or missing state | interaction/content redesign |
| generic type, palette, shape, imagery | visual system revision |
| extra icons, rails, glow, blur, filler | subtraction |

Fix the highest-level cause first. Recoloring cannot repair the wrong
composition, and animation cannot repair weak hierarchy.

## Critique Language

Avoid "cleaner," "modern," "premium," or "it feels off" without evidence.
Use concrete observations:

```text
The three account states use identical cards, so the suspended state does not
interrupt scanning. Group active accounts in the table and expose suspended
accounts in a persistent warning row. This improves triage but adds one visual
exception to the table.
```
