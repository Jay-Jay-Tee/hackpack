# macOS setup

Takes about 15 minutes.

## 1. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

The installer prints two lines to add Homebrew to your PATH. Run them. On Apple Silicon they are:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

## 2. Install the basics

```bash
brew install git gh node uv
brew install --cask visual-studio-code
```

`uv` installs and manages Python for you: `uv python install 3.12`.

The same list is in [`scripts/Brewfile`](../scripts/Brewfile). [`scripts/install.sh`](../scripts/install.sh) installs it, but only prints what it would do unless you pass `--apply`.

Check in a new terminal:

```bash
git --version && gh --version && code --version && node -v && uv --version
```

If `code` isn't found, open VS Code, press `Cmd+Shift+P` and run **Shell Command: Install 'code' command in PATH**.

## 3. Git and GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
gh auth login
```

Choose GitHub.com, HTTPS, and log in with the browser.

## 4. Next

- [VS Code](vscode.md)
- [AI coding agents](ai-agents.md)

## Test a deploy

```bash
npm create vite@latest hello -- --template react
cd hello && npm install && npm run dev
```

Open <http://localhost:5173>, then deploy with `npx vercel`.

## Checklist

- [ ] `./scripts/check.sh` shows nothing important missing
- [ ] `gh auth status` shows you're logged in
- [ ] An AI agent is installed and logged in
- [ ] You've deployed something once

If you want to change how the terminal looks, see [extras/](../extras/). It's optional.

Problems: [troubleshooting.md](troubleshooting.md)
