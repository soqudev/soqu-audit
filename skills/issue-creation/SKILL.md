# Skill: soqu-audit-issue-creation

## Purpose
Standardize issue creation following the issue-first workflow for soqu-audit.

## When to Use
When creating a GitHub issue, reporting a bug, or requesting a feature.

## Workflow

1. Identify issue type: bug or feature
2. Use `gh issue create` with the correct template
3. Fill all required fields completely
4. Wait for `status:approved` label before opening any PR

## Templates

soqu-audit has two templates — NEVER create blank issues (they are disabled):

| Template | Command | Use When |
|----------|---------|----------|
| Bug report | `gh issue create --template bug_report.yml` | Something is broken |
| Feature request | `gh issue create --template feature_request.yml` | Something is missing |

## Bug Report Requirements
Must include:
- soqu-audit version: `soqu-audit version` or `soqu-audit version`
- Shell (bash version: `bash --version`)
- OS (macOS/Linux/distro)
- Provider being used (claude, gemini, codex, ollama)
- Exact reproduction steps
- Expected vs actual behavior

## Feature Request Requirements
Must include:
- Problem description (what can't you do today?)
- Proposed solution
- Affected area: `bin/soqu-audit`, `lib/providers.sh`, `lib/cache.sh`, hooks, CI mode, config

## Issue Lifecycle
```
Created → status:needs-review → status:approved → (open PR)
                              → status:rejected  → (closed, no PR)
```

Never open a PR for an issue without `status:approved`.

## Critical Rules
- ALWAYS use `gh issue create` with a template
- NEVER create blank issues — they are intentionally disabled
- Bug reports MUST include soqu-audit version and provider
- Feature requests MUST describe the problem before the solution
- Issues receive `status:needs-review` automatically on creation
- Wait for maintainer to add `status:approved` before creating a PR

## Cookbook

| If... | Then... | Example |
|-------|---------|---------|
| Reporting a bug | Use bug report template, include version + provider | Hook marker injection fails on zsh |
| Requesting a feature | Use feature request template, describe problem first | Can't use soqu-audit in Docker without TTY |
| Unsure which template | Default to feature request | Improvement to existing behavior |
