# Debugging Techniques Reference

Detailed instructions on debugging methods. Load this when you need
specific techniques during the four-phase investigation.

## Reading Stack Traces

The stack trace tells you the exact location and type of failure. Read it
bottom-to-top (or top-to-bottom depending on language convention), but focus
on:

1. **The error type and message** — what went wrong (TypeError, NullReference,
   segfault, assertion failure)
2. **The first frame in your code** — the library/framework frames above it
   are context; your code is where the bug likely originates
3. **The line number** — go there. Read the code. Understand what it's doing
   at that line.

Rules:
- Do not skip the error message. It often contains the exact cause.
- Do not fix the top frame if it's a library. Find where YOUR code passes
  bad data to the library.
- If the stack trace is truncated, increase the depth or disable stack
  compression.
- If there's no stack trace (silent failure), add targeted logging at the
  boundary to capture the state.

## Bisection

### Manual bisection on code

When you don't know which part of a function or module causes the bug:
1. Comment out the second half of the code path
2. Does the bug persist? If yes, the bug is in the first half. If no, it's
   in the second half.
3. Repeat on the half that contains the bug.
4. Continue until you've narrowed to a single line or statement.

### Git bisect (for regressions)

When the code worked before and now doesn't, use git bisect to find the
commit that introduced the bug:

```bash
git bisect start
git bisect bad          # current commit has the bug
git bisect good <tag>   # this commit/tag works
# git checks out a commit in between
# Test it:
#   git bisect good    # this commit works
#   git bisect bad     # this commit has the bug
# git narrows the range each step
# When done:
git bisect reset
```

Rules:
- **Commit or stash before starting.** Never bisect with uncommitted changes —
  you'll get merge conflicts and unreliable results.
- **The bug must be reproducible.** You need to reliably determine "good" vs
  "bad" at each checkout. Mislabeling is the #1 cause of incorrect results.
- **Automate with `git bisect run`:** if you have a test script, use
  `git bisect run <test-command>` — it exits 0 = good, 1-124 = bad, 125 = skip
  (for flaky/build-broken commits).
- **Use `git bisect skip` for unbuildable commits.** Don't guess — skip and
  let bisect pick a nearby commit.
- **Narrow the range first.** A tighter good/bad window means fewer steps.
  Use release tags or your memory of "last definitely working."
- **Always `git bisect reset` when done** to restore your working state.

## Strategic Logging

### What to log

Log at the boundary between correct and incorrect behavior:
- Function entry and exit (arguments received, values returned)
- State transitions (before and after a mutation)
- Decision points (which branch was taken and why)
- External calls (what was sent, what was received)

### What NOT to log

- Passwords, tokens, API keys, auth headers, PII (credit card numbers, SSNs),
  session tokens
- Build sanitization into the logging — a JSON serializer will dump entire
  request objects including secrets
- Healthcheck/heartbeat noise — filter at the source
- Every line of a loop — log the summary, not every iteration

### How to log

- Use targeted logs: 2-3 at decision points to confirm or refute a specific
  hypothesis, not 30 scattered everywhere
- State what you expect to see before reading the output
- Remove logs after the bug is fixed — don't leave debugging artifacts in
  production code
- Use structured logging (JSON key-value) in production: consistent field
  names across services (`timestamp`, `level`, `message`, `service`,
  `correlationId`, `userId`, `version`)

### Log levels

| Level | Use | Production |
|---|---|---|
| FATAL/CRITICAL | app crashing, must stop | yes |
| ERROR | operation failed, needs attention | yes |
| WARN | unexpected but handled (retry succeeded) | yes |
| INFO | normal operations, key business events | yes |
| DEBUG | detailed diagnostic info (SQL, cache) | staging only |
| TRACE | function entry/exit, variable values | dev only |

### Correlation IDs

For distributed systems, every request gets a unique ID propagated through
the entire system. When something fails, search that one ID to see the
complete request journey. This cuts debug time from hours to minutes.

## Binary Search on Data

When the bug triggers on specific data but you don't know which data:
1. Get the full dataset that triggers the bug
2. Split it in half
3. Test each half — which half triggers the bug?
4. Repeat on the failing half
5. Continue until you've narrowed to the specific input that causes the
   failure

This finds the exact data condition that triggers the bug.

## Rubber Duck Debugging

