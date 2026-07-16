---
name: requesting-code-review
description: >-
  Reviews code changes before commit or merge — catches bugs, security issues,
  scope creep, and test gaps that the author missed. Use whenever the user
  asks for a code review, pre-commit check, PR review, diff review, merge
  gate, or quality check. Also use when the user says "review this",
  "check my changes", "is this safe to merge", "what did I miss", "review my
  diff", or wants feedback on code quality before pushing. Do not use for
  debugging (use systematic-debugging), UI design (use design-ux-ui),
  animation (use motion), or product strategy (use product-strategy).
metadata:
  version: "0.1.0"
---

# Requesting Code Review

Review the diff, not the author. Catch what the author missed — bugs, security
issues, scope creep, missing tests — without nitpicking. Produce specific,
actionable, severity-labeled feedback. Never say "looks good" without reading
the diff.

## When To Use

- Pre-commit: review staged changes before committing
- Pre-push: review local commits before pushing
- Pre-merge / PR review: review a diff before merging
- Self-review: the author reviews their own diff before requesting peer review
- Post-fix: verify a bug fix is safe to merge
- Post-refactor: verify a refactor didn't change behavior
- Security-sensitive changes: auth, crypto, data access, external API calls
- Any time the user wants a quality gate before code lands

## When NOT To Use

- Debugging an active bug (use systematic-debugging — understand before fixing)
- UI layout or visual design (use design-ux-ui)
- Animation or motion (use motion)
- Product strategy or market decisions (use product-strategy)
- Writing new code from scratch (write first, then review)

## Core Principles

Each principle has a one-liner and a self-check.

### 1. Review The Diff, Not The Author

**Comment on the code, not the person who wrote it.**

| Instead of... | Say... |
|---|---|
| "You did this wrong" | "This approach may not be optimal because..." |
| "I can't believe you wrote this" | "I noticed an issue with this implementation" |
| "You should know better" | "This pattern can cause X because Y" |

Rules:
- Say "this code" not "your code." The author is not the artifact.
- Explain the why: "This won't work because X" not just "this won't work."
- Ask questions instead of making demands: "What happens if items is empty?"
  instead of "This will fail on empty arrays."
- Suggest, don't command: "Consider extracting this into a helper" not
  "Extract this into a helper."
- Offer affirmations: "Good test coverage on the error path" or "This matches
  the pattern used in other modules." Praise improves review culture and
  is not optional.

**The test:** Would the author feel motivated to improve the code after
reading your comment, or defensive? If defensive, rephrase.

### 2. Severity Before Style

**Label every comment so the author knows what to act on.**

Use the Conventional Comments standard:

| Label | Meaning | Blocking? |
|---|---|---|
| `issue:` | a specific problem — user-facing or behind the scenes | usually blocking |
| `suggestion:` | proposes an improvement — be explicit on what and why | non-blocking |
| `question:` | a potential concern, not sure if relevant | non-blocking |
| `nitpick:` | trivial, preference-based (naming, formatting) | never blocking |
| `praise:` | highlights something positive — be specific, never false | non-blocking |
| `thought:` | an idea from reviewing — non-blocking, valuable for mentoring | non-blocking |
| `todo:` | small but necessary change before acceptance | usually blocking |
| `note:` | highlights something the reader should be aware of | non-blocking |

Optional decorations: `(blocking)`, `(non-blocking)`, `(if-minor)`,
`(security)`, `(test)`, `(performance)`, `(ux)`.

Example:
```
issue (security): This query concatenates user input directly into SQL.
  Use parameterized queries to prevent injection. See OWASP guidance.
suggestion (non-blocking): Consider extracting this validation into a
  shared helper — the same pattern appears in three controllers.
nitpick: Could use a more descriptive variable name than `d`.
praise: Excellent test coverage on the error path — the edge cases
  for empty and oversized inputs are well handled.
```

**The test:** Can the author scan your review and know within 10 seconds
which comments must be addressed before merge? If not, you didn't label
severity.

### 3. Read In Order, Not All At Once

