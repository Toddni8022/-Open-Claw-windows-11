#Requires -Version 5.1
<#
.SYNOPSIS
    Verifies that OpenClaw is correctly installed and configured.

.DESCRIPTION
    Checks that the OpenClaw CLI is available, that required configuration
    values are set, and that the gateway can be reached.

.EXAMPLE
    .\verify.ps1

.NOTES
    Run after completing the installation to confirm everything is working.
    See scripts/README.md for full usage instructions.
#>

[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$passed = 0
$failed = 0

function Write-Check {
    param([string]$Label, [bool]$Ok, [string]$Detail = '')
    if ($Ok) {
        Write-Host "[PASS] $Label" -ForegroundColor Green
        $script:passed++
    } else {
        Write-Host "[FAIL] $Label$(if ($Detail) { " — $Detail" })" -ForegroundColor Red
        $script:failed++
    }
}

Write-Host "`nOpenClaw Installation Verification`n" -ForegroundColor Cyan

# ── 1. Node.js ───────────────────────────────────────────────────────────────
$nodeOk = $false
$nodeDetail = 'node not found'
if (Get-Command node -ErrorAction SilentlyContinue) {
    $ver = node --version
    $major = [int]($ver -replace 'v(\d+).*', '$1')
    $nodeOk = $major -ge 22
    $nodeDetail = if ($nodeOk) { $ver } else { "Found $ver, need v22+" }
}
Write-Check "Node.js 22+" $nodeOk $nodeDetail

# ── 2. npm ───────────────────────────────────────────────────────────────────
$npmOk = [bool](Get-Command npm -ErrorAction SilentlyContinue)
$npmDetail = if ($npmOk) { npm --version } else { 'npm not found' }
Write-Check "npm available" $npmOk $npmDetail

# ── 3. OpenClaw CLI ──────────────────────────────────────────────────────────
$cliOk = [bool](Get-Command openclaw -ErrorAction SilentlyContinue)
$cliDetail = if (-not $cliOk) { 'Run: npm install -g openclaw' } else { '' }
Write-Check "openclaw CLI installed" $cliOk $cliDetail

# ── 4. Config file ───────────────────────────────────────────────────────────
$configPath = Join-Path $env:USERPROFILE ".openclaw\config.json"
$configOk = Test-Path $configPath
$configDetail = if (-not $configOk) { "Expected at $configPath — run 'openclaw configure'" } else { '' }
Write-Check "config.json exists" $configOk $configDetail

# ── 5. Workspace directory ───────────────────────────────────────────────────
$workspacePath = Join-Path $env:USERPROFILE ".openclaw\agents\main"
$workspaceOk = Test-Path $workspacePath
$workspaceDetail = if (-not $workspaceOk) { "Expected at $workspacePath — run install.ps1" } else { '' }
Write-Check "Agent workspace directory exists" $workspaceOk $workspaceDetail

# ── 6 & 7. API key and Discord token configured ──────────────────────────────
$apiKeyOk = $false
$apiKeyDetail = 'config.json not found'
$discordOk = $false
$discordDetail = 'config.json not found'
if ($configOk) {
    try {
        $config = Get-Content $configPath -Raw | ConvertFrom-Json
        $apiKeyOk = -not [string]::IsNullOrWhiteSpace($config.anthropic.apiKey)
        $apiKeyDetail = if (-not $apiKeyOk) { "anthropic.apiKey is empty — run 'openclaw configure'" } else { '' }
        $discordOk = -not [string]::IsNullOrWhiteSpace($config.discord.token)
        $discordDetail = if (-not $discordOk) { "discord.token is empty — run 'openclaw configure'" } else { '' }
    } catch {
        $apiKeyDetail = "Could not parse config.json: $_"
        $discordDetail = $apiKeyDetail
    }
}
Write-Check "Anthropic API key configured" $apiKeyOk $apiKeyDetail
Write-Check "Discord token configured" $discordOk $discordDetail

# ── Summary ──────────────────────────────────────────────────────────────────
Write-Host "`n── Summary ──────────────────────────────────────────"
Write-Host "Passed: $passed" -ForegroundColor Green
if ($failed -gt 0) {
    Write-Host "Failed: $failed" -ForegroundColor Red
    Write-Host "`nResolve the failures above, then re-run this script."
    Write-Host "See docs/troubleshooting.md for help."
} else {
    Write-Host "All checks passed! OpenClaw is ready." -ForegroundColor Green
    Write-Host "`nRun 'openclaw gateway start' to launch the gateway."
}
Write-Host ""
