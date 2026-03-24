# Skill: soqu-audit-testing-coverage

## Purpose
Ensure test coverage for all behavior changes in soqu-audit.

## When to Use
When implementing behavior changes in any script (`bin/soqu-audit`, `lib/*.sh`).

## Framework
ShellSpec — https://shellspec.info/

## Test Structure

```
spec/
├── unit/           # Isolated function tests (no external calls)
│   ├── cache_spec.sh
│   └── providers_spec.sh
├── integration/    # Full command + hook + CI mode tests
│   └── commands_spec.sh
├── support/        # Shared helpers, fixtures
└── spec_helper.sh  # Global setup
```

**Unit tests** → test functions in `lib/cache.sh`, `lib/providers.sh` in isolation.
**Integration tests** → test `soqu-audit` CLI commands, hook injection, CI mode end-to-end.

## Running Tests

| Command | What It Does |
|---------|-------------|
| `make test` | Run all tests |
| `shellspec spec/unit` | Unit tests only |
| `shellspec spec/integration/commands_spec.sh` | Integration tests only |
| `shellspec spec/unit/cache_spec.sh:65` | Single test at line 65 |
| `shellspec --format documentation` | Verbose output with names |

## Critical Rules
- Every feature or bug fix MUST include tests — no exceptions
- Use `setup`/`cleanup` blocks with temp dirs for test isolation
- Mock external commands (providers, git) in unit tests — never call real providers
- Ollama tests skip automatically when no server is running (use `skip_if_no_ollama`)
- Run `make test` before every push

## ShellSpec Patterns

```bash
# Basic structure
Describe 'function_name'
  setup() { ... }
  cleanup() { ... }

  It 'does something'
    When call function_name arg
    The status should be success
    The output should include "expected"
  End
End

# Custom assertion (use Assert for comparisons, not bare The status)
It 'returns a count less than 10'
  When call get_count
  The output should be present
  Assert [ "$(get_count)" -lt 10 ]
End

# Skip conditionally
skip_if_no_ollama() {
  ! curl -s http://localhost:11434/api/tags >/dev/null 2>&1 && \
    skip "Ollama not running"
}
```

## Gotchas
- `The status should be success` ONLY works after `When run` or `When call`
- Use `Assert [ "$a" -lt "$b" ]` for numeric comparisons, not `The value`
- Temp dirs must be created in `setup` and removed in `cleanup`
- Source scripts with absolute paths or via `$SHELLSPEC_ROOT`

## Cookbook

| If... | Then... |
|-------|---------|
| Adding a new lib function | Add unit test in `spec/unit/` |
| Adding a new CLI flag | Add integration test in `spec/integration/` |
| Fixing a cache bug | Add regression test at the failing case |
| Changing hook behavior | Add/update integration test for hook injection |
| Adding a provider | Add unit mock test + integration skip test |
