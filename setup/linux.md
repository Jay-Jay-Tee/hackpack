# Linux setup

Written for Ubuntu/Debian (including WSL). Fedora and Arch commands are at the end.

## 1. Packages

```bash
sudo apt update
sudo apt install -y build-essential curl git gh
```

On older Ubuntu releases `gh` isn't in the default repositories; see <https://github.com/cli/cli/blob/trunk/docs/install_linux.md>.

## 2. Node

`fnm` installs Node without sudo and lets you switch versions:

```bash
curl -fsSL https://fnm.vercel.app/install | bash
# open a new terminal
fnm install --lts
node -v
```

## 3. Python

`uv` installs and manages Python versions without touching the system Python:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.12
```

## 4. VS Code

Download the `.deb` from <https://code.visualstudio.com>, or use `sudo snap install code --classic`. On WSL, install VS Code on Windows instead and run `code .` from inside WSL.

## 5. Git and GitHub

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
gh auth login
```

## 6. Next

- [VS Code](vscode.md)
- [AI coding agents](ai-agents.md)

## Fedora and Arch

```bash
# Fedora
sudo dnf install -y git gh nodejs npm python3

# Arch
sudo pacman -S --needed git github-cli nodejs npm python
```

## Checklist

- [ ] `./scripts/check.sh` shows nothing important missing
- [ ] `gh auth status` shows you're logged in
- [ ] An AI agent is installed and logged in
- [ ] You've deployed something once

Problems: [troubleshooting.md](troubleshooting.md)