From *The Pragmatic Programmer* (1999). Explain the code line-by-line to an
inanimate object (or a colleague who doesn't interrupt):

1. Explain what the code is supposed to do
2. Walk through the execution, line by line
3. Explain what each variable should contain at each step
4. Explain where the actual behavior diverges from expectation

The cognitive mechanism: articulating a process forces deeper analysis and
exposes gaps in logic that passive thinking hides. Explaining to a
"non-programmer" forces you to simplify, define every term, and remove
assumptions — this is where hidden flaws surface.

Jeff Atwood noted that ~41% of Stack Overflow users solve their own problem
*while writing the question*, before anyone answers. The explanation IS the
debugging.

## Debugging Race Conditions and Heisenbugs

A Heisenbug disappears or changes behavior when you observe it (logging,
debugger, breakpoint) — because observation changes timing, memory layout,
or execution conditions.

### Why observation changes behavior

- **Debuggers and print statements slow execution 100-1000×**, which resolves
  the race by changing timing
- **Breakpoints pause threads**, destroying the exact interleaving that
  triggers the bug
- **Memory layout changes** when the debugger loads, moving uninitialized
  variable addresses
- **Optimizing compilers** push registers to memory when observed

### How to catch Heisenbugs

- **Don't use breakpoints.** They pause threads and destroy timing.
- **Use stress testing**: randomized goroutine counts, varied concurrency
  levels, thousands of iterations. Research shows 94% of production Heisenbugs
  are reproducible with the right harness.
- **Use ThreadSanitizer/TSan** (C/C++/Go) or similar race detectors — they
  detect data races at runtime without changing timing semantics.
- **Use record-replay debuggers** (rr, PANDA) — record the execution once,
  then replay deterministically with full debugger support.
- **Use non-intrusive observability** (eBPF-based tracing like QTap) —
  captures data without touching the application process.
- **For production Heisenbugs, don't restart.** Restarting wipes the exact
  memory state that caused the bug. Capture first, then investigate.

### Race condition debugging checklist

1. Identify the shared state (what variables/resources are accessed by
   multiple threads?)
2. Identify the synchronization mechanism (locks, atomics, channels, events)
3. Find the window: the code between acquiring and releasing the resource
4. Ask: what happens if thread B executes during this window?
5. Test by increasing contention (more threads, faster execution, artificial
   delays)

## Debugging Memory Leaks

### Methodology (systematic, not shotgun)

1. **Confirm it's a leak** — memory grows monotonically under sustained load
   and doesn't recover after GC; restarts become increasingly frequent
2. **Establish a baseline** — take a heap snapshot before the suspected leak
   scenario
3. **Reproduce the leak** — run the user scenario that creates the leak
4. **Take a second snapshot** — after the scenario
5. **Compare snapshots** — use the "Comparison" view to see only the
   differences (objects added, deleted, size delta); sort by "Size Delta" or
   "New" to find what grew
6. **Investigate retainers** — expand object types, examine the Retainers
   panel to find what's holding references; follow links to source code
7. **Fix and verify** — remove the reference, re-run, confirm memory
   stabilizes

### Chrome DevTools (Memory panel)

- **Heap Snapshot** — point-in-time memory distribution; filter for
  "Detached" to find detached DOM trees
- **Allocation Timeline** — records allocations over time; blue bars that
  persist (don't get GC'd) indicate leaks
- **Comparison view** — snapshot 1 (baseline) → snapshot 2 (after leak) →
  compare to see only deltas

### Node.js (`--inspect`)

- `node --inspect app.js` → Chrome DevTools → Memory → Heap Snapshot
- Programmatic: `v8.getHeapSnapshot()` or `heapdump.writeSnapshot()`
- Trigger in production: `kill -USR2 <pid>` (note: snapshot requires ~2x heap
  size temporarily)

### Common leak patterns

- Event listeners never removed (`socket.on('data', ...)` without
  `socket.off()`)
- Closures capturing variables longer than needed
- Global variables / caches growing unbounded (use WeakMap or LRU)
- Unclosed connections (database, HTTP, WebSocket)
- Misconfigured loggers retaining request objects

## Debugging Performance Problems

A performance problem produces correct output too slowly. A correctness bug
produces wrong output. Don't conflate them — the strategies differ.

### Problem statement (start here)

- What makes you think there's a problem?
- Has it ever performed well?
- What changed recently?
- Can degradation be expressed as latency or runtime?
- Does it affect others?

### What to measure first

- **Start with latency, not throughput** — measure end-to-end request latency
  as a histogram including p95 and p99, not just averages
- **Determine if the problem is on-CPU or off-CPU** — high latency with low
  CPU points to I/O/lock/scheduler waiting, not CPU hotspots

### Flame graphs (Brendan Gregg)

- Visualize stack traces from CPU profiling
- **Width** = time spent in that function, **height** = call stack depth
- On-CPU flame graphs show where the program was running on a core — they do
  NOT show time blocked on disk/network/mutex (that needs off-CPU profiling)
- The widest box is tempting to blame, but ask: is it a hotspot you can
  change, or just "time spent in malloc/GC/logging" because the real issue is
  upstream?

### USE Method (for every resource)

Check each resource: **U**tilization, **S**aturation, **E**rrors — finds
resource bottlenecks.

### RED Method (for every service)

Check each service: **R**equest rate, **E**rrors, **D**uration.

### Performance optimization order (Hanson/Crain)

Don't do it → Do it but don't again → Do it less → Do it later → Do it when
they're not looking → Do it concurrently → Do it cheaper.

## Using Debuggers

### Breakpoints

- **Line breakpoint** — pause at a specific line
- **Conditional breakpoint** — pause only when a condition is true (e.g.,
  `user.id === 1234`). Use when the bug triggers on specific data.
- **Logpoint / tracepoint** — log a value without pausing. Use for Heisenbugs
  where pausing changes behavior.
- **Exception breakpoint** — pause when an exception is thrown, before it's
  caught. Use when you don't know where the error originates.

### Watch and inspect

- **Watch** — monitor a variable's value as you step through code
- **Call stack** — see the function chain that led to the current point
- **Scope/locals** — see all variables in the current scope

### Step commands

| Command | What it does |
|---|---|
| Step into | enter the next function call |
| Step over | execute the next line without entering functions |
| Step out | finish the current function and pause at the caller |
| Continue | resume execution until the next breakpoint |

### When to use a debugger vs logging

- **Debugger** — when you can reproduce locally and need to inspect state
  at specific points. Best for deterministic bugs.
- **Logging** — when you can't reproduce locally, need to debug in
  production, or the bug is timing-sensitive (debugger changes timing).
  Best for intermittent or environment-dependent bugs.