**Review the diff in a structured order. Don't jump to line-by-line
immediately.**

1. **Read the PR description / commit message first** (2 min) — understand
   the stated purpose. If you can't summarize the intent in one sentence,
   ask for clarification.
2. **Scan the file tree** (1 min) — which files changed? Does the scope match
   the description? 15 files modified but only 3 mentioned means scope creep.
3. **First-pass triage** (5 min) — determine blast radius (number of files,
   sensitivity of touched modules), test surface (are there new tests?),
   and review type (mechanical refactor vs. behavior change vs. security-
   sensitive).
4. **Deep review one axis at a time** — read the diff multiple times, each
   looking for a different category:
   - Pass 1: correctness and logic bugs
   - Pass 2: security (injection, auth, secrets, input validation)
   - Pass 3: tests (coverage, assertion quality, edge cases)
   - Pass 4: performance and resource management
   - Pass 5: readability, naming, and maintainability
5. **Review with context** — read 20-30 lines above and below changes. Check
   related files. A diff showed `maxRetries = 3 → maxRetries = 10`; in
   isolation it looked fine, but the calling code had a 5-second timeout
   meaning users would wait 50 seconds for an error.
6. **Look for what's NOT in the diff** — missing tests, missing error
   handling, missing documentation for API changes. The worst bugs are
   often in what's missing.

**The test:** Did you read the diff at least twice, looking for different
things each time? If you read it once and approved, you didn't review.

### 4. Surgical Changes Only

**Flag scope creep. Every changed line should trace to the stated goal.**

Karpathy's surgical changes principle applied to review: the diff should
contain only the minimum changes required to meet the goal. Refactoring,
style improvements, and "while I'm here" changes belong in separate PRs.

Flag these as scope creep:
- "I'll fix this while I'm here..." → separate PR
- "This could be more flexible if..." → YAGNI — implement what was asked
- Interfaces with exactly one implementation in the same change set
- Configurable parameters with only one value passed
- Abstract base classes whose only subclass is in the same file
- Refactors mixed with behavior changes in the same PR (a reviewer reading
  "rename plus refactor plus new feature" has lost the ability to spot the
  bug)

**The test:** Can you trace every changed line to the stated goal? If a
line doesn't trace, it's scope creep. Flag it.

### 5. Review Tests As Rigorously As Production Code

**Coverage is a vanity metric. Assertion quality is what matters.**

A test suite at 95% line coverage that doesn't verify behavior is worse than
a smaller suite that does — it produces false confidence. Coverage shows
what ran, not what was verified.

Check:
- **Does the test assert against public, observable behavior?** (return
  value, database state, message published) — not the internal call graph.
  A test that asserts a mock was called with expected arguments but doesn't
  check the system's actual output is test theater.
- **Does the test cover the error path, not just the happy path?** Empty
  inputs, nulls, large data, concurrent access, failure states.
- **Is the test deterministic?** No flaky timing, no order-dependence, no
  shared mutable state between tests.
- **Does the test test the right thing?** A test that passes when the
  implementation is replaced with a stub that does nothing is worthless.
- **AI-generated tests deserve extra scrutiny.** AI reads the implementation
  and writes assertions that confirm the implementation's current behavior.
  If the function returns 42, the AI writes `expect(result).toBe(42)` — which
  passes because the function is internally consistent, not because 42 is
  correct.

**The test:** If you injected a bug into the function under test, would any
test fail? If not, the tests aren't checking real behavior.

### 6. Security Is Always A Pass

**Check security on every review, not just "security-sensitive" PRs.**

The reviewer who skips security because "this is just a UI change" misses
the XSS in the user input rendering. Always check:

| Category | What to look for |
|---|---|
| **Injection** | SQL concatenation, HTML injection, command injection, template injection |
| **Auth/authz** | missing permission checks, privilege escalation, session handling |
| **Secrets** | hardcoded passwords, API keys, tokens in code or config |
| **Input validation** | unvalidated external input at API boundaries, trust boundaries |
| **Dependencies** | new dependencies with known vulnerabilities, unpinned versions |
| **Data exposure** | PII in logs, error messages revealing internal state, verbose API responses |
| **Crypto** | custom crypto instead of standard libraries, weak algorithms, hardcoded IVs |

