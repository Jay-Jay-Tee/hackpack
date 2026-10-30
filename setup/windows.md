# Setup · Windows

> My main machine is Windows. Everything here is what I'd install on a fresh laptop before a hackathon.

**Time:** ~30 minutes, mostly downloads.
**Requires:** Windows 10 (21H2+) or Windows 11, admin rights.

---

## 1. Start with `winget`

Windows 11 ships with **App Installer** (`winget`). Check it:

```powershell
winget --version
```

If that fails, install "App Installer" from the Microsoft Store, then reopen your terminal.

> **Tip:** run everything below in **Windows Terminal** as a normal user. Only use an Administrator terminal if a step says so.

---

## 2. The essentials

Copy this into PowerShell. It's idempotent — re-running skips what's already installed.

```powershell
$apps = @(
  "Microsoft.WindowsTerminal",
  "Microsoft.PowerShell",
  "Git.Git",
  "GitHub.cli",
  "Microsoft.VisualStudioCode",
  "OpenJS.NodeJS.LTS",
  "Schniz.fnm",
  "astral-sh.uv",
  "Microsoft.OpenJDK.21",
  "Docker.DockerDesktop",
  "Google.Chrome"
)

foreach ($app in $apps) {
  winget install --id $app --source winget --accept-package-agreements --accept-source-agreements --silent
}
```

Then close **and reopen** the terminal so `PATH` refreshes.

Check it worked:

```powershell
git --version
gh --version
node -v
npm -v
uv --version
java -version
```

> Prefer a script? `scripts/install.ps1` does the same thing with a dry-run mode. See [../scripts/install.ps1](../scripts/install.ps1).

### Notes on each

| Tool | Why |
| --- | --- |
| **Windows Terminal** | Tabs, panes, real fonts, sane copy-paste. Essential. |
| **PowerShell 7** | Modern shell. `pwsh`, not the old blue `powershell`. |
| **Git for Windows** | Includes Git Bash, which makes POSIX commands work. |
| **GitHub CLI** | `gh auth login` once, then clone/create/push/PR without passwords. |
| **VS Code** | Editor + integrated terminal. |
| **Node LTS** | Most web stacks. Use `fnm` if you need multiple versions. |
| **uv** | The fastest Python toolchain — installs Python itself, no admin needed. |
| **OpenJDK 21** | Java/Android/Kotlin tracks. Skip if you're not doing Java. |
| **Docker Desktop** | Only if a track needs it. Heavy; skip otherwise. |

---

## 3. The nice-to-haves (my actual shell setup)

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

foreach ($t in $tools) { winget install --id $t -e --accept-package-agreements --accept-source-agreements --silent }
```

These give you: a prompt that shows git status and language versions (**Starship**), fast search (`rg`, `fzf`), better `ls`/`cat` (`eza`, `bat`), smart `cd` (`zoxide`), readable diffs (`delta`), a git TUI (`lazygit`), and a monospace font with icons.

---

## 4. Make the terminal feel right

### Set the font

Windows Terminal → **Settings** → your profile → **Appearance** → Font face: **JetBrainsMono Nerd Font**, size 11–12.

Without a Nerd Font, Starship and `eza` icons render as boxes.

### PowerShell profile

```powershell
notepad $PROFILE
```

If the file doesn't exist:

```powershell
New-Item -Path $PROFILE -Type File -Force
notepad $PROFILE
```

Paste:

```powershell
# ── Prompt ──
Invoke-Expression (&starship init powershell)

# ── Smart cd ──
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ── Aliases ──
function ls { eza --icons --group-directories-first @args }
function ll { eza -lah --icons --group-directories-first --git @args }
function lt { eza --tree --level=2 --icons @args }
function cat { bat --style=plain --paging=never @args }
Set-Alias lg lazygit

# ── Git ──
Set-Alias gs 'git status -sb'
Set-Alias gd 'git diff'
Set-Alias gl 'git log --oneline --graph --decorate -25'

# ── Quality of life ──
$env:EDITOR = "code --wait"
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
```

Reload with `. $PROFILE`.

> My macOS shell config is [../dotfiles/.zshrc](../dotfiles/.zshrc) and the prompt theme is [../dotfiles/starship.toml](../dotfiles/starship.toml) — Starship config is cross-platform, so you can use the same file on Windows at `~/.config/starship.toml`.

---

## 5. Git identity + GitHub auth

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
git config --global core.autocrlf true   # Windows only: fixes line-ending noise

gh auth login
# GitHub.com → HTTPS → login with browser
```

`core.autocrlf true` prevents the "every file changed" diff that ruins Windows/macOS teams.

Verify:

```powershell
gh auth status
```

---

## 6. Optional but genuinely useful

**WSL 2 + Ubuntu** — if your team is on macOS/Linux or a track needs a Linux tool:

```powershell
wsl --install -d Ubuntu
```

Then inside Ubuntu: `sudo apt update && sudo apt install -y build-essential git curl`.

Keep your code **inside** the Linux filesystem (`~/projects`), not `/mnt/c/...` — it's dramatically faster.

**Enable long paths** (some Node projects break without it):

```powershell
# Run as Administrator
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
  -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

**Developer Mode** (symlinks, some build tools):

Settings → System → For developers → Developer Mode **On**.

---

## 7. Test that you can ship

```powershell
mkdir $HOME\projects\hello
cd $HOME\projects\hello

npm create vite@latest . -- --template react
npm install
npm run dev
```

Open <http://localhost:5173>. Then deploy it:

```powershell
npm i -g vercel
vercel
```

If you see your app on a public URL, you're ready.

---

## 8. Pre-hackathon checklist

- [ ] `git`, `gh`, `node`, `npm`, `uv`, `java` all print versions
- [ ] `gh auth status` shows you logged in
- [ ] VS Code opens and its terminal works
- [ ] Nerd Font set in Windows Terminal
- [ ] Starship prompt renders with icons
- [ ] You deployed something to a public URL once
- [ ] You know where `winget` is and can install a package

Common problems → [troubleshooting.md](troubleshooting.md)
