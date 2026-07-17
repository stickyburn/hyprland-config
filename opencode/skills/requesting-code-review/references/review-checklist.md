# High-Risk Review Checklist

Use only categories activated by the diff. Convert an item into a finding only
after verifying a reachable failure in the review range.

## Intent And Scope

- Does the implementation satisfy the original request and acceptance criteria?
- Does every changed file contribute to that outcome?
- Are required docs, configuration, generated artifacts, or migrations missing?
- Are unrelated cleanup and behavioral changes mixed together?

## Correctness And Reliability

- Boundary values, empty or absent data, partial failure, timeout, cancellation
- Incorrect state transitions, ordering assumptions, off-by-one errors
- Unhandled promises, swallowed errors, unsafe retries, duplicate side effects
- Races, deadlocks, shared mutable state, unclosed files/connections/streams
- Contract mismatches across callers, services, serialization, or configuration

## Security And Privacy

- Untrusted input reaching SQL, shell, HTML, templates, paths, or redirects
- Missing authentication, authorization, tenant isolation, or ownership checks
- Secrets in code, history, logs, fixtures, generated output, or error messages
- Excessive data return, personal data exposure, unsafe deserialization
- New dependencies, custom cryptography, weak randomness, or insecure defaults

Trace the actual data and control path before reporting a vulnerability.

## Compatibility And Data

- Public API, event, schema, configuration, or persisted-data compatibility
- Forward/backward compatibility during rolling deployment
- Migration locking, partial execution, idempotency, rollback, and data loss
- Cache invalidation and behavior of old clients or workers

## Performance And Operations

- New work in hot loops, N+1 queries, unbounded reads or growth
- Blocking I/O on latency-sensitive paths, excess allocations, contention
- Retry storms, missing limits/backpressure, timeout budget multiplication
- Missing metrics or actionable errors for new failure modes

Require a realistic workload or complexity argument; do not flag theoretical
micro-optimizations.

## Tests

- Tests assert externally meaningful behavior, not only calls or types
- The new test fails when the defect or requirement is absent
- Error paths and affected boundaries have proportional coverage
- Tests are deterministic and isolated from order, timing, and shared state
- Mocks preserve the contract they stand in for

## Automated Evidence

Prefer project scripts and CI-equivalent commands. Depending on the change,
check targeted tests, broader tests, type checking, lint/format, build, schema or
migration validation, dependency audit, secret scanning, and generated-file
drift. Record exact commands, outcomes, and anything not run.
