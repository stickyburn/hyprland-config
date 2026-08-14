---
name: systematic-debugging
description: Diagnoses bugs, crashes, failing or flaky tests, regressions, wrong output, hangs, leaks, races, and unexplained performance loss, then applies verified root-cause fixes when requested. Do not use for feature work, code review, or infrastructure-only incidents.
---

# Systematic Debugging

For diagnosis requests, report without editing. For fix requests, change code only after evidence supports the cause. A reversible incident mitigation may come first, but label it as mitigation.

## Workflow

1. Establish expected and actual behavior, the exact error, environment, scope, and relevant changes. Reproduce with the smallest practical command or observable signal.
2. Read the failing path, callers, tests, contracts, and configuration. Trace state until correct behavior first diverges. Compare a working case or inspect history when useful.
3. Form a falsifiable hypothesis: `X causes the symptom because Y; if true, Z should occur.` Test one hypothesis at a time. Revise it from evidence instead of stacking speculative fixes.
4. When authorized, make the smallest change that fixes the demonstrated cause. Add regression coverage at the closest useful boundary when practical.
5. Re-run the original reproduction and relevant repository checks. Remove instrumentation and inspect the final diff.

Report the cause, evidence, change, commands and results, limitations, and residual risk. Do not claim verification that did not run.

Load `references/techniques.md` only when the case needs instrumentation, bisection, concurrency, memory, or performance methods.
