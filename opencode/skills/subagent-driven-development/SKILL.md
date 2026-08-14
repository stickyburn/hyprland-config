---
name: subagent-driven-development
description: Use when an implementation plan has independent work that benefits from separate context, specialization, or parallel execution. Do not use for small, linear, tightly coupled work or when subagents are unavailable.
---

# Subagent-Driven Development

Delegate only bounded work with independent files or outputs. The parent owns integration.

## Workflow

1. Extract tasks, dependencies, acceptance criteria, constraints, affected files, and verification commands from the plan.
2. Keep dependent or overlapping edits in one context. Delegate only work that can be completed and verified independently.
3. Give each subagent the whole-task goal, exact scope and file allowlist, relevant context, acceptance criteria, constraints, verification commands, and required report. Do not ask it to perform Git history or worktree operations.
4. Inspect every returned change, resolve integration issues, and run focused and full integration checks.
5. Report task status, files, command results, acceptance-criteria status, deviations, and unresolved risks.

In `task` mode, `planner`, `coder`, and `reviewer` already provide separate contexts. Do not add another fixed reviewer chain or delegate overlapping edits concurrently.
