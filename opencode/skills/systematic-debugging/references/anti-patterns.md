# Debugging Anti-Patterns Reference

The full catalog of debugging failures with before/after fixes. Load this
when you suspect your debugging approach is going wrong.

---

### Shotgun Debugging

**What:** Making random changes hoping the bug disappears.

**Why wrong:** Even if the bug stops, you don't know why. You may have
introduced a new bug while masking the original.

**Fix:** One change at a time, tested after each. Form a hypothesis before
touching code.

---

### Cargo Cult Fixing

**What:** Copying a fix from Stack Overflow, a past bug, or a teammate
without understanding the mechanism.

**Why wrong:** If you can't finish the sentence "this fixes the bug
because [specific reason]," you don't understand it. The fix may work by
coincidence and break under different conditions.

**Fix:** State "this fixes the bug because [specific reason]." If you can't
finish the sentence, you don't understand it yet. Keep investigating.

---

### Fixing Symptoms, Not Causes

**What:** Adding a null check without understanding why the value is null.
Adding a retry without understanding why it fails.

**Why wrong:** The root cause resurfaces differently. The null check handles
one path; the next null comes from a different source. The retry masks a
systemic failure.

**Fix:** Use 5 Whys. Trace the null/retry/failure to its origin. Fix the
origin, not the downstream symptom.

---

### Changing Multiple Things At Once

**What:** Changing three things and running the tests. The bug stops. Which
change fixed it?

**Why wrong:** You can't attribute the fix. If the bug persists, you've added
variables making the next investigation harder.

**Fix:** One change at a time. Test. Observe. Decide the next change based on
the result.

---

### Print Statement Avalanche

**What:** Adding 30 `console.log` statements and reading through output
hoping to spot the problem.

**Why wrong:** You drown signal in noise. You spend more time reading logs
than thinking about the bug. You also leave debugging artifacts in the code.

**Fix:** Add 2-3 targeted logs at decision points to confirm or refute a
specific hypothesis. State what you expect to see before reading the output.
Remove the logs after the bug is fixed.

---

### Blame-Driven Debugging

**What:** "It must be the library/framework/external service."

**Why wrong:** External causes are real but rare. Assuming your code is
correct prevents you from finding the actual bug in your code. Only blame
externals after verifying your code is correct AND the external behavior
contradicts its documentation.

**Fix:** Assume your code/config/assumptions are wrong first. Verify your
code. Check the external's documented behavior. Only then consider the
external as the source.

---

### Tunnel Vision

**What:** Spending hours in one file because you're "sure" the bug is there.

**Why wrong:** After 15 minutes without progress in one location, you're
locked into a wrong assumption. The bug is where data first goes wrong, not
where the error surfaces.

**Fix:** After 15 minutes without progress, step back. Trace data flow from
the beginning. The bug is where data first becomes wrong, not where the
error is reported.

---

### No Regression Test

**What:** Fixing the bug without writing a test that fails before and passes
after.

**Why wrong:** The bug will return in a future refactor. The fix is
temporary without a guard.

**Fix:** Write the failing test FIRST. It should fail before the fix and pass
after. This test is the proof that the bug existed and the fix resolved it.

---

### The Panic Loop

**What:** Under pressure, making random changes → still broken → more panic
→ more random changes.

**Why wrong:** The amygdala overrides the prefrontal cortex. You're no longer
debugging; you're thrashing.

**Fix:** Break the loop with a 5-second pause. Re-engage logical thinking.
Return to the four-phase investigation. Start from reproduction.

---

### The Infinite Loop

**What:** "Let me try one more thing" repeated 10 times with the same
approach.

**Why wrong:** After 3 failed fixes with the same approach, you have a wrong
approach, not a wrong hypothesis. More attempts with the same mental model
will not work.

**Fix:** After 3 failed fixes, STOP. Question the architecture entirely.
Trace data flow from the beginning. Consider whether the bug is in a
different layer than you've been searching.

---

### Debugging Without Reproducing

**What:** "I think I know what's wrong" — fixing without a reliable
reproduction.

**Why wrong:** You can't verify the fix worked. You can't know if the change
resolved the bug or if the bug was intermittent and would have stopped
anyway.

**Fix:** Reproduce first. Always. If you can't reproduce after reasonable
effort, say so and document the conditions.

---

### Fixing Without Understanding

**What:** The error goes away after your change, but you can't explain why
the old code was wrong or why the new code is correct.

**Why wrong:** The fix may work by coincidence. The root cause is still
present. The same bug will recur with different data.

**Fix:** You must be able to explain in one sentence why the old code was
wrong and why the new code is correct. If you can't, you don't understand
the fix.

---

### Rationalizing Results

**What:** Running a test, seeing an unexpected result, and saying "yeah,
that makes sense" after the fact.

**Why wrong:** You're fitting a story to the data instead of testing a
prediction. This is confirmation bias, not debugging.

**Fix:** State your prediction before running the test. "If X is the cause, I
expect to see Y." Run the test. Did you see Y? If not, your hypothesis is
wrong — this is progress, not failure.

---

### Modifying Tests To Match Broken Behavior

**What:** The test fails, so you change the test expectations to match what
the code does.

**Why wrong:** The test describes correct behavior. If the code disagrees,
the code is wrong, not the test. Changing the test makes the bug
invisible.

**Fix:** The test is the spec. Fix the code to match the test. If the test
itself is genuinely wrong (the spec changed), update the test in a separate
commit with a documented reason — never silently during a bug fix.

---

### Error Swallowing

**What:** Wrapping a failing line in `try { ... } catch (e) { /* ignore */ }`
to make the error go away.

**Why wrong:** The error is telling you something is broken. Swallowing it
hides the bug and makes future debugging harder because the error no longer
surfaces.

**Fix:** Understand why the error occurs. Fix the root cause. If catching
the error is genuinely necessary (a known, handled condition), log it and
document why it's caught.

---

### Adding `as any` / Type Assertions To Silence Errors

**What:** The type checker complains, so you add `as any` or a type assertion
to force it through.

**Why wrong:** The type error is telling you the data doesn't match the
expected shape. Silencing it doesn't fix the data — it hides a mismatch
that will surface as a runtime bug.

**Fix:** Understand the type mismatch. Fix the data flow so the types align
naturally. If the type is genuinely unknown (untyped external), use a
narrower assertion than `any` (e.g., `as unknown as SpecificType`) and
document why.