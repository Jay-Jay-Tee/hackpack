#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────
#  install.sh — safe, dry-run-first setup for macOS and Linux
#
#  Default behaviour: PRINT what it would do. Changes nothing.
#
#      ./scripts/install.sh              # dry run (safe)
#      ./scripts/install.sh --apply      # actually install
#      ./scripts/install.sh --apply --dotfiles   # also copy configs
#
#  What it does:
#    1. checks for Homebrew (offers install command, doesn't run it silently)
#    2. installs the packages in scripts/Brewfile (macOS)
#    3. optionally copies dotfiles (with .bak backups, never overwrite)
#    4. prints a checklist of what to do next
#
#  It never uses sudo. It never deletes anything.
# ─────────────────────────────────────────────────────────────────────
set -euo pipefail

APPLY=0
DOTFILES=0
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for arg in "$@"; do
  case "$arg" in
    --apply)    APPLY=1 ;;
    --dotfiles) DOTFILES=1 ;;
    -h|--help)
      sed -n '2,25p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) echo "Unknown option: $arg (try --help)"; exit 1 ;;
  esac
done

BOLD=$'\033[1m'; DIM=$'\033[2m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RED=$'\033[31m'; RESET=$'\033[0m'

say()  { printf '%s\n' "$*"; }
section() { printf '\n%s%s%s\n' "$BOLD" "$*" "$RESET"; }
todo() { printf '  %s→%s %s\n' "$DIM" "$RESET" "$*"; }
ok()   { printf '  %s✓%s %s\n' "$GREEN" "$RESET" "$*"; }
skip() { printf '  %s•%s %s\n' "$DIM" "$RESET" "$*"; }
warn() { printf '  %s!%s %s\n' "$YELLOW" "$RESET" "$*"; }

OS="$(uname -s)"
if [ "$APPLY" -eq 0 ]; then
  warn "${BOLD}DRY RUN${RESET} — nothing will be installed. Re-run with --apply to execute."
fi

# ─────────────────────────────────────────────────────────────────────
section "1. Platform"
case "$OS" in
  Darwin) ok "macOS $(sw_vers -productVersion) ($(uname -m))" ;;
  Linux)  ok "Linux $(uname -r)" ;;
  *)      warn "Unsupported platform: $OS — follow setup/windows.md instead."; exit 1 ;;
esac

# ─────────────────────────────────────────────────────────────────────
section "2. Homebrew"
if command -v brew >/dev/null 2>&1; then
  ok "Homebrew $(brew --version | head -1 | awk '{print $2}') at $(command -v brew)"
else
  warn "Homebrew not found."
  say ""
  todo "Install it yourself (I won't pipe curl to bash for you):"
  say "      /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  say ""
  todo "Then add it to PATH (Apple Silicon):"
  say '      echo '\''eval "$(/opt/homebrew/bin/brew shellenv zsh)"'\'' >> ~/.zprofile'
  say ""
  say "  Re-run this script afterwards."
  exit 1
fi

# ─────────────────────────────────────────────────────────────────────
section "3. Packages (scripts/Brewfile)"
BREWFILE="$ROOT/scripts/Brewfile"
if [ ! -f "$BREWFILE" ]; then
  warn "Brewfile not found at $BREWFILE"
else
  if [ "$APPLY" -eq 1 ]; then
    say "  running: brew bundle --file=\"$BREWFILE\""
    brew bundle --file="$BREWFILE"
    ok "brew bundle finished"
  else
    say "  would run: brew bundle --file=\"$BREWFILE\""
    say "  packages:"
    grep -E '^(brew|cask) ' "$BREWFILE" | awk '{printf "    - %s\n", $2}' | head -40
    say "  ${DIM}(run with --apply to install)${RESET}"
  fi
fi

# ─────────────────────────────────────────────────────────────────────
section "4. Git identity"
if git config --global user.email >/dev/null 2>&1; then
  ok "git user: $(git config --global user.name) <$(git config --global user.email)>"
else
  warn "git identity not set. After this script:"
  todo 'git config --global user.name  "Your Name"'
  todo 'git config --global user.email "you@example.com"'
  todo 'git config --global init.defaultBranch main'
  todo 'git config --global pull.rebase true'
fi

# ─────────────────────────────────────────────────────────────────────
section "5. GitHub CLI"
if command -v gh >/dev/null 2>&1; then
  if gh auth status >/dev/null 2>&1; then
    ok "gh logged in as $(gh api user --jq .login 2>/dev/null || echo '?')"
  else
    warn "gh installed but not logged in → run: gh auth login"
  fi
else
  skip "gh not installed yet (comes from the Brewfile)"
fi

# ─────────────────────────────────────────────────────────────────────
section "6. Dotfiles"
if [ "$DOTFILES" -eq 0 ]; then
  skip "skipped (add --dotfiles to copy configs, with .bak backups)"
else
  copy_cfg() { # $1 = source, $2 = destination
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -f "$dst" ]; then
      if [ "$APPLY" -eq 1 ]; then
        cp "$dst" "$dst.bak.$(date +%Y%m%d%H%M%S)"
        cp "$src" "$dst"
        ok "backed up and replaced $dst"
      else
        say "  would back up $dst → $dst.bak.*"
        say "  would copy $src → $dst"
      fi
    else
      if [ "$APPLY" -eq 1 ]; then cp "$src" "$dst"; ok "created $dst"; else say "  would create $dst"; fi
    fi
  }

  copy_cfg "$ROOT/dotfiles/starship.toml"     "$HOME/.config/starship.toml"
  copy_cfg "$ROOT/dotfiles/ghostty.config"    "$HOME/.config/ghostty/config"
  copy_cfg "$ROOT/dotfiles/git-ignore"        "$HOME/.config/git/ignore"

  # .gitconfig: only create if missing — never clobber identity
  if [ -f "$HOME/.gitconfig" ]; then
    warn "$HOME/.gitconfig exists — leaving it alone. Diff it manually:"
    say "      diff \"$ROOT/dotfiles/.gitconfig\" ~/.gitconfig"
  else
    if [ "$APPLY" -eq 1 ]; then
      cp "$ROOT/dotfiles/.gitconfig" "$HOME/.gitconfig"
      ok "created ~/.gitconfig ${DIM}(now set name/email!)${RESET}"
    else
      say "  would create ~/.gitconfig"
    fi
  fi

  # .zshrc: NEVER auto-replace (it holds your PATH)
  warn "~/.zshrc is never auto-replaced. Merge manually:"
  say "      code \"$ROOT/dotfiles/.zshrc\" ~/.zshrc"
fi

# ─────────────────────────────────────────────────────────────────────
section "7. Verify"
if [ -x "$ROOT/scripts/check.sh" ]; then
  if [ "$APPLY" -eq 1 ]; then
    "$ROOT/scripts/check.sh" || true
  else
    say "  would run: scripts/check.sh"
  fi
else
  skip "check.sh not found"
fi

# ─────────────────────────────────────────────────────────────────────
section "Done"
if [ "$APPLY" -eq 0 ]; then
  say "  This was a dry run. To execute:"
  say "      ./scripts/install.sh --apply"
  say "      ./scripts/install.sh --apply --dotfiles"
else
  say "  Open a NEW terminal, then:"
  say "      gh auth login"
  say "      exec zsh"
  say ""
  say "  Then deploy something once: ${DIM}npm create vite@latest && vercel${RESET}"
fi
say ""
