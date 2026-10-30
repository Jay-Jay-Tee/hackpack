# install.ps1: Windows setup using winget.
#
#   .\scripts\install.ps1                    print what would happen
#   .\scripts\install.ps1 -Apply             install packages
#   .\scripts\install.ps1 -Apply -Dotfiles   also copy starship.toml (existing file is backed up)
#
# If scripts are blocked: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
# Reopen the terminal afterwards so PATH updates.
[CmdletBinding()]
param(
  [switch]$Apply,
  [switch]$Dotfiles
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot

function Section($t) { Write-Host ""; Write-Host $t -ForegroundColor Cyan }
function Ok($t)      { Write-Host "  ok  $t" -ForegroundColor Green }
function Skip($t)    { Write-Host "  --  $t" -ForegroundColor DarkGray }
function Warn($t)    { Write-Host "  !!  $t" -ForegroundColor Yellow }

if (-not $Apply) { Warn "Dry run: nothing will be installed. Add -Apply to install." }

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Warn "winget not found. Install 'App Installer' from the Microsoft Store and reopen the terminal."
  exit 1
}

Section "Packages"
$packages = @(
  'Microsoft.WindowsTerminal',
  'Microsoft.PowerShell',
  'Git.Git',
  'GitHub.cli',
  'Microsoft.VisualStudioCode',
  'OpenJS.NodeJS.LTS',
  'astral-sh.uv',
  'Starship.Starship',
  'BurntSushi.ripgrep.MSVC',
  'sharkdp.bat',
  'eza-community.eza',
  'junegunn.fzf',
  'ajeetdsouza.zoxide',
  'dandavison.delta',
  'JesseDuffield.lazygit',
  'jqlang.jq',
  'DEVCOM.JetBrainsMonoNerdFont'
)

foreach ($id in $packages) {
  winget list --id $id -e --accept-source-agreements *> $null
  if ($LASTEXITCODE -eq 0) { Skip "$id already installed"; continue }

  if ($Apply) {
    Write-Host "  installing $id"
    winget install --id $id -e --source winget --accept-package-agreements --accept-source-agreements
  } else {
    Write-Host "  would install $id"
  }
}

Section "Git"
$email = git config --global user.email 2>$null
if ($email) {
  Ok "$(git config --global user.name) <$email>"
} else {
  Warn "Name and email not set. Run:"
  Write-Host '      git config --global user.name "Your Name"'
  Write-Host '      git config --global user.email "you@example.com"'
  Write-Host '      git config --global core.autocrlf true'
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
  gh auth status *> $null
  if ($LASTEXITCODE -eq 0) { Ok "gh logged in" } else { Warn "gh not logged in yet. Run: gh auth login" }
}

Section "Dotfiles"
if (-not $Dotfiles) {
  Skip "skipped (add -Dotfiles to copy starship.toml)"
} else {
  $src = Join-Path $Root 'dotfiles/starship.toml'
  $dst = Join-Path $HOME '.config/starship.toml'
  if (-not $Apply) {
    if (Test-Path $dst) { Write-Host "  would back up $dst and replace it" } else { Write-Host "  would create $dst" }
  } else {
    New-Item -ItemType Directory -Path (Split-Path -Parent $dst) -Force | Out-Null
    if (Test-Path $dst) { Copy-Item $dst "$dst.bak.$(Get-Date -Format yyyyMMddHHmmss)" }
    Copy-Item $src $dst -Force
    Ok "copied $dst"
  }
  Skip "Your PowerShell profile isn't changed. See setup/windows.md for what to add."
}

Section "Next"
if ($Apply) {
  Write-Host "  Close and reopen the terminal, then check: git --version; node -v; uv --version"
} else {
  Write-Host "  Run again with -Apply (and -Dotfiles if you want the Starship config)."
}
