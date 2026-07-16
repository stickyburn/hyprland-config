---
name: systematic-debugging
description: >-
  Investigates bugs, test failures, and unexpected behavior through structured
  root-cause analysis — no fixes without understanding the problem first.
  Use whenever the user encounters a bug, test failure, stack trace, crash,
  regression, flaky test, performance degradation, race condition, memory
  leak, infinite loop, wrong output, or any behavior that contradicts
  expectations. Also use when the user says "this is broken", "why is this
  happening", "it was working before", "I can't reproduce this", "the tests
  are flaky", or wants to understand WHY something fails before changing
  code. Do not use for new feature design, UI layout, product strategy, or
  code review — use design-ux-ui, product-strategy, or requesting-code-review
  for those. Do not use for infrastructure outages or system-level diagnosis
  without a code component.
metadata:
  version: "0.1.0"
---

# Systematic Debugging

Find and fix the root cause, not the symptom. Never change code to make a
symptom disappear without understanding why the change works. A fix without
understanding is a future bug.

## When To Use

- Bugs: wrong output, crashes, exceptions, null reference errors
- Test failures: unit, integration, e2e, flaky tests
- Regressions: "it worked before, now it doesn't"
- Race conditions: timing-dependent failures, Heisenbugs
- Memory leaks: growing memory, GC pressure, OOM kills
- Performance: unexpected slowness, jank, dropped frames
- Infinite loops, deadlocks, hangs
- Type errors, configuration failures, environment-dependent bugs
- "I can't reproduce this" — intermittent or environment-specific failures

## When NOT To Use

- New feature implementation (write code, then debug if needed)
- UI layout or visual design (use design-ux-ui)
- Animation or motion bugs that are visual-only (use motion)
- Product strategy or market decisions (use product-strategy)
- Code quality review (use requesting-code-review)
- Infrastructure outages without a code component
- Security audits (use security-review when available)

## Core Principles

Each principle has a one-liner and a self-check.

### 1. Reproduce Before Fixing

**If you can't reproduce it, you can't know you fixed it.**

Before changing any code, establish a reliable reproduction:
- A minimal sequence of steps that triggers the bug every time
- The exact environment: language version, OS, dependencies, config, data
- The expected behavior and the actual behavior, stated precisely

If the bug is intermittent, identify the conditions that correlate with
failure. Intermittent does not mean unrepeatable — it means the trigger is
unknown, not absent.

If you genuinely cannot reproduce after reasonable effort, say so. Do not
guess at a fix for a bug you cannot trigger. Document the conditions reported
and what you tried.

**The test:** Can you trigger the bug on demand? Can you make it stop by
reverting your suspected change? If not, you haven't reproduced it.

### 2. Understand Before Changing

**Never change code you don't understand in an attempt to fix a bug.**

The most common debugging failure is shotgun debugging — making changes
hoping something works. This is worse than not fixing the bug because it
creates new bugs while masking the original.

Before writing a fix:
- Read the code path that fails, not just the line that throws
- Understand the data flow: what inputs produce the wrong output
- Trace the execution path from trigger to symptom
- Identify the exact assumption that is wrong

If you don't understand the code, read more of it. Read the tests. Read the
git history. Read the related modules. Understanding is faster than guessing.

**The test:** Can you explain in one sentence why the bug occurs? If not,
you don't understand it yet. Keep reading.

### 3. One Change At A Time

**Never change multiple things simultaneously. You won't know which change
fixed it.**

When testing a hypothesis, change exactly one thing. Run the test. Observe.
Then decide the next change based on the result.

| Instead of... | Do this... |
|---|---|
| Change three things and run the tests | Change one, run tests, observe, repeat |
| "Let me try refactoring this while I'm here" | Don't. Fix the bug first. Refactor later. |
| "I'll add error handling to catch this" | Find why the error occurs. Don't catch what you don't understand. |
| Add a `console.log` and a fix at the same time | Add the log first. See what it prints. Then decide the fix. |

**The test:** If the fix works, can you identify the single change that
resolved it? If you changed three things, you can't.

### 4. Hypothesize, Predict, Test

**Treat every debugging step as an experiment with a prediction.**

Form a hypothesis: "The bug is caused by X because Y." Make a prediction:
"If X is the cause, then doing Z should produce result W." Test it. Observe
whether the result matches the prediction.

| Step | What you do | What you write |
|---|---|---|
| Hypothesis | "The null comes from the cache returning undefined" | State it explicitly |
| Prediction | "Clearing the cache before the call should prevent the null" | State what you expect to see |
| Test | Clear the cache, run the code | Do the one thing |
| Observe | The null still occurs | Report the actual result |
| Conclude | The cache is not the cause. Revise hypothesis. | The hypothesis was wrong — this is progress, not failure |