Rules:
- Injection and auth issues are always blocking
- Secrets in code are always blocking — flag immediately
- Custom crypto is always blocking — use standard, audited libraries
- Missing input validation at trust boundaries is blocking
- Do not flag theoretical vulnerabilities without a reachable attack path

**The test:** Did you check each security category? If you skipped one
because "it's not relevant," state why explicitly. Silent skipping is
missing bugs.

### 7. Signal Over Volume

**The most valuable review has 3-5 high-signal comments, not 50 nitpicks.**

| Bad review | Good review |
|---|---|
| 60 comments, 90% nitpicks about naming | 5 comments: 1 blocking issue, 2 suggestions, 1 praise, 1 question |
| An essay for a 2-line change | One sentence with a specific finding |
| Generic "consider refactoring" | "Extract validation into a shared helper — same pattern in 3 controllers" |
| Flags everything equally | Prioritizes: blocking issues first, suggestions second, nitpicks last |

Rules:
- If reading your review takes longer than reading the diff, your review is
  too verbose. Cut.
- Nitpicks belong in a single grouped comment, not 15 individual ones.
- Do not comment on style that the linter/formatter should enforce. If a
  formatter is configured, style is automated — don't review it.
- Every comment must answer: what is the issue, why does it matter, and what
  should the author do?
- If you can't explain why a comment matters, don't post it.

**The test:** If the author addressed only your blocking and issue comments,
would the code be safe to merge? If yes, your review succeeded. If not,
you buried a blocking issue among non-blocking noise.

## Workflow

### 1. Understand the change
- Read the commit message or PR description
- What is the stated goal?
- What is the expected behavior after the change?
- What changed files and why?

### 2. Run the gates
Before reviewing code, check the automated gates:
- Do tests pass? (`npm test`, `pytest`, `go test`, etc.)
- Does the linter pass?
- Does the type checker pass?
- Are there staged or committed secrets? (`git diff --cached | grep -i
  "password\|secret\|token\|key"` or a secret scanner)
- Is the diff size reasonable? (flag if > 400 lines — suggest splitting)

If any gate fails, report it and stop. Do not review code that doesn't pass
basic gates — the author should fix these first.

### 3. Review the diff
Follow the structured order from Principle 3:
1. Description → file tree → triage → deep review (one axis at a time) →
   context → look for what's missing

### 4. Categorize findings
Label every comment with Conventional Comments (Principle 2):
- `issue:` for blocking problems
- `suggestion:` for improvements
- `question:` for potential concerns
- `nitpick:` for trivial preferences (group into one comment)
- `praise:` for something well done (at least one per review)

### 5. Report
Structure the review report:

```markdown
## Review Summary
[1-2 sentences: is this safe to merge? What's the verdict?]

## Blocking Issues
[issue: comments that must be resolved before merge]

## Suggestions
[suggestion/question/thought: non-blocking feedback]

## Nitpicks
[Grouped trivial comments]

## Praise
[At least one specific positive observation]
```

### 6. Follow up
- If the author addresses blocking issues, re-review the changes
- Verify the fix doesn't introduce new issues
- Confirm tests still pass
- Approve when blocking issues are resolved

## Banned AI-Generic Review Patterns

These are the exact review reflexes that AI-generated reviews reach for.
**Do not produce any of these.**

1. **"LGTM 🚀" without reading the diff** — the most common AI review reflex.
   Approving without substantive engagement. Instead: if there are no issues,
   say specifically what you checked and that it passed.

2. **Generic "consider adding error handling"** — suggesting error handling
   without specifying what error, what path, or why the current handling is
   insufficient. Instead: name the specific error case and the specific line.

3. **Hallucinated vulnerabilities** — flagging "this could be vulnerable to
   XSS" when the code already escapes output, or "SQL injection risk" when
   the code uses parameterized queries. Instead: verify the actual code path
   before flagging. If you're not sure, use `question:` not `issue:`.

