# Setup · macOS

> This is the machine the configs in this repo came from: Apple M5, 24 GB, macOS 26.6.

**Time:** ~20 minutes on decent Wi-Fi.

---

## 1. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

On Apple Silicon, add it to your PATH (the installer prints this — don't skip it):

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
brew --version
```

---

## 2. The essentials

```bash
brew install git gh node bun python@3.12 openjdk jq ripgrep fd
```

Check:

```bash
git --version && gh --version && node -v && python3.12 --version
```

Or install everything at once with the Brewfile:

```bash
brew bundle --file=./scripts/Brewfile
```

> `scripts/install.sh` wraps this with a **dry-run by default**. See [../scripts/install.sh](../scripts/install.sh).

---

## 3. The shell stack

This is the part people notice. It's not required — it just makes the terminal pleasant.

```bash
brew install starship zoxide fzf eza bat git-delta btop lazygit tmux
brew install --cask ghostty font-jetbrains-mono-nerd-font
```

| Tool | Replaces | Why |
| --- | --- | --- |
| **Ghostty** | Terminal.app | Fast, native, GPU-rendered, config file you can read |
| **starship** | your prompt | Git branch, language versions, timing — one line |
| **zoxide** | `cd` | `z proj` jumps to any directory you've visited |
| **fzf** | `Ctrl+R` | Fuzzy history search, file picker |
| **eza** | `ls` | Icons, git status, tree view |
| **bat** | `cat` | Syntax highlighting + line numbers |
| **git-delta** | `git diff` | Side-by-side, syntax-highlighted diffs |
| **lazygit** | git commands | A TUI for staging/committing/pushing |
| **btop** | Activity Monitor | CPU/RAM/network in the terminal |
| **tmux** | — | Split panes that survive a closed window |

---

## 4. Copy my configs

```bash
# Terminal
mkdir -p ~/.config/ghostty
cp dotfiles/ghostty.config ~/.config/ghostty/config

# Prompt (works on Windows too)
mkdir -p ~/.config
cp dotfiles/starship.toml ~/.config/starship.toml

# Shell — MERGE this, don't overwrite yours
cat dotfiles/.zshrc >> ~/.zshrc

# Git
cp dotfiles/.gitconfig ~/.gitconfig   # then edit name/email inside
```

> ⚠️ **Don't blind-copy `.zshrc`.** If you already have one, open both files and take the blocks you want. Overwriting is how people lose their PATH.
>
> The `.zshrc` sources `~/.config/secrets.env` if it exists. That file is **not** in this repo and never should be. Create your own for API keys:
>
> ```bash
> echo 'export OPENAI_API_KEY="sk-..."' >> ~/.config/secrets.env
> chmod 600 ~/.config/secrets.env
> ```

Reload:

```bash
exec zsh
```

---

## 5. Git identity + GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
gh auth login
```

SSH keys (optional — HTTPS works fine, `gh` handles the credentials):

```bash
ssh-keygen -t ed25519 -C "you@example.com"
gh ssh-key add ~/.ssh/id_ed25519.pub
```

---

## 6. macOS tweaks worth doing

```bash
# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Screenshots without the shadow
defaults write com.apple.screencapture disable-shadow -bool true && killall SystemUIServer
```

Useful apps for a hackathon: **Rectangle** (window snapping — `brew install --cask rectangle`), **Stats** (menu bar CPU/RAM), **AltTab** (better ⌘-Tab).

---

## 7. Test that you can ship

```bash
mkdir -p ~/dev/hello && cd ~/dev/hello
npm create vite@latest . -- --template react
npm install && npm run dev
```

Open <http://localhost:5173>, then:

```bash
npm i -g vercel && vercel
```

---

## 8. Checklist

- [ ] `brew --version` works in a **new** terminal
- [ ] `node -v`, `python3.12 --version`, `git --version`, `gh --version`
- [ ] `gh auth status` logged in
- [ ] Ghostty opens with Catppuccin Mocha and JetBrains Mono
- [ ] Starship prompt shows the current branch
- [ ] `ls` shows icons, `cat` shows line numbers
- [ ] You deployed something once

Common problems → [troubleshooting.md](troubleshooting.md)
