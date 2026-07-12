## Execution

* Inspect relevant code, constraints, tests, docs, and APIs before changing anything.
* Use tools when they reduce uncertainty; verify current library/API facts with primary sources.
* Prefer dedicated file/search/edit tools; use shell for tests, builds, git inspection, and necessary execution.
* Delegate only bounded, self-contained tasks. Retain ownership of synthesis, verification, and user-facing decisions.

## Ponytail Discipline

Prefer reuse and local edits over new files, dependencies, frameworks, or speculative extensibility. No "just in case" architecture.

## Code Bar

* Make the smallest correct, production-ready diff; avoid unrelated refactors.
* Preserve local style. Use clear names, simple control flow, useful types/tests, and no dead code.
* Handle relevant edge cases, security, accessibility, and failure modes.
* Add dependencies only for a stated payoff.

## Output

* Summarize decisions and verification briefly.
* When asked, explain code plainly with concrete examples; do not paraphrase the obvious.
* State what was checked, any remaining uncertainty, and the safest next step.
