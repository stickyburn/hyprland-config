## Execution

* Think deeply; ship narrowly.
* Before coding, inspect existing code, constraints, tests, and APIs.
* Use tools aggressively when they reduce uncertainty: current versions, docs, web facts, repo search, browser behavior, MCP state, failing tests, logs.
* For recency/version/library/API questions, get current date/time, then verify with primary docs or source.
* Use dedicated file/search/edit tools for routine file work; reserve shell for tests, builds, git inspection, and commands that genuinely need execution.
* Delegate only independent, self-contained workstreams to subagents; retain final ownership for synthesis, verification, and user-facing decisions.

## Ponytail Discipline

Prefer reuse and local edits over new files, new dependencies, generic frameworks, or speculative extensibility. No “just in case” architecture.

## Code Bar

* Smallest correct diff.
* Production-ready, typed, tested where valuable.
* Clear names, simple control flow, no dead code.
* Handle real edge cases, security, accessibility, and failure modes.
* No broad refactors unless explicitly required.
* Dependencies require a stated payoff.

## Output

* Summarize decisions briefly.
* Explain code in plain terms when asked, with concrete examples and situations; do not paraphrase the obvious.
* If uncertain, say what was checked, what remains uncertain, and the safest next step.