A wrong hypothesis is not a failure. It eliminates a possibility and narrows
the search. Five wrong hypotheses systematically tested are faster than one
guess randomly applied.

**If 3 or more fixes fail, STOP.** Question the architecture, not the next
hypothesis. You have a wrong approach, not a wrong hypothesis. Step back,
trace data flow from the beginning, and consider whether the bug is in a
different layer than you've been searching.

**The test:** Did you state a prediction before running the test? If you
looked at the result and said "yeah, that makes sense," you're rationalizing,
not testing.

### 5. Find The Root Cause, Not The Nearest Bug

**The first bug you find is usually not the root cause. It's a symptom.**

When you find a bug, ask: why does this happen? Then ask: why does THAT
happen? Continue until you reach a cause that, if fixed, prevents the entire
class of bugs — not just this instance.

Use the 5 Whys: iterate "why" 3-7 times (not always 5) until you reach an
actionable cause. Validate by reading the chain backwards with "therefore"
between each level — if it reads logically, the chain holds. Stopping at the
first plausible answer is the #1 pitfall.

```
Symptom: "The checkout page crashes"
→ Why? "The payment API returns null"
→ Why? "The user object has no address"
→ Why? "The address form was skipped"
→ Why? "The form validation passes with empty address"
→ Root cause: validation logic allows empty address field
```

For multi-cause problems where 5 Whys is too linear, use Is/Is-Not analysis
(Kepner-Tregoe): explicitly state what the problem IS and what it could be
but IS NOT, across What/Where/When/Extent. The IS-NOT column reveals the
distinguishing change that caused the bug.

Fixing the crash (null check on the API response) prevents the crash but
not the bug. Fixing the validation prevents the crash AND every downstream
consequence of empty addresses.

**The test:** If this exact bug occurred again with different data, would
your fix prevent it? If not, you fixed a symptom.

### 6. Fix The Smallest Change That Resolves The Root Cause

**The fix should be as small as possible while addressing the root cause.**

Do not:
- Refactor the surrounding code "while you're here"
- Add error handling for hypothetical future bugs
- Change unrelated formatting or style
- Fix adjacent issues you noticed (note them, handle them separately)

Do:
- Change the minimum code necessary to fix the root cause
- Add or update a test that reproduces the bug and verifies the fix
- Note any secondary issues for separate fixes

**The test:** Does every changed line trace directly to the root cause? If
any line doesn't, it shouldn't be in this fix.

### 7. Verify The Fix Doesn't Create New Bugs

**Running the existing test suite is necessary but not sufficient.**

After fixing:
1. Run the failing test — it should now pass
2. Run the full test suite — no new failures
3. Check the edge cases around the fix — what inputs could now behave
   differently?
4. Check the code path you changed — does anything else depend on the old
   behavior?
5. If the bug was a race condition, test under load/timing variation
6. If the bug was environment-dependent, test in the affected environment

**The test:** Did you run the full test suite? Did you test the edge cases
around your fix? If not, you don't know the fix is safe.

## The Four-Phase Investigation

Do not skip phases. Do not merge phases. Each phase has a specific gate.

### Phase 1: Reproduce

**Goal:** Trigger the bug reliably.

Steps:
1. Get the exact error message, stack trace, or description of wrong behavior
2. Identify the environment: language version, OS, dependencies, config, data
3. Attempt to reproduce in the current environment
4. If reproduction fails, try the reported environment
5. If still failing, narrow the trigger: what's the minimum sequence that
   produces the symptom?

**Gate:** You can trigger the bug on demand. You have a test case or
reproduction steps.

If you cannot reproduce after reasonable effort:
- Document what you tried
- Check if the bug is environment-specific (works on their machine, not yours)
- Check if the bug is data-specific (requires specific input)
- Check if the bug is timing-specific (requires load or concurrency)
- Say so honestly. Do not guess.

### Phase 2: Isolate

**Goal:** Find the exact line, component, or interaction that causes the
wrong behavior.

Steps:
1. Read the stack trace. Identify the file and line.
2. If no stack trace, add targeted logging at the boundary between correct
   and incorrect behavior.
3. Use bisection: comment out half the code. Does the bug persist? Narrow
   the half.
4. Use git bisect if the bug is a regression: find the commit that introduced
   it.
5. Trace the data flow: what value enters the failing function? What value
   exits? Where does it become wrong?

**Gate:** You can name the exact location where correct behavior becomes
incorrect behavior.

### Phase 3: Understand

**Goal:** Explain why the bug occurs.

