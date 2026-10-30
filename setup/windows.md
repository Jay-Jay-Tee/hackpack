# Windows setup

Needs Windows 10 (21H2 or later) or Windows 11. Takes about 30 minutes, mostly downloads.

## 1. winget

Windows 11 includes `winget`. Check with:

```powershell
winget --version
```

If that fails, install "App Installer" from the Microsoft Store and reopen the terminal. Run everything below in a normal (non-admin) terminal unless a step says otherwise.

## 2. Essentials

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

Optional, depending on what you're building:

```powershell
winget install --id Microsoft.OpenJDK.21 -e      # Java / Android
winget install --id Schniz.fnm -e                # switching Node versions
winget install --id Docker.DockerDesktop -e      # only if a track needs it; it's large
```

Close and reopen the terminal so `PATH` updates, then check:

```powershell
git --version
gh --version
node -v
uv --version
```

`uv` manages Python for you: `uv python install 3.12`, then `uv run`, `uv venv` and so on.

[`scripts/install.ps1`](../scripts/install.ps1) installs the same list. It only prints what it would do unless you pass `-Apply`.

## 3. Terminal tools (optional)

These are what I use. None are required.

```powershell
$tools = @(
  "Starship.Starship",
  "BurntSushi.ripgrep.MSVC",
  "sharkdp.bat",
  "eza-community.eza",
  "junegunn.fzf",
  "ajeetdsouza.zoxide",
  "dandavison.delta",
  "JesseDuffield.lazygit",
  "jqlang.jq",
  "DEVCOM.JetBrainsMonoNerdFont"
)
foreach ($t in $tools) {
  winget install --id $t -e --source winget --accept-package-agreements --accept-source-agreements
}
```

- `starship`: prompt showing the git branch and language versions
- `rg`, `fzf`: fast search and fuzzy finding
- `eza`, `bat`: `ls` and `cat` with colours and icons
- `zoxide`: jump to directories you've visited before
- `delta`: readable git diffs
- `lazygit`: terminal UI for git

### Font

In Windows Terminal, go to Settings → your profile → Appearance and set the font to **JetBrainsMono Nerd Font**. Without a Nerd Font, Starship and eza icons show as boxes.

### PowerShell profile

```powershell
if (-not (Test-Path $PROFILE)) { New-Item -Path $PROFILE -Type File -Force }
notepad $PROFILE
```

Add:

```powershell
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ls and cat are built-in aliases, so remove them before redefining
Remove-Item Alias:ls  -Force -ErrorAction SilentlyContinue
Remove-Item Alias:cat -Force -ErrorAction SilentlyContinue

function ls   { eza --icons --group-directories-first @args }
function ll   { eza -lah --icons --group-directories-first --git @args }
function lt   { eza --tree --level=2 --icons @args }
function cat  { bat --style=plain --paging=never @args }
function gs   { git status -sb @args }
function gd   { git diff @args }
function glog { git log --oneline --graph --decorate -25 @args }
Set-Alias lg lazygit

$env:EDITOR = "code --wait"
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
```

Reload with `. $PROFILE`. The Starship config in [dotfiles/starship.toml](../dotfiles/starship.toml) works on Windows too; copy it to `$HOME\.config\starship.toml`.

## 4. Git and GitHub

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global core.autocrlf true

gh auth login
```

`core.autocrlf true` stops line-ending differences from showing up as changes when your team uses a mix of Windows and macOS.

## 5. Other useful settings

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

**Developer Mode** (Settings → System → For developers) allows symlinks without admin rights.

## 6. Test a deploy

```powershell
npm create vite@latest hello -- --template react
cd hello
npm install
npm run dev
```

Open <http://localhost:5173>, then deploy with `npx vercel`. If you get a public URL that works, you're set.

## Checklist

- [ ] `git`, `gh`, `node`, `npm` and `uv` print versions
- [ ] `gh auth status` shows you're logged in
- [ ] VS Code opens and its terminal works
- [ ] You've deployed something once

Problems: [troubleshooting.md](troubleshooting.md)