4. **Essay-length comment for a 2-line change** — writing a 500-word
   analysis of a variable rename. Instead: match comment length to issue
   severity. One sentence for a nitpick. One paragraph for an issue.

5. **Style nitpicks as blocking issues** — blocking merge because a variable
   is named `d` instead of `data`. Instead: nitpicks are never blocking. If
   a formatter is configured, don't comment on style at all.

6. **Commenting on code the reviewer didn't read** — posting generic
   "consider refactoring this" on a file that was only touched for an import
   change. Instead: only comment on code you've read and understood.

7. **"This looks complex" without explaining why or suggesting simpler** —
   flagging complexity without offering an alternative. Instead: explain what
   makes it complex and propose a specific simplification.

8. **Suggesting tests without specifying what to test** — "consider adding
   more tests" without naming a specific uncovered case. Instead: "add a
   test for the empty-input case on line 42 — the current code would throw
   on an empty array."

9. **Praising without specificity** — "nice code!" or "great work!" with no
   reference to what was good. Instead: "the error path test coverage is
   excellent — the edge case for oversized inputs is well handled."

10. **Reviewing the author, not the code** — "you should know better" or
    "an experienced developer would..." Instead: comment on the code's
    behavior, not the author's expertise.

### The meta-rule

If your review could have been written without reading the diff — if it
contains no specific reference to a line number, variable name, function
name, or code pattern — it is noise. A review that says nothing specific
is worse than no review because it gives false confidence that someone
checked.

## Slop Diagnostic

Run this self-audit before posting a review. **Diagnose first, treat
second.**

The twelve tells (presence of each = one point of slop; lower is better):

| # | Tell | What it looks like |
|---|---|---|
| 1 | **"LGTM" with no specifics** | approved without mentioning what was checked |
| 2 | **Generic "consider..."** | suggestion without specifying what, why, or where |
| 3 | **Hallucinated vulnerability** | flagged security issue that doesn't exist in the actual code path |
| 4 | **Essay for a trivial change** | 500 words on a 2-line diff |
| 5 | **Style as blocking** | nitpick marked as a blocking issue |
| 6 | **Unread code commented** | generic comment on a file that was barely touched |
| 7 | **"This is complex"** | complexity flagged without explanation or alternative |
| 8 | **"Add more tests"** | test suggestion without naming a specific uncovered case |
| 9 | **Generic praise** | "nice work!" with no reference to what was good |
| 10 | **Personal commentary** | comment about the author, not the code |
| 11 | **No severity labels** | all comments have equal weight — author can't triage |
| 12 | **Missing security pass** | no explicit check for injection, auth, secrets, input validation |

How to run it:
1. Score the review out of 12. State which tells fired.
2. Repair:
   - Tells 1, 2, 6, 9 → **be specific** — reference exact lines, names, and
     patterns
   - Tells 3 → **verify before flagging** — read the actual code path; use
     `question:` if unsure
   - Tells 4, 7 → **match length to severity** — one sentence for nitpicks,
     one paragraph for issues
   - Tell 5 → **label correctly** — nitpicks are never blocking
   - Tell 8 → **name the case** — specify the exact uncovered scenario
   - Tell 10 → **refocus on code** — rewrite to comment on behavior, not
     the author
   - Tell 11 → **add Conventional Comments labels**
   - Tell 12 → **run the security pass** — check each category
3. Re-score after repairing. Do not post while tells 1, 3, 5, or 10 are
   firing — those are the review-failure patterns.

## Variation Triad

When the diff has multiple issues and the reviewer is unsure which to
prioritize, explore three angles:

1. **Conservative** — flag only blocking issues (correctness, security).
   Defer everything else to follow-up.
2. **Strong-fit** — flag blocking issues plus high-value suggestions that
   the author can address in this PR without scope creep.
3. **Thorough** — flag everything including nitpicks and thoughts. Use for
   security-sensitive changes, new team members (mentorship), or code that
   touches critical paths.

