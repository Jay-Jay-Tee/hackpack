#!/usr/bin/env bash
# check.sh: lists which tools are installed. Changes nothing.
set -uo pipefail

GREEN=$'\033[32m'; RED=$'\033[31m'; YELLOW=$'\033[33m'; DIM=$'\033[2m'; BOLD=$'\033[1m'; RESET=$'\033[0m'
missing=0

row() { # $1 name, $2 command, $3 version-arg
  printf '  %-14s' "$1"
  if command -v "$2" >/dev/null 2>&1; then
    printf '%s✓%s %s\n' "$GREEN" "$RESET" "$("$2" "$3" 2>&1 | head -1)"
  else
    printf '%s✗ missing%s\n' "$RED" "$RESET"
    missing=$((missing + 1))
  fi
}

printf '\n%sRequired%s\n' "$BOLD" "$RESET"
row "git"     git     --version
row "gh"      gh      --version
row "node"    node    -v
row "npm"     npm     -v
row "python"  python3 --version

printf '\n%sUseful%s\n' "$BOLD" "$RESET"
row "uv"      uv       --version
row "bun"     bun      --version
row "jq"      jq       --version
row "rg"      rg       --version
row "fzf"     fzf      --version

printf '\n%sOptional%s\n' "$BOLD" "$RESET"
row "starship" starship --version
row "zoxide"   zoxide   --version
row "eza"      eza      --version
row "bat"      bat      --version
row "delta"    delta    --version
row "lazygit"  lazygit  --version

printf '\n%sAccounts%s\n' "$BOLD" "$RESET"
printf '  %-14s' "git user"
if email=$(git config --global user.email 2>/dev/null) && [ -n "$email" ]; then
  printf '%s✓%s %s\n' "$GREEN" "$RESET" "$(git config --global user.name) <$email>"
else
  printf '%s✗ not set%s\n' "$RED" "$RESET"; missing=$((missing + 1))
fi

printf '  %-14s' "github"
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  printf '%s✓%s logged in as %s\n' "$GREEN" "$RESET" "$(gh api user --jq .login 2>/dev/null)"
else
  printf '%s✗ run: gh auth login%s\n' "$RED" "$RESET"
fi

printf '\n'
if [ "$missing" -eq 0 ]; then
  printf '%sNothing missing.%s\n\n' "$GREEN" "$RESET"
else
  printf '%s%d thing(s) missing.%s See setup/ for your OS.\n\n' "$YELLOW" "$missing" "$RESET"
fi
