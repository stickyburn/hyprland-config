---
name: requesting-code-review
description: Reviews staged changes, commits, or pull-request diffs for correctness, security, regressions, scope, and test gaps. Use for review and merge-safety requests. Do not use to diagnose an active failure or implement new work.
---

# Requesting Code Review

Review is read-only unless the user explicitly requests fixes.

## Workflow

1. Establish the original intent, acceptance criteria, verification evidence, and exact review range. Include relevant untracked files and distinguish baseline issues from introduced regressions.
2. Inspect the full diff and enough surrounding code, callers, tests, contracts, and history to understand behavior. Check correctness, edge cases, errors, security boundaries, concurrency, resource lifetime, performance, compatibility, migrations, rollback, tests, and unrelated scope where applicable.
3. Run known side-effect-free checks when permitted. A failed check is evidence and does not replace reviewing the diff.
4. Verify each candidate finding against a changed line, reachable trigger, failure outcome, and surrounding safeguards. Do not report unsupported hypotheticals, pre-existing defects, or taste as correctness issues.
5. Report findings first by severity. Each finding must include `path:line`, trigger, impact, evidence, and the smallest remediation.

Severity:

- `BLOCK`: outage, data loss, exploitable flaw, unsafe irreversible change, or unreviewable diff
- `HIGH`: likely user-visible failure, corruption, security weakness, or unmet requirement
- `MEDIUM`: plausible edge-case failure or concrete maintenance cost
- `LOW`: minor non-blocking improvement; omit pure style

Without evidence, severity cannot exceed `MEDIUM`. End with the verdict, checks and results, and residual testing gaps. If there are no findings, say so.

Load `references/review-checklist.md` only for broad, high-risk, or multi-domain changes.
