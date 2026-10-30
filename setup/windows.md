# Windows setup

Needs Windows 10 (21H2 or later) or Windows 11. Takes about 20 minutes, mostly downloads.

## 1. winget

Windows 11 includes `winget`. Check with:

```powershell
winget --version
```

If that fails, install "App Installer" from the Microsoft Store and reopen the terminal. Run everything below in a normal (non-admin) terminal.

## 2. Install the basics

```powershell
$apps = @(
  "Microsoft.WindowsTerminal",
  "Microsoft.PowerShell",
  "Git.Git",
  "GitHub.cli",
  "Microsoft.VisualStudioCode",
  "OpenJS.NodeJS.LTS",
  "astral-sh.uv"
)
foreach ($app in $apps) {
  winget install --id $app -e --source winget --accept-package-agreements --accept-source-agreements
}
```

- Windows Terminal and PowerShell 7: a better terminal and shell than the defaults
- Git and GitHub CLI
- VS Code
- Node.js LTS
- uv: installs and manages Python (`uv python install 3.12`)

[`scripts/install.ps1`](../scripts/install.ps1) installs the same list. It only prints what it would do unless you pass `-Apply`.

Close and reopen the terminal so `PATH` updates, then check:

```powershell
git --version
gh --version
code --version
node -v
uv --version
```

## 3. Git and GitHub

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global core.autocrlf true

gh auth login
```

Choose GitHub.com, HTTPS, and log in with the browser. `core.autocrlf true` stops line-ending differences from showing up as changes when your team uses a mix of Windows and macOS.

## 4. Next

- [VS Code](vscode.md)
- [AI coding agents](ai-agents.md)

## Optional

**WSL 2**, if your team is on macOS/Linux or a tool only runs on Linux:

```powershell
wsl --install -d Ubuntu
```

Then follow [linux.md](linux.md) inside Ubuntu. Keep projects in the Linux filesystem (`~/projects`) rather than under `/mnt/c`, which is much slower.

**Long paths**, which some Node projects need (run as Administrator):

```powershell
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
  -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

## Test a deploy

```powershell
npm create vite@latest hello -- --template react
cd hello
npm install
npm run dev
```

Open <http://localhost:5173>, then deploy with `npx vercel`. If you get a public URL that works, you're set.

## Checklist

- [ ] `git`, `gh`, `code`, `node` and `uv` print versions in a new terminal
- [ ] `gh auth status` shows you're logged in
- [ ] An AI agent is installed and logged in
- [ ] You've deployed something once

Problems: [troubleshooting.md](troubleshooting.md)
