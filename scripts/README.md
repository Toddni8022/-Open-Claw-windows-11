# Scripts — OpenClaw Windows 11 Automation

This directory contains PowerShell scripts that automate common OpenClaw tasks on Windows 11.

---

## Scripts

| Script | Purpose |
|---|---|
| [`install.ps1`](install.ps1) | Checks prerequisites and installs OpenClaw |
| [`verify.ps1`](verify.ps1) | Verifies that OpenClaw is installed and working |

---

## Usage

> **Note:** You may need to set the execution policy before running these scripts.

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Install OpenClaw

```powershell
.\scripts\install.ps1
```

The script will:

1. Check that Windows 11 is detected
2. Verify Node.js 22+ is installed
3. Install the `openclaw` npm package globally
4. Initialise the `~\.openclaw\` workspace
5. Prompt for your Anthropic API key and Discord bot token

### Verify Installation

```powershell
.\scripts\verify.ps1
```

The script will:

1. Confirm `openclaw` is on the PATH
2. Print the installed version
3. Check that the workspace directory exists
4. Attempt to contact the gateway status endpoint

---

## Requirements

- Windows 11
- PowerShell 5.1 or PowerShell 7+
- Node.js 22+ (the install script will remind you if it is missing)
- An internet connection (for downloading the npm package)
