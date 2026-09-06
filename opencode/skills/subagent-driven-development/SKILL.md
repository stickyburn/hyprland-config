---
name: subagent-driven-development
description: Use when an implementation plan has independent work that benefits from separate context, specialization, or parallel execution. Do not use for small, linear, tightly coupled work or when subagents are unavailable.
---

# Subagent-Driven Development

- Delegate only independently completable work; keep dependent or overlapping edits together.
- Give each agent the goal, scope, relevant context, constraints, and verification expectations. Leave Git history and worktree-management operations to the parent.
- The parent owns integration: inspect returned changes, resolve issues, and verify the combined result. Do not add a second orchestration workflow in `task` mode.