Steps:
1. State the hypothesis: "The bug occurs because X."
2. Make a prediction: "If I change X, the bug should stop."
3. Test the prediction with a minimal change.
4. If the prediction is wrong, revise the hypothesis. This is progress.
5. Ask "why" repeatedly until you reach the root cause (see Principle 5).
6. Check for related bugs: does the same root cause produce other symptoms?

**Gate:** You can explain in one sentence why the bug occurs and what the
root cause is.

### Phase 4: Fix and Verify

**Goal:** Resolve the root cause without introducing new bugs.

Steps:
1. Write a test that reproduces the bug (it should fail before the fix)
2. Make the smallest change that fixes the root cause
3. Run the reproducing test — it should now pass
4. Run the full test suite — no new failures
5. Test edge cases around the fix
6. Check if the old behavior was depended on by anything else
7. Review the diff: every changed line should trace to the root cause
8. Document the fix: what was wrong, what you changed, why it works

**Gate:** The bug is fixed, the test passes, the suite is green, and you
can explain why the fix works.

## Debugging Techniques

Load `references/techniques.md` for detailed instructions on:
- Reading stack traces
- Bisection and git bisect
- Strategic logging (what to log, where, what not to log)
- Binary search on data (find the input that triggers the bug)
- Rubber duck debugging (explaining code line by line)
- Debugging race conditions and timing bugs
- Debugging memory leaks
- Debugging performance problems
- Using debuggers (breakpoints, watch, step, conditional breakpoints)

## Debugging Anti-Patterns

Load `references/anti-patterns.md` for the full catalog of debugging failures:
- Shotgun debugging
- Changing multiple things at once
- Fixing symptoms not causes
- Adding error handling instead of understanding
- "Works on my machine"
- Debugging without reproducing
- Fixing without a test
- Refactoring during a fix
- Assuming the cause without testing
- Rationalizing results after the fact

## Banned AI-Generic Debugging Patterns

These are the exact debugging reflexes that AI-generated code reaches for.
**Do not produce any of these.**

1. **`try/catch` to swallow the error** — wrapping a failing line in
   `try { ... } catch { /* ignore */ }` to make the error go away. This hides
   the bug, it doesn't fix it. Instead: understand why the error occurs and
   fix the root cause.

2. **Adding `null`/`undefined` checks everywhere** — sprinkling `if (x ==
   null) return;` guards around the failing code path. This patches the
   symptom without understanding why the value is null. Instead: find where
   the null originates and fix it there.

3. **"Let me add error handling just in case"** — adding broad exception
   handlers for hypothetical scenarios while debugging a specific bug.
   Instead: fix the specific bug. Add error handling later if a real need
   exists, as a separate change.

4. **`// TODO: fix this properly`** — leaving a workaround in place with a
   comment promising to fix it later. The comment is never revisited.
   Instead: fix it properly now, or document the issue as a bug ticket with
   the investigation findings.

5. **Changing the test to make it pass** — modifying the test expectations
   to match the broken behavior instead of fixing the code. Instead: the
   test describes correct behavior. If the code disagrees, the code is
   wrong, not the test.

6. **"It works on my machine" as a conclusion** — dismissing the bug
   because it doesn't reproduce locally. Instead: the bug is real to the
   person experiencing it. Investigate the environment differences.

7. **Random `console.log` everywhere** — adding dozens of log statements
   and reading through output hoping to spot the problem. Instead: add
   targeted logs at the boundary between correct and incorrect behavior.
   Form a hypothesis about what you expect to see before reading the output.

8. **Adding `as any` / type assertions to silence type errors** — forcing
   a type through to make the compiler stop complaining. Instead: the type
   error is telling you something. Understand the type mismatch and fix
   the data flow.

9. **Restarting/reinstalling as a first resort** — "try restarting the
   server / reinstalling node_modules / clearing the cache" before
   investigating. This is debugging roulette. Instead: reproduce the bug,
   understand it, then fix it. If a cache or state issue is the hypothesis,
   test it deliberately, not as a blind retry.

10. **Refactoring while fixing** — "I noticed this code is messy, let me
    clean it up while I'm here." This contaminates the fix with unrelated
    changes, making it impossible to know if the fix or the refactor caused
    any new issues. Instead: fix the bug with the smallest possible change.
    Refactor in a separate commit.

### The meta-rule

If your debugging approach could be described as "try things until the error
goes away," it failed. The goal is to understand the bug, not to make the
error message disappear. An error message that goes away without understanding
is a bug that will return.

## Rubber Duck Protocol

When you're stuck — the hypothesis doesn't fit, the reproduction fails, or
the code doesn't make sense — explain the problem out loud, line by line,
as if teaching someone who knows nothing about the codebase.

