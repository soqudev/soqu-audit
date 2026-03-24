<p align="center">
  <img width="1024" height="408" alt="image" src="https://github.com/user-attachments/assets/e534ba1e-0044-45c7-a788-b455733c0052" />
</p>

<p align="center">
  <strong>soqu-audit — Provider-agnostic code review using AI</strong><br>
  Use Claude, Gemini, Codex, OpenCode, Ollama, LM Studio, GitHub Models, or any AI to enforce your coding standards.<br>
  Zero dependencies. Pure Bash. Works everywhere.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-2.8.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License">
  <img src="https://img.shields.io/badge/bash-5.0%2B-orange.svg" alt="Bash">
  <img src="https://img.shields.io/badge/platforms-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg" alt="Platforms">
  <img src="https://img.shields.io/badge/homebrew-tap-FBB040.svg" alt="Homebrew">
  <img src="https://img.shields.io/badge/tests-266%20passing-brightgreen.svg" alt="Tests">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs Welcome">
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

<img width="962" height="941" alt="image" src="https://github.com/user-attachments/assets/c8963dff-6aa5-420c-b58b-1416e81af384" />

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
