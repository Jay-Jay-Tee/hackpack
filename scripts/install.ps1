# install.ps1: installs the basics on Windows using winget.
#
#   .\scripts\install.ps1          print what would happen
#   .\scripts\install.ps1 -Apply   install
#
# If scripts are blocked: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
# Reopen the terminal afterwards so PATH updates.
[CmdletBinding()]
param(
  [switch]$Apply
)

$ErrorActionPreference = 'Stop'

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
  'astral-sh.uv'
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
if (Get-Command git -ErrorAction SilentlyContinue) {
  $email = git config --global user.email 2>$null
  if ($email) {
    Ok "$(git config --global user.name) <$email>"
  } else {
    Warn "Name and email not set. Run:"
    Write-Host '      git config --global user.name "Your Name"'
    Write-Host '      git config --global user.email "you@example.com"'
    Write-Host '      git config --global core.autocrlf true'
  }
} else {
  Skip "git not on PATH yet (reopen the terminal after installing)"
}

if (Get-Command gh -ErrorAction SilentlyContinue) {
  gh auth status *> $null
  if ($LASTEXITCODE -eq 0) { Ok "gh logged in" } else { Warn "gh not logged in yet. Run: gh auth login" }
}

Section "Next"
if ($Apply) {
  Write-Host "  Close and reopen the terminal, check: git --version; node -v; uv --version"
  Write-Host "  Then set up an AI agent: setup/ai-agents.md"
} else {
  Write-Host "  Run again with -Apply to install."
}
