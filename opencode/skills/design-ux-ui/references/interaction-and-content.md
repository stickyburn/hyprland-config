# Interaction and Content Reference

Use this reference when designing flows, forms, navigation, controls, data
views, feedback states, destructive actions, or interface copy.

## Model the Task

For each important flow, identify:

```text
entry -> orientation -> action -> feedback -> recovery or next step
```

Keep the user's object and vocabulary stable across the flow. If a button says
"Publish," success feedback should say "Published," not "Submission
complete." Preserve context after errors and interruptions.

## State Matrix

Design only relevant states, but do not stop at the happy path.

| Area | States to consider |
|---|---|
| Control | default, hover, focus, pressed, disabled, loading |
| Selection | unselected, selected, mixed, unavailable |
| Data | loading, empty, partial, stale, error, success |
| Form | untouched, editing, invalid, submitting, saved, unsaved |
| Permission | allowed, read-only, denied, requestable |
| Network | offline, retrying, conflict, restored |

Communicate state with text or semantics in addition to visual treatment.
Avoid disabling a control when an explanation or validation message would
teach the user how to proceed.

## Actions and Feedback

- Give each control a specific verb-object label when space permits: "Create
  project," "Save API key," "Archive invoice."
- Distinguish navigation from actions in semantics and styling.
- Show immediate acknowledgment for input, then persistent success only when
  it helps.
- Keep controls available until an operation actually starts. During async
  work, prevent duplicate submission without erasing context.
- Prefer undo for fast, reversible actions. Use confirmation when impact is
  severe, difficult to reverse, delayed, or affects other people.
- Put error guidance next to the failed action and explain the next valid step.

## Forms

- Ask only for information needed now. Group by user goal, not database model.
- Use persistent labels and short contextual help.
- Choose controls that match the data: radio for a short exclusive set,
  checkbox for independent choices, select for longer familiar sets, search
  or combobox for large sets.
- Preserve input through validation and server failures.
- Validate at a useful time. On submit, focus a summary or the first invalid
  field; after an error, validate as the user corrects it.
- Make optional fields explicit when most fields are required, or required
  fields explicit when most are optional. Stay consistent.
- Warn before losing meaningful unsaved work.

## Navigation and Orientation

- Make current location, parent context, and available next steps clear.
- Use links for navigation so browser behaviors such as open-in-new-tab work.
- Keep labels and placement stable across routes.
- Reflect shareable application state such as search, filters, pagination, or
  selected tabs in the URL when that benefits return, sharing, and history.
- Preserve scroll, selection, and back-button expectations.
- On small screens, change navigation form only when the information
  architecture remains understandable.

## Data and Collections

- Design around the question users ask, not around the fields the backend
  exposes.
- Put common actions where selection and context are visible.
- Show sort direction, active filters, result count, and a clear reset path.
- For large lists, support scanning, keyboard movement where appropriate, and
  performance strategies such as pagination, windowing, or `content-visibility`.
- Preserve exact values through tables or details even when a chart provides
  the overview.
- Empty search results should retain the query and offer a correction, not
  erase the user's work.

## Interface Writing

- Write from the user's side of the screen with plain, specific language.
- Use active voice and sentence case unless the product system says otherwise.
- Labels label; help explains; placeholders demonstrate. Do not make one string
  perform all three jobs.
- Error messages state what happened when known and what the user can do next.
- Avoid fake urgency, guilt, ambiguous opt-outs, disguised ads, or other dark
  patterns.
- Test labels with real limits, localization, and assistive names.

## Quality Check

- The primary path is obvious and has a complete feedback loop.
- Non-happy states preserve context and support recovery.
- Destructive actions have proportionate safeguards.
- Forms request only timely information and retain entered values.
- Navigation works with browser history and direct links where relevant.
- Labels describe user-visible outcomes consistently.
- Touch, pointer, keyboard, and assistive interactions are all supported.
