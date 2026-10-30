#!/usr/bin/env bash
# install.sh: installs the basics on macOS using Homebrew and scripts/Brewfile.
#
#   ./scripts/install.sh           print what would happen
#   ./scripts/install.sh --apply   install
#
# Doesn't use sudo and doesn't change any config files.
# On Linux, follow setup/linux.md instead.
set -euo pipefail

APPLY=0
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for arg in "$@"; do
  case "$arg" in
    --apply)   APPLY=1 ;;
    -h|--help) sed -n '2,8p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *)         echo "Unknown option: $arg (try --help)"; exit 1 ;;
  esac
done

BOLD=$'\033[1m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RESET=$'\033[0m'

say()     { printf '%s\n' "$*"; }
section() { printf '\n%s%s%s\n' "$BOLD" "$*" "$RESET"; }
ok()      { printf '  %sok%s  %s\n' "$GREEN" "$RESET" "$*"; }
warn()    { printf '  %s!!%s  %s\n' "$YELLOW" "$RESET" "$*"; }

if [ "$(uname -s)" != "Darwin" ]; then
  say "This script is for macOS. On Linux, see setup/linux.md; on Windows, use scripts/install.ps1."
  exit 1
fi

[ "$APPLY" -eq 0 ] && warn "Dry run: nothing will be installed. Add --apply to install."

section "Homebrew"
if command -v brew >/dev/null 2>&1; then
  ok "$(brew --version | head -1)"
else
  warn "Homebrew isn't installed. Install it with:"
  say '      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  say "  then run this script again."
  exit 1
fi

section "Packages"
BREWFILE="$ROOT/scripts/Brewfile"
if [ "$APPLY" -eq 1 ]; then
  brew bundle --file="$BREWFILE"
  ok "brew bundle finished"
else
  say "  would run: brew bundle --file=$BREWFILE"
  grep -E '^(brew|cask) ' "$BREWFILE" | awk '{gsub(/"/, "", $2); printf "    %s\n", $2}'
fi

section "Git"
if [ -n "$(git config --global user.email 2>/dev/null)" ]; then
  ok "$(git config --global user.name) <$(git config --global user.email)>"
else
  warn "Name and email not set. Run:"
  say '      git config --global user.name "Your Name"'
  say '      git config --global user.email "you@example.com"'
fi

if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  ok "gh logged in"
else
  warn "gh not logged in yet. Run: gh auth login"
fi

section "Next"
if [ "$APPLY" -eq 0 ]; then
  say "  Run again with --apply to install."
else
  say "  Open a new terminal, run ./scripts/check.sh, then set up an AI agent (setup/ai-agents.md)."
fi
