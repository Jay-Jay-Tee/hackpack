# ─────────────────────────────────────────────────────────────────────
#  install.ps1 — safe, dry-run-first setup for Windows
#
#  Default behaviour: PRINT what it would do. Changes nothing.
#
#      .\scripts\install.ps1                 # dry run (safe)
#      .\scripts\install.ps1 -Apply          # actually install
#      .\scripts\install.ps1 -Apply -Dotfiles  # also copy configs
#
#  Notes:
#    - Uses winget only. No sudo, no registry hacks.
#    - Close and reopen your terminal afterwards so PATH refreshes.
#    - If scripts are blocked: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
# ─────────────────────────────────────────────────────────────────────
[CmdletBinding()]
param(
  [switch]$Apply,
  [switch]$Dotfiles
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot

function Write-Head($t) { Write-Host ""; Write-Host $t -ForegroundColor Cyan -Bold }
function Write-Ok($t)   { Write-Host "  [ok] $t"   -ForegroundColor Green }
function Write-Skip($t) { Write-Host "  [--] $t"   -ForegroundColor DarkGray }
function Write-Warn($t) { Write-Host "  [!!] $t"   -ForegroundColor Yellow }
function Write-Todo($t) { Write-Host "   ->  $t"   -ForegroundColor DarkGray }

if (-not $Apply) {
  Write-Warn "DRY RUN - nothing will be installed. Re-run with -Apply to execute."
}

# ─────────────────────────────────────────────────────────────────────
Write-Head "1. Platform"
Write-Ok "$([System.Environment]::OSVersion.VersionString)"
Write-Ok "PowerShell $($PSVersionTable.PSVersion)"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Warn "winget not found. Install 'App Installer' from the Microsoft Store, then reopen this terminal."
  exit 1
}
Write-Ok "winget $((winget --version) -replace 'v','')"

# ─────────────────────────────────────────────────────────────────────
Write-Head "2. Packages"

# id => friendly name
$packages = [ordered]@{
  'Microsoft.WindowsTerminal'   = 'Windows Terminal'
  'Microsoft.PowerShell'        = 'PowerShell 7'
  'Git.Git'                     = 'Git'
  'GitHub.cli'                  = 'GitHub CLI'
  'Microsoft.VisualStudioCode'  = 'VS Code'
  'OpenJS.NodeJS.LTS'           = 'Node.js LTS'
  'Schniz.fnm'                  = 'fnm (node versions)'
  'astral-sh.uv'                = 'uv (Python)'
  'Microsoft.OpenJDK.21'        = 'OpenJDK 21'
  'Starship.Starship'           = 'Starship prompt'
  'BurntSushi.ripgrep.MSVC'     = 'ripgrep'
  'sharkdp.bat'                 = 'bat'
  'eza-community.eza'           = 'eza'
  'junegunn.fzf'                = 'fzf'
  'ajeetdsouza.zoxide'          = 'zoxide'
  'dandavison.delta'            = 'git-delta'
  'JesseDuffield.lazygit'       = 'lazygit'
  'jqlang.jq'                   = 'jq'
  'DEVCOM.JetBrainsMonoNerdFont' = 'JetBrains Mono Nerd Font'
}

$installed = @()
try { $installed = (winget list --accept-source-agreements 2>$null) -join "`n" } catch { }

foreach ($id in $packages.Keys) {
  $name = $packages[$id]
  if ($installed -match [regex]::Escape($name.Split(' (')[0])) {
    Write-Skip "$name already installed"
    continue
  }
  if ($Apply) {
    Write-Host "  installing $name ..." -NoNewline
    winget install --id $id -e --source winget --accept-package-agreements --accept-source-agreements --silent 2>&1 | Out-Null
    Write-Host " done" -ForegroundColor Green
  } else {
    Write-Host "  would install: $name  ($id)" -ForegroundColor DarkGray
  }
}

