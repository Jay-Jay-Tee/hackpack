# Linux setup

Written for Ubuntu/Debian. Fedora and Arch commands are at the end.

## 1. Packages

```bash
sudo apt update
sudo apt install -y build-essential curl git gh unzip jq \
  ripgrep fd-find fzf zoxide bat tmux python3 python3-venv
```

On older Ubuntu releases `gh` isn't in the default repositories; see <https://github.com/cli/cli/blob/trunk/docs/install_linux.md>.

Debian names two of these differently. To use the usual names:

```bash
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
ln -sf "$(command -v batcat)" ~/.local/bin/bat
```

## 2. Node

`fnm` installs Node without sudo and lets you switch versions:

```bash
curl -fsSL https://fnm.vercel.app/install | bash
# open a new terminal
fnm install --lts
node -v
```

## 3. Python

`uv` installs and manages Python versions, so you don't have to touch the system Python:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.12
```

## 4. Optional tools

```bash
curl -sS https://starship.rs/install.sh | sh   # prompt
sudo apt install -y git-delta                  # Ubuntu 24.04+; otherwise use the .deb from GitHub releases
```

lazygit and eza have install instructions for each distro in their READMEs.

Set your terminal font to a Nerd Font such as JetBrainsMono Nerd Font (<https://www.nerdfonts.com>), otherwise prompt icons show as boxes.

## 5. Shell config

Add to `~/.zshrc` (or `~/.bashrc`, replacing `zsh` with `bash`):

```bash
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
alias cat='bat --style=plain'
# if eza is installed:
alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --git'
```

My [.zshrc](../dotfiles/.zshrc) uses Homebrew paths, so take individual parts rather than the whole file.

## 6. Git and GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
gh auth login
```

## Fedora and Arch

```bash
# Fedora
sudo dnf install -y git gh nodejs npm python3 ripgrep fd-find fzf zoxide bat tmux jq

# Arch
sudo pacman -S --needed git github-cli nodejs npm python ripgrep fd fzf zoxide bat tmux jq
```

## Checklist

- [ ] `git`, `gh`, `node` and `uv` work in a new terminal
- [ ] `gh auth status` shows you're logged in
- [ ] `./scripts/check.sh` shows nothing important missing
- [ ] You've deployed something once

Problems: [troubleshooting.md](troubleshooting.md)
