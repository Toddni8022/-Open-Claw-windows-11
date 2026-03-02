# Installation Guide — OpenClaw on Windows 11

This guide walks you through a complete installation of OpenClaw on Windows 11, from prerequisites to first run.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Step 1 — Install Node.js](#step-1--install-nodejs)
- [Step 2 — Run the Installer](#step-2--run-the-installer)
- [Step 3 — Configure API Keys](#step-3--configure-api-keys)
- [Step 4 — Start the Gateway](#step-4--start-the-gateway)
- [Step 5 — Connect to Discord](#step-5--connect-to-discord)
- [Verify the Installation](#verify-the-installation)
- [Uninstallation](#uninstallation)

---

## Prerequisites

Before you begin, make sure you have:

- **Windows 11** (Build 22000 or later). Check via `winver` in the Run dialog.
- **Node.js 22+** — [download from nodejs.org](https://nodejs.org/)
- **An Anthropic API key** — [get one at console.anthropic.com](https://console.anthropic.com/)
- **A Discord bot token** — [create a bot at discord.com/developers](https://discord.com/developers/applications)
- **PowerShell 5.1+** — included with Windows 11

---

## Step 1 — Install Node.js

1. Visit [https://nodejs.org/](https://nodejs.org/) and download the **LTS** installer (v22 or later).
2. Run the installer and accept the defaults.
3. Verify the installation by opening PowerShell and running:

   ```powershell
   node --version
   npm --version
   ```

   Both commands should print version numbers.

---

## Step 2 — Run the Installer

Open **PowerShell as Administrator** (right-click the Start menu → *Windows Terminal (Admin)*) and run:

```powershell
iwr -useb https://openclaw.ai/install.ps1 | iex
```

Alternatively, use the local automation script from this repository:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\install.ps1
```

The installer will:

1. Check that Node.js is installed and meets the version requirement.
2. Download and install the `openclaw` CLI globally via npm.
3. Create the workspace directory at `~/.openclaw/`.
4. Generate default configuration files.

---

## Step 3 — Configure API Keys

After installation, run the interactive configuration wizard:

```powershell
openclaw configure
```

You will be prompted for:

| Setting | Description |
|---------|-------------|
| Anthropic API Key | Your key from [console.anthropic.com](https://console.anthropic.com/) |
| Discord Bot Token | Your bot's token from the Discord Developer Portal |
| Discord Guild ID | The ID of the Discord server to connect to |
| Default Model | The Claude model to use (e.g., `claude-3-5-sonnet-20241022`) |

Configuration is saved to `~/.openclaw/config.json`.

---

## Step 4 — Start the Gateway

```powershell
openclaw gateway start
```

To confirm the gateway is running:

```powershell
openclaw gateway status
```

Expected output:

```
OpenClaw Gateway: RUNNING
Uptime: 0h 0m 12s
Model: claude-3-5-sonnet-20241022
Discord: Connected
```

---

## Step 5 — Connect to Discord

1. In the [Discord Developer Portal](https://discord.com/developers/applications), select your bot.
2. Under **OAuth2 → URL Generator**, grant the following scopes:
   - `bot`
   - `applications.commands`
3. Grant the following bot permissions:
   - Send Messages
   - Read Message History
   - Use Slash Commands
4. Use the generated URL to invite the bot to your server.

Once the bot joins your server and the gateway is running, you can interact with HAL (or your custom agent) directly in Discord.

---

## Verify the Installation

Run the verification script to check that everything is working:

```powershell
.\scripts\verify.ps1
```

Or manually run:

```powershell
openclaw gateway status
```

See [troubleshooting.md](troubleshooting.md) if you encounter any issues.

---

## Uninstallation

To remove OpenClaw:

```powershell
npm uninstall -g openclaw
Remove-Item -Recurse -Force "$env:USERPROFILE\.openclaw"
```

This removes the CLI and all workspace data.