# ─────────────────────────────────────────────────────────────────────
Write-Head "3. Git identity"
$name  = git config --global user.name  2>$null
$email = git config --global user.email 2>$null
if ($email) {
  Write-Ok "git user: $name <$email>"
} else {
  Write-Warn "git identity not set. Run:"
  Write-Todo 'git config --global user.name  "Your Name"'
  Write-Todo 'git config --global user.email "you@example.com"'
  Write-Todo 'git config --global init.defaultBranch main'
  Write-Todo 'git config --global core.autocrlf true'
  Write-Todo 'git config --global pull.rebase true'
}

# ─────────────────────────────────────────────────────────────────────
Write-Head "4. GitHub CLI"
if (Get-Command gh -ErrorAction SilentlyContinue) {
  try {
    gh auth status *> $null
    if ($LASTEXITCODE -eq 0) { Write-Ok "gh logged in" }
    else { Write-Warn "gh installed but not logged in -> run: gh auth login" }
  } catch { Write-Warn "run: gh auth login" }
} else {
  Write-Skip "gh not on PATH yet (reopen terminal after install)"
}

# ─────────────────────────────────────────────────────────────────────
Write-Head "5. Dotfiles"
if (-not $Dotfiles) {
  Write-Skip "skipped (add -Dotfiles to copy configs, with .bak backups)"
} else {
  function Copy-Cfg($src, $dst) {
    $dir = Split-Path -Parent $dst
    if (-not (Test-Path $dir)) {
      if ($Apply) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
      else { Write-Host "  would create $dir" -ForegroundColor DarkGray }
    }
    if (Test-Path $dst) {
      $bak = "$dst.bak.$(Get-Date -Format yyyyMMddHHmmss)"
      if ($Apply) {
        Copy-Item $dst $bak
        Copy-Item $src $dst -Force
        Write-Ok "backed up + replaced $dst"
      } else {
        Write-Host "  would back up $dst -> $bak" -ForegroundColor DarkGray
        Write-Host "  would copy $src -> $dst"    -ForegroundColor DarkGray
      }
    } else {
      if ($Apply) { Copy-Item $src $dst; Write-Ok "created $dst" }
      else { Write-Host "  would create $dst" -ForegroundColor DarkGray }
    }
  }

  $cfg = Join-Path $HOME '.config'
  Copy-Cfg (Join-Path $Root 'dotfiles/starship.toml') (Join-Path $cfg 'starship.toml')

  # Git config: create only if missing
  $gitcfg = Join-Path $HOME '.gitconfig'
  if (Test-Path $gitcfg) {
    Write-Warn "$gitcfg exists - leaving it alone. Compare manually:"
    Write-Todo "code (Join-Path '$Root' 'dotfiles/.gitconfig') $gitcfg"
  } else {
    if ($Apply) {
      Copy-Item (Join-Path $Root 'dotfiles/.gitconfig') $gitcfg
      Write-Ok "created ~/.gitconfig (now set name/email!)"
    } else {
      Write-Host "  would create ~/.gitconfig" -ForegroundColor DarkGray
    }
  }

  Write-Warn "PowerShell profile is never auto-replaced. Add Starship to it manually:"
  Write-Todo "notepad `$PROFILE"
  Write-Todo "add: Invoke-Expression (&starship init powershell)"
}

# ─────────────────────────────────────────────────────────────────────
Write-Head "Done"
if (-not $Apply) {
  Write-Host "  This was a dry run. To execute:" -ForegroundColor White
  Write-Host "      .\scripts\install.ps1 -Apply"            -ForegroundColor Yellow
  Write-Host "      .\scripts\install.ps1 -Apply -Dotfiles"  -ForegroundColor Yellow
} else {
  Write-Host "  CLOSE AND REOPEN your terminal, then:" -ForegroundColor White
  Write-Host "      gh auth login"  -ForegroundColor Yellow
  Write-Host "      node -v; git --version; uv --version" -ForegroundColor Yellow
  Write-Host ""
  Write-Host "  Then deploy something once:" -ForegroundColor White
  Write-Host "      npm create vite@latest hello; cd hello; npm i; npx vercel" -ForegroundColor Yellow
}
Write-Host ""
