<p align="center">
  <strong>soqu-audit — Provider-agnostic code review using AI</strong><br>
  Use Claude, Gemini, Codex, OpenCode, Ollama, LM Studio, GitHub Models, or any AI to enforce your coding standards.<br>
  Zero dependencies. Pure Bash. Works everywhere.
</p>

<p align="center">
  <sub>Version 2.8.0 · MIT · Bash 5.0+ · macOS · Linux · Windows · Homebrew tap · Tests in CI · PRs welcome</sub>
</p>

<p align="center">
  <a href="#-installation">Installation</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#-providers">Providers</a> •
  <a href="#-commands">Commands</a> •
  <a href="#-documentation">Docs</a>
</p>

---

## Example

See [docs/examples.md](docs/examples.md) for screenshots and walkthroughs.

## 🎯 Why?

You have coding standards. Your team ignores them. Code reviews catch issues too late.

**soqu-audit** runs on every commit, validating staged files against your `AGENTS.md`. Like having a senior developer review every line before it hits the repo.

```
┌─────────────────┐     ┌──────────────┐     ┌─────────────────┐
│   git commit    │ ──▶ │  AI Review   │ ──▶ │  ✅ Pass/Fail   │
│  (staged files) │     │  (any LLM)   │     │  (with details) │
└─────────────────┘     └──────────────┘     └─────────────────┘
```

- 🔌 **Provider agnostic** — Claude, Gemini, Codex, OpenCode, Ollama, LM Studio, GitHub Models
- 📦 **Zero dependencies** — Pure Bash, no Node/Python/Go required
- 🪝 **Git native** — Standard pre-commit hook
- ⚡ **Smart caching** — Skip unchanged files
- 🔍 **PR review mode** — Review full PRs, not just last commit
- 🪟 **Cross-platform** — macOS, Linux, Windows (Git Bash), WSL

---

## 📦 Installation

### Homebrew (recommended)

```bash
brew install soqudev/tap/soqu-audit
```

### Manual

```bash
git clone https://github.com/soqudev/soqu-audit.git
cd soqu-audit
./install.sh
```

### Windows (Git Bash)

```bash
git clone https://github.com/soqudev/soqu-audit.git
cd soqu-audit
bash install.sh
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

> **WSL** is also fully supported — no special configuration needed.

---

## 🚀 Quick Start

```bash
cd ~/your-project
soqu-audit init                # Create .soqu-audit config
soqu-audit install             # Install git hook
# Edit .soqu-audit to set your PROVIDER
# Create AGENTS.md with your coding standards
# Done — every commit gets reviewed 🎉
```

---

## 🔌 Providers

| Provider | Config Value | Installation |
|----------|-------------|-------------|
| **Claude** | `claude` | [claude.ai/code](https://claude.ai/code) |
| **Gemini** | `gemini` | [gemini-cli](https://github.com/google-gemini/gemini-cli) |
| **Codex** | `codex` | `npm i -g @openai/codex` |
| **OpenCode** | `opencode` | [opencode.ai](https://opencode.ai) |
| **Ollama** | `ollama:<model>` | [ollama.ai](https://ollama.ai) |
| **LM Studio** | `lmstudio[:model]` | [lmstudio.ai](https://lmstudio.ai) |
| **GitHub Models** | `github:<model>` | [marketplace/models](https://github.com/marketplace/models) |

> 📖 See [docs/providers.md](docs/providers.md) for detailed examples and setup.

---

## 📋 Commands

| Command | Description |
|---------|------------|
| `soqu-audit init` | Create sample `.soqu-audit` config |
| `soqu-audit install` | Install pre-commit hook |
| `soqu-audit install --commit-msg` | Install commit-msg hook |
| `soqu-audit uninstall` | Remove hooks |
| `soqu-audit run` | Review staged files |
| `soqu-audit run --ci` | Review last commit (CI/CD) |
| `soqu-audit run --pr-mode` | Review full PR changes |
| `soqu-audit run --no-cache` | Review ignoring cache |
| `soqu-audit config` | Show configuration |
| `soqu-audit cache status` | Show cache info |
| `soqu-audit version` | Show version |

> 📖 See [docs/commands.md](docs/commands.md) for detailed usage.

---

## 📚 Documentation

| Topic | Description |
|-------|------------|
| [Configuration](docs/configuration.md) | `.soqu-audit` config file, options, hierarchy, env overrides |
| [Rules File](docs/rules-file.md) | Writing effective `AGENTS.md`, best practices, skill-based approach |
| [Providers](docs/providers.md) | Detailed setup for each AI provider |
| [Commands](docs/commands.md) | Full command reference with examples |
| [Caching](docs/caching.md) | How smart caching works, invalidation, commands |
| [Integrations](docs/integrations.md) | Husky, pre-commit, Lefthook, VS Code, CI/CD |
| [Examples](docs/examples.md) | Real-world walkthrough, project configs |
| [Troubleshooting](docs/troubleshooting.md) | Common issues and fixes |
| [Changelog](docs/changelog.md) | Version history |
| [Contributing](CONTRIBUTING.md) | How to contribute (issue-first workflow) |

---

## 📄 License

MIT © 2024

<p align="center">
  <sub>Built with 🧉 by developers who got tired of repeating the same code review comments</sub>
</p>
