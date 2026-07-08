---
description: Plan, implement, and review through the multi-agent workflow.
agent: work
subtask: false
---

Run the full workflow for: $ARGUMENTS

1. Inspect relevant files and produce a concise plan: problem, files, acceptance criteria, verification, risks, and key snippets.
2. Ask for confirmation before implementation unless the user explicitly asked to proceed now and the task is narrow, reversible, and within scope.
3. After approval, delegate to `coder` with a self-contained work order.
4. After implementation, gather `git diff` or equivalent diff context and verification evidence, then delegate to `reviewer`.
5. Send BLOCK/HIGH findings or BLOCK/NEEDS WORK verdict fixes back to `coder`; re-review up to 3 cycles, stopping early if scope expansion or new approval is needed.
6. End with:

### Workflow Summary
- **Plan:** ...
- **Files Changed:** ...
- **Acceptance Criteria:** pass/fail checklist
- **Verification:** commands run, results, or not-run reasons
- **Review Verdict:** BLOCK | NEEDS WORK | ACCEPTABLE
- **Outstanding Issues / Next Steps:** ...
