# Interaction and Content

Use for flows, forms, navigation, controls, data views, and interface copy.

## Flow and States

For important flows, cover entry, orientation, action, feedback, and recovery
or the next step. Keep objects and vocabulary stable: “Publish” leads to
“Published,” not “Submission complete.” Preserve context after interruption.

| Area | Consider only relevant states |
|---|---|
| Control | default, hover, focus, pressed, disabled, loading |
| Selection | unselected, selected, mixed, unavailable |
| Data | loading, empty, partial, stale, error, success |
| Form | editing, invalid, submitting, saved, unsaved |
| Permission | allowed, read-only, denied, requestable |
| Network | offline, retrying, conflict, restored |

Communicate state through semantics or text as well as visual treatment.
Do not disable a control when validation or an explanation better teaches
the next step. Buttons remain spatially stable on hover by default.

## Actions and Forms

- Use specific outcome labels such as “Create project.” Distinguish links
  from actions. Icon-only tools need an accessible name and discoverable meaning.
- Acknowledge input immediately. Prevent duplicate async submission while
  retaining the object and context the user acted on.
- Prefer undo for reversible actions; confirm severe or hard-to-reverse ones.
- Ask only for timely information; group fields by goal. Use persistent labels,
  contextual help, and controls suited to the choices, not database types.
- Preserve input through validation and server failures. Put guidance next to
  the failed field/action; a toast alone is not adequate form recovery.
- Validate when useful. After failed submit, focus the summary or first invalid
  field; allow corrections without repeatedly interrupting input.
- Make required/optional status consistent and warn before losing meaningful
  unsaved work. Keep paste, autofill, and password managers working.

## Navigation and Collections

Keep location, parent context, labels, and next actions clear. Use links for
navigation and preserve browser history, deep links, scroll, and selection
where expected. Put useful shareable filter/search state in the URL.

Design collections around the user's question. Expose sort order, filters,
result count, and reset; keep actions near selection. Preserve exact values
even when charts provide an overview. Empty results retain the query and offer
recovery. Use pagination or virtualization only when data volume warrants it.
Small-screen navigation should preserve the same understandable architecture.

## Writing

Use plain, specific, user-facing language and stable terminology. Labels name,
help explains, placeholders exemplify. State what failed when known and the
next valid action. Avoid fake urgency, guilt, disguised ads, and ambiguous
opt-outs. Test copy with real limits, long values, localization, and accessible
names. Supporting instructions are useful when needed, not filler to narrate
an otherwise obvious interface.
