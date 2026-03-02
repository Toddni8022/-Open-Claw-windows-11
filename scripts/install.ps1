#Requires -Version 5.1
<#
.SYNOPSIS
    Installs OpenClaw on Windows 11.

.DESCRIPTION
    Checks prerequisites (OS version, Node.js), installs the openclaw npm package
    globally, initialises the workspace, and prompts for required credentials.

.EXAMPLE
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
    .\scripts\install.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Step {
    param([string]$Message)
    Write-Host "`n==> $Message" -ForegroundColor Cyan
}

function Write-OK {
    param([string]$Message)
    Write-Host "  [OK] $Message" -ForegroundColor Green
}

function Write-Fail {
    param([string]$Message)
    Write-Host "  [FAIL] $Message" -ForegroundColor Red
}

# ─── 1. Check Windows 11 ────────────────────────────────────────────────────
Write-Step "Checking operating system"
$osVersion = [System.Environment]::OSVersion.Version
if ($osVersion.Major -lt 10 -or ($osVersion.Major -eq 10 -and $osVersion.Build -lt 22000)) {
    Write-Fail "Windows 11 (build 22000+) is required. Detected build: $($osVersion.Build)"
    exit 1
}
Write-OK "Windows 11 detected (build $($osVersion.Build))"

# ─── 2. Check Node.js ───────────────────────────────────────────────────────
Write-Step "Checking Node.js"
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Fail "Node.js is not installed. Download it from https://nodejs.org (LTS 22.x or later)."
    exit 1
}

$nodeVersion = node --version   # e.g. "v22.3.0"
$nodeMajor   = [int]($nodeVersion -replace 'v(\d+)\..*', '$1')
if ($nodeMajor -lt 22) {
    Write-Fail "Node.js 22+ is required. Installed: $nodeVersion"
    exit 1
}
Write-OK "Node.js $nodeVersion"

# ─── 3. Install openclaw ────────────────────────────────────────────────────
Write-Step "Installing openclaw via npm"
npm install -g openclaw
if ($LASTEXITCODE -ne 0) {
    Write-Fail "npm install failed. Check your internet connection and try again."
    exit 1
}
Write-OK "openclaw installed"

# ─── 4. Initialise workspace ────────────────────────────────────────────────
Write-Step "Initialising workspace"
openclaw workspace init
if ($LASTEXITCODE -ne 0) {
    Write-Fail "Workspace initialisation failed."
    exit 1
}
Write-OK "Workspace created at $env:USERPROFILE\.openclaw"

# ─── 5. Collect credentials ─────────────────────────────────────────────────
Write-Step "Configuring credentials"
Write-Host "  You will need your Anthropic API key (https://console.anthropic.com)"
Write-Host "  and your Discord bot token (https://discord.com/developers/applications)."
Write-Host ""
openclaw configure

# ─── Done ───────────────────────────────────────────────────────────────────
Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "Start the gateway with:  openclaw gateway start"
Write-Host "Verify with:             .\scripts\verify.ps1"
