#!/usr/bin/env bash
# check.sh: lists which tools are installed. Changes nothing.
set -uo pipefail

GREEN=$'\033[32m'; RED=$'\033[31m'; YELLOW=$'\033[33m'; DIM=$'\033[2m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
missing=0
agents=0

# $1 name, $2 command, $3 version flag, $4 "required" to count it as missing
row() {
  printf '  %-10s' "$1"
  if command -v "$2" >/dev/null 2>&1; then
    printf '%sok%s  %s\n' "$GREEN" "$RESET" "$("$2" "$3" 2>&1 | head -1)"
    return 0
  fi
  if [ "${4:-}" = "required" ]; then
    printf '%smissing%s\n' "$RED" "$RESET"
    missing=$((missing + 1))
  else
    printf '%snot installed%s\n' "$DIM" "$RESET"
  fi
  return 1
}

printf '\n%sRequired%s\n' "$BOLD" "$RESET"
row "git"    git  --version required
row "gh"     gh   --version required
row "code"   code --version required
row "node"   node -v        required
row "npm"    npm  -v        required

printf '\n%sPython%s\n' "$BOLD" "$RESET"
row "python3" python3 --version
row "uv"      uv      --version

printf '\n%sAI agents (one is enough)%s\n' "$BOLD" "$RESET"
row "claude" claude --version && agents=$((agents + 1))
row "codex"  codex  --version && agents=$((agents + 1))
row "gemini" gemini --version && agents=$((agents + 1))
[ "$agents" -eq 0 ] && printf '  %sNo CLI agent found. Copilot in VS Code also works; see setup/ai-agents.md%s\n' "$YELLOW" "$RESET"

printf '\n%sAccounts%s\n' "$BOLD" "$RESET"
printf '  %-10s' "git user"
if email=$(git config --global user.email 2>/dev/null) && [ -n "$email" ]; then
  printf '%sok%s  %s\n' "$GREEN" "$RESET" "$(git config --global user.name) <$email>"
else
  printf '%snot set%s\n' "$RED" "$RESET"; missing=$((missing + 1))
fi

printf '  %-10s' "github"
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  printf '%sok%s  logged in as %s\n' "$GREEN" "$RESET" "$(gh api user --jq .login 2>/dev/null)"
else
  printf '%snot logged in (run: gh auth login)%s\n' "$RED" "$RESET"; missing=$((missing + 1))
fi

printf '\n'
if [ "$missing" -eq 0 ]; then
  printf '%sNothing required is missing.%s\n\n' "$GREEN" "$RESET"
else
  printf '%s%d required item(s) missing.%s See setup/ for your OS.\n\n' "$YELLOW" "$missing" "$RESET"
fi
