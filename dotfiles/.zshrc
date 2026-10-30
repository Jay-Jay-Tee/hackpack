# ─────────────────────────────────────────────────────────────────────
#  .zshrc — my shell setup
#
#  Not required for a hackathon. It just removes friction: better ls,
#  better cat, fuzzy history, smart cd, git status in the prompt.
#
#  ⚠️  If you already have a .zshrc, MERGE these blocks. Don't overwrite.
#  ⚠️  Requires: starship, zoxide, fzf, eza, bat, zsh-autosuggestions,
#      zsh-syntax-highlighting, zsh-completions  (see ../scripts/Brewfile)
# ─────────────────────────────────────────────────────────────────────

# ─── Homebrew (Apple Silicon) ────────────────────────────────────────
# Intel Macs: /usr/local/bin/brew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# ─── PATH ────────────────────────────────────────────────────────────
typeset -U path PATH
path=(
  "$HOME/.local/bin"
  "$HOME/.bun/bin"
  "/opt/homebrew/opt/libpq/bin"
  $path
)
export PATH

# ─── Local secrets (NEVER commit this file) ──────────────────────────
[[ -f "$HOME/.config/secrets.env" ]] && source "$HOME/.config/secrets.env"

# ─── Editor / pager ──────────────────────────────────────────────────
export EDITOR="code --wait"
export VISUAL="$EDITOR"
export PAGER="less"
export LESS="-R -F -X"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Catppuccin Mocha"

# ─── History ─────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY       # timestamps
setopt HIST_FCNTL_LOCK        # safe with multiple terminals
setopt HIST_IGNORE_ALL_DUPS   # no duplicates
setopt HIST_IGNORE_SPACE      # commands starting with space aren't saved
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY          # history shared across tabs
setopt AUTO_CD                # `foo` instead of `cd foo`
setopt INTERACTIVE_COMMENTS

# ─── Completion ──────────────────────────────────────────────────────
fpath=("/opt/homebrew/share/zsh-completions" $fpath)
autoload -Uz compinit && compinit -i

zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}── %d ──%f'
zstyle ':completion:*' list-separator '→'

# ─── Keybindings (emacs, but Home/End work) ──────────────────────────
bindkey -e
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# ─── Prompt + smart cd ───────────────────────────────────────────────
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"

# ─── Fuzzy finder ────────────────────────────────────────────────────
[[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
[[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ]] && source /opt/homebrew/opt/fzf/shell/completion.zsh

# ─── Autosuggestions + syntax highlighting (order matters: last) ─────
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─── Aliases: files ──────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias l='ll'
alias cat='bat --style=plain --paging=never'
alias catp='bat'                  # cat WITH line numbers + paging
alias top='btop'

# ─── Aliases: git ────────────────────────────────────────────────────
alias lg='lazygit'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -25'
alias gc='git commit'
alias gco='git checkout'
alias gp='git push'

# ─── Aliases: tmux ───────────────────────────────────────────────────
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# ─── Helpers ─────────────────────────────────────────────────────────
mkcd() { mkdir -p "$1" && cd "$1"; }              # mkdir + cd in one
ports() { lsof -iTCP -sTCP:LISTEN -P -n | sort -k9; }  # what's on :3000?

# ─── Java ────────────────────────────────────────────────────────────
# macOS only. `java_home -v` must match an installed JDK.
if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 21 2>/dev/null)
  [ -n "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"
fi

# ─── Bun ─────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ─── Optional personal banner ────────────────────────────────────────
[[ -f "$HOME/.kali-banner" ]] && source "$HOME/.kali-banner"
