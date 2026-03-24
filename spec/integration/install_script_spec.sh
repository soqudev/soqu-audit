# shellcheck shell=bash

Describe 'install.sh'
  setup() {
    TEMP_DIR=$(mktemp -d)
    FAKE_INSTALL_DIR="$TEMP_DIR/bin"
    mkdir -p "$FAKE_INSTALL_DIR"
  }

  cleanup() {
    cd /
    rm -rf "$TEMP_DIR"
  }

  BeforeEach 'setup'
  AfterEach 'cleanup'

  Describe 'copies all required lib files'
    It 'copies providers.sh to lib directory'
      HOME="$TEMP_DIR" INSTALL_DIR="$FAKE_INSTALL_DIR" \
        bash -c 'echo "y" | bash "$1/install.sh"' _ "$PROJECT_ROOT" 2>/dev/null
      case "$(uname -s)" in
        MINGW*|MSYS*|CYGWIN*) expected="$TEMP_DIR/bin/lib/soqu-audit/providers.sh" ;;
        *)                     expected="$TEMP_DIR/.local/share/soqu-audit/lib/providers.sh" ;;
      esac
      The path "$expected" should be file
    End

    It 'copies cache.sh to lib directory'
      HOME="$TEMP_DIR" INSTALL_DIR="$FAKE_INSTALL_DIR" \
        bash -c 'echo "y" | bash "$1/install.sh"' _ "$PROJECT_ROOT" 2>/dev/null
      case "$(uname -s)" in
        MINGW*|MSYS*|CYGWIN*) expected="$TEMP_DIR/bin/lib/soqu-audit/cache.sh" ;;
        *)                     expected="$TEMP_DIR/.local/share/soqu-audit/lib/cache.sh" ;;
      esac
      The path "$expected" should be file
    End

    It 'copies pr_mode.sh to lib directory'
      HOME="$TEMP_DIR" INSTALL_DIR="$FAKE_INSTALL_DIR" \
        bash -c 'echo "y" | bash "$1/install.sh"' _ "$PROJECT_ROOT" 2>/dev/null
      case "$(uname -s)" in
        MINGW*|MSYS*|CYGWIN*) expected="$TEMP_DIR/bin/lib/soqu-audit/pr_mode.sh" ;;
        *)                     expected="$TEMP_DIR/.local/share/soqu-audit/lib/pr_mode.sh" ;;
      esac
      The path "$expected" should be file
    End
  End
End
