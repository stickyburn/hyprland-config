---
name: subagent-driven-development
description: Use only when a multi-part implementation plan contains independent work that would materially benefit from separate context windows, specialized focus, or parallel execution. Delegation is optional per task, not a required review pipeline.
---

# Context-Aware Delegated Development

## Overview

Execute an implementation plan while preserving context and integration
ownership. Do cohesive work directly. Delegate a bounded work unit when a
separate context provides a concrete benefit.

In `work` mode, the primary fresh-context boundaries already exist:

1. `work` plans and coordinates.
2. `coder` implements and verifies.
3. `reviewer` independently reviews the completed diff.

This skill may help `coder` manage an unusually broad implementation, but it
does not replace or duplicate the final `reviewer` step.

## Decision Gate

Delegate a work unit when at least one of these is true:

- It is independent of other in-flight work and has clear file ownership.
- Its context is large enough that isolation will preserve important details.
- It needs specialized research or investigation with a bounded output.
- Parallel execution will materially reduce completion time without increasing
  integration risk.

Work directly when the task is routine, linear, small, tightly coupled to the
current work, or touches the same files as another in-flight task. The same
decision rule applies at every agent level.

## Workflow

### 1. Parse The Plan Once

Extract the tasks, acceptance criteria, dependencies, constraints, affected
files, and verification commands. Track meaningful tasks with the todo tool.

### 2. Identify Safe Boundaries

For each task, determine whether it can be completed and verified without
depending on unfinished work or overlapping file edits. Keep dependent work in
the current context.

### 3. Provide A Complete Handoff

For delegated work, include:

- The whole-task goal and why it matters
- Exact scope and file allowlist
- Acceptance criteria
- Relevant code, APIs, constraints, and out-of-scope items
- Exact verification commands
- Required report format

Do not ask delegated agents to commit, push, branch, reset, checkout, or stash.
Those restrictions from the `coder` workflow continue to apply.

### 4. Integrate And Verify

The delegating agent owns the combined result. Inspect every returned change,
resolve integration issues, run focused checks, and then run the strongest
practical integration checks for the full implementation.

Each delegated implementer should check its own acceptance criteria and code
quality. Add a targeted independent review only when the risk or context size
justifies another fresh context; do not create a fixed per-task reviewer chain.
In `work` mode, leave the final integrated review to `reviewer`.

### 5. Report Clearly

Return task status, files changed, commands and results, acceptance-criteria
pass/fail, deviations, and unresolved risks to the parent agent.

## Red Flags

- Spawning a fresh implementer for every task by default
- Adding spec and quality reviewers to every delegated task by default
- Delegating tasks that edit the same files concurrently
- Delegating because the tool exists rather than because context or parallelism
  will improve the result
- Losing ownership of integration or trusting a returned summary without
  inspecting the changes
- Committing from a delegated implementation context

## Remember

Role-based delegation in `work` mode is intentional. Additional delegation is
an available context-management tool, not a required ceremony.
