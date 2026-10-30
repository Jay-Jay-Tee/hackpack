# Setup · Linux

> Tested on Ubuntu/Debian. Fedora/Arch notes at the bottom.

**Time:** ~15 minutes.

---

## 1. Base packages

```bash
sudo apt update
sudo apt install -y \
  build-essential curl wget git gh unzip zip jq \
  ripgrep fd-find fzf zoxide bat \
  python3 python3-pip python3-venv \
  tmux
```

Debian renames a couple of these — make them behave like everyone else's docs:

```bash
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
ln -sf "$(command -v batcat)" ~/.local/bin/bat
```

---

## 2. Node

Use `fnm` (fast, no sudo, version switching):

```bash
curl -fsSL https://fnm.vercel.app/install | bash
exec zsh          # or: source ~/.bashrc
fnm install --lts
fnm default lts-latest
node -v
```

If you prefer the system package manager: `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install -y nodejs`.

## 3. Python

Use `uv` — it installs Python versions itself, so you never fight the system Python:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.12
uv --version
```

## 4. The nice-to-haves

```bash
# Starship prompt
curl -sS https://starship.rs/install.sh | sh

# git-delta (readable diffs)
sudo apt install -y git-delta     # or grab a .deb from GitHub releases

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit && sudo install lazygit /usr/local/bin && rm lazygit lazygit.tar.gz
```

Terminal: most distros have a good one already (GNOME Terminal, Konsole, Tilix). **Ghostty** and **WezTerm** have Linux builds if you want the same feel as macOS. Install a Nerd Font (e.g. `JetBrainsMono Nerd Font`) from <https://nerdfonts.com> and set it in your terminal's preferences — otherwise prompt icons break.

---

## 5. Shell config

```bash
# ~/.zshrc or ~/.bashrc
eval "$(starship init zsh)"         # bash: starship init bash
eval "$(zoxide init zsh)"           # bash: zoxide init bash
alias ls='eza --icons --group-directories-first'   # if eza is installed
alias ll='eza -lah --icons --git'
alias cat='bat --style=plain'
```

My zsh config is [../dotfiles/.zshrc](../dotfiles/.zshrc) — it's macOS-flavoured (Homebrew paths), so take the blocks, not the file.

---

## 6. Git + GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
gh auth login
```

---

## 7. Fedora / Arch

```bash
# Fedora
sudo dnf install -y git gh nodejs npm python3 python3-pip ripgrep fd-find fzf zoxide bat tmux jq

# Arch
sudo pacman -S --needed git github-cli nodejs npm python ripgrep fd fzf zoxide bat tmux jq
```

Everything else is the same.

---

## 8. Checklist

- [ ] `git`, `gh`, `node`, `npm`, `uv` all work
- [ ] `gh auth status` logged in
- [ ] Terminal font is a Nerd Font
- [ ] Prompt shows the git branch
- [ ] You deployed something once

Common problems → [troubleshooting.md](troubleshooting.md)
