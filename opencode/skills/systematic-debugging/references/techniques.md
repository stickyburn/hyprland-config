# Specialized Debugging Techniques

Load only the relevant section after the core workflow identifies the evidence
needed.

## Stack And Data-Flow Tracing

- Start with the exact error and first relevant application frame.
- Walk callers and inputs backward until the invalid value or state is created,
  rather than guarding only where it is consumed.
- In multi-component flows, inspect input, output, config, and state at each
  boundary. Redact secrets and personal data.
- Compare the failing path with a nearby working path to isolate meaningful
  differences.

## Targeted Instrumentation

- Instrument decision points and component boundaries that distinguish current
  hypotheses; avoid log avalanches.
- Record expected output before collecting the signal.
- Prefer structured fields and correlation IDs in distributed paths.
- Do not log credentials, auth headers, tokens, payment data, or unnecessary
  personal information.
- Remove temporary diagnostics after verification unless they provide durable
  operational value.

## Regression Bisection

Use `git bisect` when a reliable good/bad check exists and the likely commit
range is broad:

```bash
git bisect start
git bisect bad
git bisect good <known-good-ref>
git bisect run <reproduction-command>  # optional automation
git bisect reset
```

Exit `0` for good, `1-124` for bad, and `125` to skip in `git bisect run`.
Use `git bisect skip` for untestable revisions. Do not alter or stash someone
else's uncommitted work to obtain a clean tree; use an isolated worktree or ask
before changing worktree state.

## Intermittent And Concurrent Failures

- Identify shared state, synchronization, ordering assumptions, and the failure
  window.
- Build a repeatable stress harness with varied ordering, load, or seeds; record
  seeds when possible.
- Use the ecosystem's race detector, scheduler tracing, or record/replay tools.
- Replace arbitrary sleeps with observable condition-based waits.
- Treat retries as resilience only when duplicate effects, limits, backoff, and
  failure reporting are correct; retries are not root-cause evidence.

## Memory Growth

1. Distinguish a leak from expected cache or workload growth under a stable load.
2. Capture a baseline after warm-up and another snapshot after the reproducer.
3. Compare retained objects and follow retainers to the owning code.
4. Check unbounded caches, listeners, closures, timers, and unclosed resources.
5. Repeat the same workload and confirm memory reaches a stable bound.

## Performance Regression

1. Define the affected workload and metric; use distributions such as p50, p95,
   and p99 rather than averages alone.
2. Capture a before baseline in a representative environment.
3. Determine whether time is on-CPU, waiting on I/O, blocked on locks, spent in
   allocation/GC, or caused by excess requests.
4. Profile the measured bottleneck. Check query counts, algorithms, allocations,
   contention, and payload size as evidence suggests.
5. Apply one optimization hypothesis and compare before/after while preserving
   correctness.
