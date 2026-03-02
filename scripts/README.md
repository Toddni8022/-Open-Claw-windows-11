# Scripts — OpenClaw Windows 11 Setup

This directory contains PowerShell automation scripts to simplify the OpenClaw setup process on Windows 11.

---

## Prerequisites

- Windows 11 (Build 22000+)
- PowerShell 5.1 or later (included with Windows 11)
- An elevated (Administrator) PowerShell session for `install.ps1`

---

## Scripts

### `install.ps1` — Automated Setup

Automates the full OpenClaw installation:

1. Checks that Windows 11, Node.js 22+, and npm are available
2. Installs the `openclaw` CLI globally via npm
3. Creates the workspace directory at `~\.openclaw\agents\main\`

**Usage:**

```powershell
# Open PowerShell as Administrator, then:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\install.ps1
```

After the script completes, run `openclaw configure` to enter your API keys.

---

### `verify.ps1` — Installation Verification

Runs a series of checks to confirm that OpenClaw is correctly installed and configured:

| Check | What It Verifies |
|-------|-----------------|
| Node.js 22+ | Node.js is installed and meets the version requirement |
| npm available | npm is available on PATH |
| openclaw CLI installed | The `openclaw` command is accessible |
| config.json exists | The configuration file has been created |
| Agent workspace exists | The agent workspace directory is present |
| Anthropic API key | A non-empty API key is set in config |
| Discord token | A non-empty Discord token is set in config |

**Usage:**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\verify.ps1
```

A summary of passed/failed checks is printed at the end.

---

## Troubleshooting Script Execution

If you receive a script execution error, allow scripts for the current session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

See [docs/troubleshooting.md](../docs/troubleshooting.md) for more help.
