# Review Checklist Reference

The per-axis checklists used during the deep review phase. Load this when
reviewing a diff for a specific category.

## Correctness Checklist

- [ ] Does the code do what the description says it does?
- [ ] Are edge cases handled? (empty, null, boundary, max-size, concurrent)
- [ ] Are error paths handled? (network failure, timeout, invalid response)
- [ ] Are there off-by-one errors in loops, ranges, or pagination?
- [ ] Are there type coercion issues? (string vs number, null vs undefined)
- [ ] Are there logic errors in conditionals? (wrong operator, missing else)
- [ ] Does the code handle the case where the external system returns
      unexpected data?
- [ ] Are there race conditions in concurrent code?
- [ ] Are there resource leaks? (unclosed connections, files, streams)
- [ ] Does the change preserve existing behavior for unchanged paths?

## Security Checklist

### Injection
- [ ] SQL queries use parameterized statements, not string concatenation
- [ ] HTML output is escaped, not raw user input
- [ ] Command execution does not concatenate user input
- [ ] Template rendering escapes dynamic content
- [ ] Log injection: user input in log messages is sanitized

### Auth and Authz
- [ ] Every endpoint that needs auth checks for authentication
- [ ] Every endpoint that needs authorization checks permissions
- [ ] Permission checks use the correct role/level
- [ ] Session/token handling is secure (no predictable tokens, proper expiry)
- [ ] No privilege escalation paths (user can access other user's data)

### Secrets
- [ ] No hardcoded passwords, API keys, tokens, or private keys in code
- [ ] Secrets come from environment variables or secret managers
- [ ] No secrets in commit messages, comments, or config files
- [ ] `.gitignore` excludes secret files
- [ ] No secrets in log output

### Input Validation
- [ ] All external input is validated at trust boundaries (API endpoints,
      form handlers, message consumers)
- [ ] Input is validated for type, length, format, and range
- [ ] File uploads check type, size, and content
- [ ] Redirect URLs are validated against an allowlist (open redirect)
- [ ] Deserialization of untrusted data is avoided or sandboxed

### Dependencies
- [ ] New dependencies are necessary and from trusted sources
- [ ] Dependency versions are pinned, not floating
- [ ] No known vulnerabilities in new dependencies (check with `npm audit`,
      `pip-audit`, `govulncheck`, etc.)
- [ ] No unnecessary dependencies added

### Data Exposure
- [ ] No PII in log messages (emails, phone numbers, SSNs, credit cards)
- [ ] Error messages don't reveal internal state (stack traces to clients,
      database schema in error messages)
- [ ] API responses don't over-expose data (return only needed fields)
- [ ] No sensitive data in URLs (query parameters are logged by proxies)

### Crypto
- [ ] No custom crypto implementations (use standard, audited libraries)
- [ ] No weak algorithms (MD5, SHA1 for security, DES, ECB mode)
- [ ] No hardcoded IVs, salts, or keys
- [ ] Random values use cryptographically secure generators
- [ ] TLS is enforced, not optional

## Test Quality Checklist

### Coverage vs Assertions
- [ ] Tests assert against public observable behavior, not internal call graph
- [ ] Tests would fail if the function's behavior changed (not just if it
      threw)
- [ ] The test is not test theater (replacing the implementation with a stub
      that does nothing would NOT pass the test)
- [ ] No assertion-free tests (a test that runs code but never checks output)

### Edge Cases
- [ ] Happy path is tested
- [ ] Error path is tested (failure, exception, timeout)
- [ ] Empty/null/undefined inputs are tested
- [ ] Boundary values are tested (0, -1, max, max+1, empty string, empty array)
- [ ] Concurrent access is tested if relevant

### Test Quality
- [ ] Tests are deterministic (no flaky timing, no order dependence)
- [ ] Tests are independent (no shared mutable state between tests)
- [ ] Tests are readable (a new team member can understand what is being tested)
- [ ] Test names describe the behavior being tested, not the implementation
- [ ] Tests use the right type (unit for logic, integration for boundaries,
      e2e for flows)

### AI-Generated Test Scrutiny
- [ ] The test does not simply assert the implementation's current output
- [ ] The test would fail if the function returned a wrong-but-consistent value
- [ ] The test covers cases the implementation author might not have considered
- [ ] Contract tests exist for external API calls (verify the real endpoint
      shape)

## Performance Checklist

- [ ] No N+1 queries (database calls inside a loop)
- [ ] No unnecessary allocations in hot paths
- [ ] No synchronous I/O on request-critical paths
- [ ] No unbounded data structures (growing caches, accumulating lists)
- [ ] Database queries have appropriate indexes
- [ ] Expensive operations are batched or cached
- [ ] No premature optimization without a measured bottleneck

## Readability Checklist

- [ ] Variable and function names describe what they do
- [ ] No overly clever code that a new team member can't understand
- [ ] Complex logic has comments explaining WHY, not WHAT
- [ ] The code follows existing conventions in the file/module
- [ ] The diff is readable — no massive formatting changes that obscure the
      actual change
- [ ] No commented-out code left in the diff
- [ ] No debug print statements left in the diff

## Scope Checklist

- [ ] Every changed line traces to the stated goal
- [ ] No "while I'm here" refactoring mixed with behavior changes
- [ ] No speculative abstractions (interfaces with one implementation)
- [ ] No speculative configurability (parameters with one value)
- [ ] No dead code removal that wasn't asked for (mention it, don't delete it)
- [ ] The PR size is reasonable (< 400 lines; if larger, suggest splitting)
- [ ] Refactors and behavior changes are in separate PRs