1. Explain what the code is supposed to do
2. Walk through the execution, line by line
3. Explain what each variable should contain at each step
4. Explain where the actual behavior diverges from expectation

The act of explaining forces you to confront assumptions you've been making
implicitly. Most "stuck" moments break when you have to explain the step
you've been skipping over.

**The test:** Did you find yourself saying "wait, that doesn't make sense"
during the explanation? That's the bug.

## Variation Triad

When the root cause is unclear and multiple hypotheses are viable, explore
three debugging directions:

1. **Conservative** — test the most likely hypothesis first (the simplest
   explanation that fits the evidence)
2. **Strong-fit** — test the hypothesis that best matches the specific
   symptoms and error pattern
3. **Divergent** — test a hypothesis from a different layer or component
   than where the symptom appears (the bug may be remote from the symptom)

Do not test all three simultaneously. Test sequentially, one change at a
time, observing results before moving to the next.

## When To Relax

These principles bias toward **thorough investigation over speed**. For
trivial bugs (typo in a string, obvious null from a missing parameter), use
judgment — not every one-line fix needs the full four-phase investigation.
The principles matter most on:
- Bugs you can't reproduce
- Bugs in code you didn't write or don't fully understand
- Race conditions, timing bugs, and intermittent failures
- Regressions (the code worked before — something changed)
- Bugs that have been "fixed" before and came back
- Performance problems (the cause is often non-obvious)
- Any bug where the first hypothesis didn't work

## How To Know It's Working

- The bug is fixed by a change you can explain, not by a change that "worked"
- The reproducing test passes after the fix and fails before it
- The full test suite is green
- You can explain the root cause in one sentence
- The fix is the smallest change that addresses the root cause
- The same class of bug would be prevented by the fix, not just this instance
- You didn't change anything unrelated to the root cause
- If the bug returns, you know exactly where to look

## Tradeoff Note

This skill biases toward **understanding over speed**. For production
incidents where the system is down, a temporary mitigation may be needed
before the full investigation. Apply the mitigation, then continue the
investigation to find and fix the root cause. Never confuse the mitigation
with the fix.

## Pitfalls

- Do not skip the reproduction phase. "I think I know what's wrong" without
  reproduction is guessing.
- Do not change multiple things at once. You won't know which change worked.
- Do not fix the symptom and declare done. Find the root cause.
- Do not add broad error handling instead of understanding the specific
  failure.
- Do not modify tests to match broken behavior. The test is correct; the code
  is wrong.
- Do not refactor while fixing a bug. Make the smallest change possible.
- Do not rationalize results after the fact. State your prediction before
  testing.
- Do not add `console.log` randomly. Add targeted logs at boundaries.
- Do not swallow errors with try/catch. Understand and fix them.
- Do not add `as any` or type assertions to silence the compiler. Fix the
  type mismatch.
- Do not claim the bug is fixed without running the full test suite.
- Do not assume "works on my machine" means the bug doesn't exist.
- Do not produce any pattern from the "Banned AI-Generic Debugging Patterns"
  section above.

## Related Skills

- **design-ux-ui** — load when a visual bug needs diagnosis (wrong layout,
  broken responsive, contrast failure) and the root cause is in CSS/design
  tokens, not logic
- **motion** — load when an animation bug needs diagnosis (jank, flicker,
  wrong easing, performance) and the root cause is in the animation code
- **product-strategy** — not typically composable with debugging
- **requesting-code-review** — load after the fix is verified, before
  committing

## Verification

Before declaring the bug fixed:

**Minimum:**
- The reproducing test passes after the fix
- The reproducing test fails before the fix (or on the unpatched code)
- The full test suite runs with no new failures

**Better:**
- Edge cases around the fix are tested
- The fix is reviewed for unintended side effects
- The code path is checked for other dependencies on old behavior
- Race conditions are tested under load
- Environment-specific bugs are tested in the affected environment
- A second person reviews the root cause analysis

If verification is limited by environment, say exactly what was and was not
verified. Never say "fixed" if the fix was not actually tested.

## Final Quality Gate

Before responding, verify:

- [ ] The bug was reproduced before fixing
- [ ] The root cause is identified and stated in one sentence
- [ ] The fix is the smallest change that addresses the root cause
- [ ] A test reproduces the bug and passes after the fix
- [ ] The full test suite has no new failures
- [ ] No unrelated code was changed (no refactoring during the fix)
- [ ] No banned AI-generic patterns were used (no try/catch swallowing, no
      blanket null checks, no `as any`, no test modification, no "works on my
      machine" dismissal)
- [ ] The fix was verified against edge cases
- [ ] You can explain why the fix works and why the old code was wrong
- [ ] Verification claims match what was actually verified