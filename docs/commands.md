# Commands

> 📖 Back to [README](../README.md)

Full command reference for soqu-audit.

---

## Commands Table

| Command                     | Description                                               | Example                         |
| --------------------------- | --------------------------------------------------------- | ------------------------------- |
| `init`                      | Create sample `.soqu-audit` config file                          | `soqu-audit init`                      |
| `install`                   | Install git pre-commit hook (default)                     | `soqu-audit install`                   |
| `install --commit-msg`      | Install git commit-msg hook (for commit message validation) | `soqu-audit install --commit-msg`    |
| `uninstall`                 | Remove git hooks from current repo                        | `soqu-audit uninstall`                 |
| `run`                       | Run code review on staged files                           | `soqu-audit run`                       |
| `run --ci`                  | Run code review on last commit (for CI/CD)                | `soqu-audit run --ci`                  |
| `run --pr-mode`             | Review all files changed in the full PR                   | `soqu-audit run --pr-mode`             |
| `run --pr-mode --diff-only` | PR review with diffs only (faster, cheaper)               | `soqu-audit run --pr-mode --diff-only` |
| `run --no-cache`            | Run review ignoring cache                                 | `soqu-audit run --no-cache`            |
| `config`                    | Display current configuration and status                  | `soqu-audit config`                    |
| `cache status`              | Show cache status for current project                     | `soqu-audit cache status`              |
| `cache clear`               | Clear cache for current project                           | `soqu-audit cache clear`               |
| `cache clear-all`           | Clear all cached data                                     | `soqu-audit cache clear-all`           |
| `help`                      | Show help message with all commands                       | `soqu-audit help`                      |
| `version`                   | Show installed version                                    | `soqu-audit version`                   |

---

## Command Details

### `soqu-audit init`

Creates a sample `.soqu-audit` configuration file in your project root with sensible defaults.

```bash
$ soqu-audit init
✅ Created config file: .soqu-audit
```

---

### `soqu-audit install`

Installs a git hook that automatically runs code review on every commit.

**Default (pre-commit hook):**

```bash
$ soqu-audit install
✅ Installed pre-commit hook: .git/hooks/pre-commit
```

**With commit message validation (commit-msg hook):**

```bash
$ soqu-audit install --commit-msg
✅ Installed commit-msg hook: .git/hooks/commit-msg
```

The `--commit-msg` flag installs a commit-msg hook instead of pre-commit. This allows soqu-audit to also validate your commit message (e.g., conventional commits format, issue references, etc.). The commit message is automatically included in the AI review.

If a hook already exists, soqu-audit will append to it rather than replacing it.

---

### `soqu-audit uninstall`

Removes the git pre-commit hook from your repository.

```bash
$ soqu-audit uninstall
✅ Removed pre-commit hook
```

---

### `soqu-audit run [--no-cache]`

Runs code review on currently staged files. Uses intelligent caching by default to skip unchanged files.

```bash
$ git add src/components/Button.tsx
$ soqu-audit run
# Reviews the staged file (uses cache)

$ soqu-audit run --no-cache
# Forces review of all files, ignoring cache
```

---

### `soqu-audit config`

Shows the current configuration, including where config files are loaded from and all settings.

```bash
$ soqu-audit config

Current Configuration:

Config Files:
  Global:  Not found
  Project: .soqu-audit

Values:
  PROVIDER:          claude
  FILE_PATTERNS:     *.ts,*.tsx,*.js,*.jsx
  EXCLUDE_PATTERNS:  *.test.ts,*.spec.ts
  RULES_FILE:        AGENTS.md
  STRICT_MODE:       true
  TIMEOUT:           300s
  PR_BASE_BRANCH:    auto-detect

Rules File: Found
```

---

## 🚫 Bypass Review

Sometimes you need to commit without review:

```bash
# Skip pre-commit hook entirely
git commit --no-verify -m "wip: work in progress"

# Short form
git commit -n -m "hotfix: urgent fix"
```
