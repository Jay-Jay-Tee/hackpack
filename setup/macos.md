# macOS setup

The configs in this repo come from my MacBook (Apple Silicon). Takes about 20 minutes.

## 1. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The installer prints two lines to add Homebrew to your PATH. Run them:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

## 2. Essentials

```bash
brew install git gh node python@3.12 jq ripgrep fd
```

Optional: `bun`, `uv`, and `openjdk` for Java. For `openjdk`, Homebrew prints a `sudo ln -sfn ...` command so macOS can find it; run that too.

Or install everything I use from the Brewfile:

```bash
brew bundle --file=scripts/Brewfile
```

[`scripts/install.sh`](../scripts/install.sh) does the same thing, but only prints what it would do unless you pass `--apply`.

## 3. Terminal tools (optional)

```bash
brew install starship zoxide fzf eza bat git-delta lazygit btop tmux \
  zsh-autosuggestions zsh-syntax-highlighting zsh-completions
brew install --cask ghostty font-jetbrains-mono-nerd-font
```

- Ghostty: terminal app
- starship: prompt with git branch and language versions
- zoxide: jump to directories you've visited
- fzf: fuzzy history search (`Ctrl+R`) and file picking
- eza, bat: `ls` and `cat` with colours and icons
- git-delta: readable diffs
- lazygit: terminal UI for git
- btop: system monitor
- tmux: split panes and sessions that survive closing the window

## 4. My configs

```bash
mkdir -p ~/.config/ghostty ~/.config/git
cp dotfiles/ghostty.config ~/.config/ghostty/config
cp dotfiles/starship.toml ~/.config/starship.toml
cp dotfiles/git-ignore ~/.config/git/ignore
```

For `.zshrc` and `.gitconfig`, compare them with yours and copy the parts you want rather than overwriting. Your existing `.zshrc` probably sets up your PATH.

```bash
code --diff dotfiles/.zshrc ~/.zshrc
```

My `.zshrc` loads `~/.config/secrets.env` if it exists. That's where I keep API keys, and it isn't in this repo:

```bash
echo 'export OPENAI_API_KEY="..."' >> ~/.config/secrets.env
chmod 600 ~/.config/secrets.env
```

Run `exec zsh` to reload.

## 5. Git and GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
gh auth login
```

`gh` handles HTTPS credentials, so SSH keys are optional.

## 6. macOS settings

```bash
# show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder

# faster key repeat (log out and back in to apply)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```

Apps I use: Rectangle (window snapping), Stats (CPU/RAM in the menu bar), AltTab. All are in the Brewfile.

## 7. Test a deploy

```bash
npm create vite@latest hello -- --template react
cd hello && npm install && npm run dev
```

Open <http://localhost:5173>, then deploy with `npx vercel`.

## Checklist

- [ ] `brew`, `git`, `gh`, `node` and `python3.12` work in a new terminal
- [ ] `gh auth status` shows you're logged in
- [ ] `./scripts/check.sh` shows nothing important missing
- [ ] You've deployed something once

Problems: [troubleshooting.md](troubleshooting.md)
