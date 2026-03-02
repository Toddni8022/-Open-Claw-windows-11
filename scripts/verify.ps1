#Requires -Version 5.1
<#
.SYNOPSIS
    Verifies that OpenClaw is installed and the gateway is reachable.

.DESCRIPTION
    Checks that the openclaw CLI is on the PATH, prints the version, confirms
    the workspace directory exists, and queries the gateway status endpoint.

.EXAMPLE
    .\scripts\verify.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$allPassed = $true

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
    $script:allPassed = $false
}

# ─── 1. CLI on PATH ─────────────────────────────────────────────────────────
Write-Step "Checking openclaw CLI"
if (-not (Get-Command openclaw -ErrorAction SilentlyContinue)) {
    Write-Fail "openclaw command not found. Run .\scripts\install.ps1 first."
} else {
    $version = openclaw --version 2>&1
    Write-OK "openclaw $version"
}

# ─── 2. Workspace directory ─────────────────────────────────────────────────
Write-Step "Checking workspace"
$workspace = Join-Path $env:USERPROFILE '.openclaw'
if (Test-Path $workspace) {
    Write-OK "Workspace found at $workspace"
} else {
    Write-Fail "Workspace directory not found at $workspace"
}

# ─── 3. Gateway status ──────────────────────────────────────────────────────
Write-Step "Checking gateway status"
$status = openclaw gateway status 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-OK "Gateway status: $status"
} else {
    Write-Fail "Gateway is not running or returned an error: $status"
    Write-Host "         Start it with: openclaw gateway start" -ForegroundColor Yellow
}

# ─── Summary ────────────────────────────────────────────────────────────────
Write-Host ""
if ($allPassed) {
    Write-Host "All checks passed. OpenClaw is ready to use." -ForegroundColor Green
} else {
    Write-Host "One or more checks failed. See the output above for details." -ForegroundColor Red
    Write-Host "Refer to docs/troubleshooting.md for help." -ForegroundColor Yellow
    exit 1
}
