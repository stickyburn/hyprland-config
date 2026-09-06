---
name: systematic-debugging
description: Diagnoses bugs, crashes, failing or flaky tests, regressions, wrong output, hangs, leaks, races, and unexplained performance loss, then applies verified root-cause fixes when requested. Do not use for feature work, code review, or infrastructure-only incidents.
---

# Systematic Debugging

- Reproduce the failure, compare expected and actual behavior, and trace the relevant code. Test possible causes against evidence rather than stacking speculative fixes.
- Diagnose without editing when only an explanation is requested. For fixes, address the demonstrated cause; label temporary mitigation as such.
- Add focused regression coverage when practical, rerun the reproduction and relevant checks, and remove temporary instrumentation. Explain the cause, fix, and what was or was not verified.

Load `references/techniques.md` only when the case needs instrumentation, bisection, concurrency, memory, or performance methods.
