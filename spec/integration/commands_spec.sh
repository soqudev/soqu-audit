# shellcheck shell=bash

Describe 'soqu-audit commands'
  # Path to the soqu-audit script
  soqu-audit() {
    "$PROJECT_ROOT/bin/soqu-audit" "$@"
  }

  Describe 'soqu-audit version'
    It 'returns version number'
      When call soqu-audit version
      The status should be success
      The output should include "soqu-audit v"
    End

    It 'accepts --version flag'
      When call soqu-audit --version
      The status should be success
      The output should include "soqu-audit v"
    End

    It 'accepts -v flag'
      When call soqu-audit -v
      The status should be success
      The output should include "soqu-audit v"
    End
  End

  Describe 'soqu-audit help'
    It 'shows help message'
      When call soqu-audit help
      The status should be success
      The output should include "USAGE"
      The output should include "COMMANDS"
    End

    It 'accepts --help flag'
      When call soqu-audit --help
      The status should be success
      The output should include "USAGE"
    End

    It 'shows help when no command given'
      When call soqu-audit
      The status should be success
      The output should include "USAGE"
    End

    It 'lists all commands'
      When call soqu-audit help
      The output should include "run"
      The output should include "install"
      The output should include "uninstall"
      The output should include "config"
      The output should include "init"
      The output should include "cache"
    End

    It 'shows --ci option in help'
      When call soqu-audit help
      The output should include "--ci"
      The output should include "CI mode"
    End
  End

  Describe 'soqu-audit init'
    setup() {
      TEMP_DIR=$(mktemp -d)
      cd "$TEMP_DIR"
    }

    cleanup() {
      cd /
      rm -rf "$TEMP_DIR"
    }

    BeforeEach 'setup'
    AfterEach 'cleanup'

    It 'creates .soqu-audit config file'
      When call soqu-audit init
      The status should be success
      The output should be present
      The path ".soqu-audit" should be file
    End

    It 'config file contains PROVIDER'
      soqu-audit init > /dev/null
      The contents of file ".soqu-audit" should include "PROVIDER"
    End

    It 'config file contains FILE_PATTERNS'
      soqu-audit init > /dev/null
      The contents of file ".soqu-audit" should include "FILE_PATTERNS"
    End

    It 'config file contains EXCLUDE_PATTERNS'
      soqu-audit init > /dev/null
      The contents of file ".soqu-audit" should include "EXCLUDE_PATTERNS"
    End

    It 'config file contains RULES_FILE'
      soqu-audit init > /dev/null
      The contents of file ".soqu-audit" should include "RULES_FILE"
    End

    It 'config file contains STRICT_MODE'
      soqu-audit init > /dev/null
      The contents of file ".soqu-audit" should include "STRICT_MODE"
    End
  End

  Describe 'soqu-audit config'
    setup() {
      TEMP_DIR=$(mktemp -d)
      cd "$TEMP_DIR"
    }

    cleanup() {
      cd /
      rm -rf "$TEMP_DIR"
    }

    BeforeEach 'setup'
    AfterEach 'cleanup'

    It 'shows configuration'
      When call soqu-audit config
      The status should be success
      The output should include "Configuration"
    End

    It 'shows provider not configured when no config'
      When call soqu-audit config
      The output should include "Not configured"
    End

    It 'shows provider when configured'
      echo 'PROVIDER="claude"' > .soqu-audit
      When call soqu-audit config
      The output should include "claude"
    End

    It 'shows rules file status'
      When call soqu-audit config
      The output should include "Rules File"
    End
  End

  Describe 'soqu-audit install'
    setup() {
      TEMP_DIR=$(mktemp -d)
      cd "$TEMP_DIR"
      git init --quiet
    }

    cleanup() {
      cd /
      rm -rf "$TEMP_DIR"
    }

    BeforeEach 'setup'
    AfterEach 'cleanup'

    It 'creates pre-commit hook'
      When call soqu-audit install
      The status should be success
      The output should be present
      The path ".git/hooks/pre-commit" should be file
    End

    It 'hook contains soqu-audit run command'
      soqu-audit install > /dev/null
      The contents of file ".git/hooks/pre-commit" should include "soqu-audit run"
    End

    It 'hook is executable'
      soqu-audit install > /dev/null
      The path ".git/hooks/pre-commit" should be executable
    End

    It 'fails if not in git repo'
      rm -rf .git
      When call soqu-audit install
      The status should be failure
      The output should include "Not a git repository"
    End
  End

  Describe 'soqu-audit uninstall'
    setup() {
      TEMP_DIR=$(mktemp -d)
      cd "$TEMP_DIR"
      git init --quiet
      soqu-audit install > /dev/null
    }

    cleanup() {
      cd /
      rm -rf "$TEMP_DIR"
    }

    BeforeEach 'setup'
    AfterEach 'cleanup'

    It 'removes pre-commit hook'
      When call soqu-audit uninstall
      The status should be success
      The output should be present
      The path ".git/hooks/pre-commit" should not be exist
    End

    It 'succeeds if hook does not exist'
      rm .git/hooks/pre-commit
      When call soqu-audit uninstall
      The status should be success
      The output should be present
    End
  End

  Describe 'soqu-audit cache'
    setup() {
      TEMP_DIR=$(mktemp -d)
      cd "$TEMP_DIR"
      git init --quiet
      echo "rules" > AGENTS.md
      echo 'PROVIDER="claude"' > .soqu-audit
    }

    cleanup() {
      cd /
      rm -rf "$TEMP_DIR"
    }

    BeforeEach 'setup'
    AfterEach 'cleanup'

    Describe 'soqu-audit cache status'
      It 'shows cache status'
        When call soqu-audit cache status
        The status should be success
        The output should include "Cache Status"
      End
    End

    Describe 'soqu-audit cache clear'
      It 'clears project cache'
        When call soqu-audit cache clear
        The status should be success
        The output should include "Cleared cache"
      End
    End

    Describe 'soqu-audit cache clear-all'
      It 'clears all cache'
        When call soqu-audit cache clear-all
        The status should be success
        The output should include "Cleared all cache"
      End
    End

    Describe 'invalid subcommand'
      It 'fails for unknown cache subcommand'
        When call soqu-audit cache invalid
        The status should be failure
        The output should include "Unknown cache command"
      End
    End
  End

  Describe 'unknown command'
    It 'fails with error message'
      When call soqu-audit unknown-command
      The status should be failure
      The output should include "Unknown command"
    End
  End
End
