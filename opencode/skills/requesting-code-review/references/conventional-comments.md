# Conventional Comments Reference

The full label set, decorations, and examples. Load this when writing review
comments to ensure they are properly labeled and actionable.

## Format

```
<label> [decorations]: <subject>
  [discussion]
```

Only label and subject are mandatory. Decorations are optional but
recommended for clarity.

## Labels

### issue:
Highlights a specific problem — user-facing or behind the scenes. Strongly
recommended to pair with a `suggestion`. If you're not sure a problem exists,
use `question` instead.

Blocking by default. Use `(non-blocking)` decoration if the issue should be
tracked but not block merge.

```
issue (security): This query concatenates user input directly into SQL.
  Use parameterized queries to prevent injection. See line 47.

issue (non-blocking): The error message includes the full stack trace,
  which exposes internal paths. Consider sanitizing before sending to the
  client. Can be handled in a follow-up.
```

### suggestion:
Proposes an improvement. Be explicit on what the improvement is and why it
would be better. Can be blocking or non-blocking.

```
suggestion (non-blocking): Consider extracting this validation into a
  shared helper — the same pattern appears in three controllers and a
  shared helper would prevent drift.

suggestion (blocking): This function has 7 parameters, which makes call
  sites hard to read and suggests the function is doing too much. Consider
  splitting into two functions or passing a config object.
```

### question:
Appropriate when you have a potential concern but aren't sure if it's
relevant. Asking for clarification can lead to quick resolution. Never
blocking.

```
question: What happens if the API returns an empty array here? The loop
  would be skipped — is that the intended behavior, or should we show a
  "no results" state?

question: Is this function called from a concurrent context? If so, the
  shared mutable state on line 30 could be a race condition.
```

### nitpick:
A trivial, preference-based request. Never blocking. Group multiple
nitpicks into a single comment to avoid noise.

```
nitpick: A few naming preferences (non-blocking):
  - `d` could be more descriptive — maybe `duration` or `delay`?
  - `procData` could be `processedData` for clarity
  - Line 42: `temp` is ambiguous — what temperature?
```

### praise:
Highlights something positive. Be specific — never false praise. At least
one per review. Non-blocking.

```
praise: Excellent test coverage on the error path — the edge cases for
  empty and oversized inputs are well handled. This is a model for how
  validation functions should be tested.

praise: This matches the pattern used in the other controllers exactly.
  Consistency across the module makes maintenance much easier.
```

### thought:
An idea that popped up while reviewing. Non-blocking by nature, but
valuable for mentoring and future initiatives. Never blocking.

```
thought: This validation logic is getting complex. We might want to
  consider a schema validation library like Zod for this kind of nested
  input — would simplify the code significantly. Not for this PR, but
  worth considering for the module overall.
```

### todo:
A small, trivial, but necessary change that must be done before official
acceptance. Usually references a common process.

```
todo: This new endpoint needs to be added to the OpenAPI spec. The spec
  file is at docs/api.yaml. See the contribution guide for the format.
```

### note:
Highlights something the reader should take note of. Always non-blocking.
Useful for context that isn't a problem but is worth knowing.

```
note: This function is now called from two places — the original caller
  and the new cron job. The cron job passes a different timeout value,
  which is fine, but worth knowing if you debug timeout issues later.
```

## Decorations

Decorations are comma-separated, in parentheses, after the label:

| Decoration | Meaning |
|---|---|
| `(blocking)` | should prevent acceptance until resolved |
| `(non-blocking)` | should not prevent acceptance |
| `(if-minor)` | author should resolve only if changes end up being minor/trivial |
| `(security)` | classifies the comment as security-related |
| `(test)` | classifies the comment as test-related |
| `(performance)` | classifies the comment as performance-related |
| `(ux)` | classifies the comment as UX-related |

Example:
```
issue (ux,non-blocking): These buttons should be red for danger, but
  let's handle this in a follow-up to avoid scope creep.
```

## Decision Rules

### When to block vs not block

| Comment type | Default | When to override |
|---|---|---|
| `issue:` | blocking | mark `(non-blocking)` if it can be a follow-up |
| `suggestion:` | non-blocking | mark `(blocking)` if the current code is harmful |
| `question:` | non-blocking | never blocking — if it reveals a real issue, convert to `issue:` |
| `nitpick:` | never blocking | — |
| `todo:` | blocking | mark `(non-blocking)` if it's a process note |
| `praise:` | never blocking | — |
| `thought:` | never blocking | — |
| `note:` | never blocking | — |

### Approve / Request Changes

- **Approve** if you have nothing the author must act on. Style nits don't
  block.
- **Approve with comments** if the change is correct but you have
  suggestions the author can choose to act on.
- **Request changes** only when there's at least one issue that must be
  resolved before merge. Be explicit about which issue is the blocker.

Anti-pattern: "Request changes" to express taste rather than identify a
defect. If the issue is taste, leave a comment, mark it as a nit, and
approve.

## Anti-Patterns

### Empty formalism
```
issue: Badly named variable
```
Useless — no context, no explanation, no suggestion. Always explain the why.

### Generic praise
```
praise: Nice
```
Fulfills the rule but undermines the spirit. Be specific.

### Non-blocking abuse
If 90% of comments are `(non-blocking)`, the review adds no value. Dare
to block when justified — correctness, security, and data integrity always
block.

### Severity inflation
```
issue (blocking): Variable name `d` is too short
```
This is a nitpick, not an issue. Don't inflate severity to force the author
to address preferences.