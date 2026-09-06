---
name: requesting-code-review
description: Reviews staged changes, commits, or pull-request diffs for correctness, security, regressions, scope, and test gaps. Use for review and merge-safety requests. Do not use to diagnose an active failure or implement new work.
---

# Requesting Code Review

- Establish the review range and original intent; distinguish introduced defects from existing issues.
- Inspect the diff and relevant surrounding code. Report actionable defects supported by a reachable failure and evidence, not speculation or style preferences.
- Keep review read-only unless fixes are requested; run only checks known not to mutate files or external state.
- Put findings first, ordered by severity, with `path:line`, impact, evidence, and a suggested fix. Say when there are none, and note checks and remaining testing gaps.

Load `references/review-checklist.md` only for broad, high-risk, or multi-domain changes.