Match the review depth to the risk. A typo fix does not need a thorough
review. A change to the auth middleware does.

## When To Relax

These principles bias toward **thorough review over speed**. For trivial
changes (typo fix, obvious one-liner, dependency version bump), use
judgment — not every change needs the full six-pass review. The principles
matter most on:
- Any change to auth, security, or data access
- Changes > 200 lines
- Changes to shared/util code (high blast radius)
- Changes without tests
- Refactors (must verify behavior is preserved)
- Changes by authors new to the codebase
- Changes to API contracts (breaking changes)

## How To Know It's Working

- Blocking issues are caught before merge, not after
- The author knows exactly what to fix and what is optional
- Reviews are shorter than the diff (or close to it)
- At least one specific praise per review
- No hallucinated vulnerabilities
- Security is checked on every review, not just "security" PRs
- Tests are reviewed for assertion quality, not just coverage
- Scope creep is flagged before merge
- The author feels helped, not attacked

## Tradeoff Note

This skill biases toward **catching real problems over exhaustive
commentary**. A review with 3 high-signal comments is better than one with
50 low-signal comments. If you can't find a real issue, say what you checked
and approve — don't manufacture feedback to seem thorough.

## Pitfalls

- Do not approve without reading the diff. "LGTM" is not a review.
- Do not flag security issues without verifying the code path. Use
  `question:` if unsure.
- Do not block on style when a formatter is configured.
- Do not comment on code you didn't read. If you skimmed, say so.
- Do not manufacture feedback. If the code is good, praise and approve.
- Do not review the author. Comment on the code.
- Do not post 50 comments when 5 will do. Signal over volume.
- Do not skip the security pass. It's always a pass.
- Do not skip the test review. Tests are production code.
- Do not confuse coverage with assertion quality. 95% line coverage with
  no behavior assertions is false confidence.
- Do not let scope creep through. Every line should trace to the goal.
- Do not forget Conventional Comments labels. Unlabeled comments are
  untriageable.
- Do not produce any pattern from the "Banned AI-Generic Review Patterns"
  section above.

## Related Skills

- **systematic-debugging** — load when a review uncovers a bug that needs
  root-cause investigation before fixing
- **design-ux-ui** — load when the review involves UI/layout correctness
  and the root cause is in design tokens or composition
- **motion** — load when the review involves animation correctness or
  performance
- **product-strategy** — not typically composable with review

## Verification

Before posting the review:

**Minimum:**
- The diff was read in full, not skimmed
- Each review axis was checked (correctness, security, tests, performance,
  readability)
- Every comment is labeled with Conventional Comments
- At least one specific praise is included

**Better:**
- The security pass was explicit (each category checked or explicitly
  dismissed with reason)
- Tests were checked for assertion quality, not just coverage
- Context was checked (20-30 lines around each change)
- What's missing from the diff was considered (missing tests, missing error
  handling, missing docs)
- The review was re-scored on the Slop Diagnostic before posting

If verification is limited (e.g., you couldn't run tests), say exactly what
was and was not verified. Never say "approved" if you didn't read the diff.

## Final Quality Gate

Before responding, verify:

- [ ] The diff was read in full, not skimmed
- [ ] The review followed structured order (description → files → triage →
      deep review → context → missing)
- [ ] Every comment is labeled with Conventional Comments
- [ ] Blocking issues are clearly distinguished from non-blocking
- [ ] Security was checked (injection, auth, secrets, input validation,
      dependencies, data exposure, crypto)
- [ ] Tests were reviewed for assertion quality, not just coverage
- [ ] Scope creep was flagged (every changed line traces to the goal)
- [ ] At least one specific praise is included
- [ ] No banned AI-generic patterns are present (no "LGTM" without
      specifics, no hallucinated vulnerabilities, no generic "consider...",
      no style-as-blocking, no personal commentary)
- [ ] The Slop Diagnostic was run and no critical tells are firing
- [ ] Review length is proportional to diff complexity
- [ ] Verification claims match what was actually reviewed