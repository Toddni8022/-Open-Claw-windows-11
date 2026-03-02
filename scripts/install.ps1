#Requires -Version 5.1
<#
.SYNOPSIS
    Automates the OpenClaw setup on Windows 11.

.DESCRIPTION
    This script checks prerequisites, installs the OpenClaw CLI via npm,
    and creates the default workspace directory structure.

.EXAMPLE
    .\install.ps1

.NOTES
    Run this script in an elevated (Administrator) PowerShell session.
    See scripts/README.md for full usage instructions.
#>

[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Message)
    Write-Host "[OK] $Message" -ForegroundColor Green
}

function Write-Failure {
    param([string]$Message)
    Write-Host "[FAIL] $Message" -ForegroundColor Red
}

# ── 1. Check Windows 11 ──────────────────────────────────────────────────────
Write-Step "Checking operating system..."
$build = [System.Environment]::OSVersion.Version.Build
if ($build -lt 22000) {
    Write-Failure "Windows 11 (Build 22000+) is required. Current build: $build"
    exit 1
}
Write-Success "Windows 11 detected (Build $build)"

# ── 2. Check Node.js ─────────────────────────────────────────────────────────
Write-Step "Checking Node.js..."
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Failure "Node.js is not installed. Download it from https://nodejs.org/ (v22 LTS or later)."
    exit 1
}
$nodeVersion = node --version
$nodeMajor = [int]($nodeVersion -replace 'v(\d+).*', '$1')
if ($nodeMajor -lt 22) {
    Write-Failure "Node.js 22+ is required. Found: $nodeVersion"
    exit 1
}
Write-Success "Node.js $nodeVersion"

# ── 3. Check npm ─────────────────────────────────────────────────────────────
Write-Step "Checking npm..."
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Failure "npm is not available. Reinstall Node.js from https://nodejs.org/"
    exit 1
}
$npmVersion = npm --version
Write-Success "npm $npmVersion"

# ── 4. Install OpenClaw CLI ──────────────────────────────────────────────────
Write-Step "Installing OpenClaw CLI..."
try {
    npm install --global openclaw 2>&1 | Out-Default
    Write-Success "OpenClaw CLI installed"
} catch {
    Write-Failure "npm install failed: $_"
    exit 1
}

# ── 5. Verify CLI is available ───────────────────────────────────────────────
Write-Step "Verifying openclaw CLI..."
if (-not (Get-Command openclaw -ErrorAction SilentlyContinue)) {
    Write-Failure "'openclaw' command not found after install. Ensure npm global bin is in your PATH."
    exit 1
}
Write-Success "openclaw CLI is available"

# ── 6. Create workspace directory ────────────────────────────────────────────
Write-Step "Setting up workspace directory..."
$workspace = Join-Path $env:USERPROFILE ".openclaw\agents\main"
if (-not (Test-Path $workspace)) {
    New-Item -ItemType Directory -Path $workspace -Force | Out-Null
    Write-Success "Created workspace at $workspace"
} else {
    Write-Host "[SKIP] Workspace already exists at $workspace"
}

# ── Done ─────────────────────────────────────────────────────────────────────
Write-Host "`n==> Installation complete!" -ForegroundColor Green
Write-Host "Next step: run 'openclaw configure' to enter your API keys.`n"
