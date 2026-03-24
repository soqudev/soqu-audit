#!/usr/bin/env bash

# ============================================================================
# soqu-audit — Uninstaller
# ============================================================================
# Removes the soqu-audit / soqu-audit CLI tools from your system
# ============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# OS detection
detect_os() {
  case "$(uname -s)" in
    Darwin*)          echo "macos" ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *)                echo "linux" ;;
  esac
}
GGA_OS=$(detect_os)

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}${BOLD}  soqu-audit uninstaller${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Find and remove binaries (soqu-audit primary; soqu-audit legacy alias)
LOCATIONS=(
  "/usr/local/bin/soqu-audit"
  "/usr/local/bin/soqu-audit"
  "$HOME/.local/bin/soqu-audit"
  "$HOME/.local/bin/soqu-audit"
  "$HOME/bin/soqu-audit"
  "$HOME/bin/soqu-audit"
)

FOUND=false
for loc in "${LOCATIONS[@]}"; do
  if [[ -f "$loc" ]]; then
    rm "$loc"
    echo -e "${GREEN}✅ Removed: $loc${NC}"
    FOUND=true
  fi
done

# Installed library directories (current and legacy layouts)
for lib_dir in "$HOME/.local/share/soqu-audit" "$HOME/bin/lib/soqu-audit" "$HOME/.local/share/soqu-audit" "$HOME/bin/lib/soqu-audit"; do
  if [[ -d "$lib_dir" ]]; then
    rm -rf "$lib_dir"
    echo -e "${GREEN}✅ Removed: $lib_dir${NC}"
    FOUND=true
  fi
done

# Remove global config (optional)
GLOBAL_CONFIG="$HOME/.config/soqu-audit"
if [[ -d "$GLOBAL_CONFIG" ]]; then
  echo ""
  read -p "Remove global config ($GLOBAL_CONFIG)? (y/N): " confirm
  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    rm -rf "$GLOBAL_CONFIG"
    echo -e "${GREEN}✅ Removed: $GLOBAL_CONFIG${NC}"
  else
    echo -e "${YELLOW}⚠️  Kept global config${NC}"
  fi
fi

if [[ "$FOUND" == false ]]; then
  echo -e "${YELLOW}⚠️  soqu-audit / soqu-audit was not found on this system${NC}"
fi

echo ""
echo -e "${BOLD}Note:${NC} Project-specific configs (.soqu-audit) and git hooks"
echo "      were not removed. Remove them manually if needed."
echo ""
