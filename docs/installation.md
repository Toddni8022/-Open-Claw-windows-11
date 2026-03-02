# Detailed Installation Guide — OpenClaw on Windows 11

This guide walks through every step of installing OpenClaw on Windows 11, from checking prerequisites to starting
the gateway for the first time.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Step 1 — Install Node.js](#step-1--install-nodejs)
- [Step 2 — Obtain API Credentials](#step-2--obtain-api-credentials)
- [Step 3 — Run the OpenClaw Installer](#step-3--run-the-openclaw-installer)
- [Step 4 — Verify the Installation](#step-4--verify-the-installation)
- [Step 5 — Configure Your Agent](#step-5--configure-your-agent)
- [Step 6 — Start the Gateway](#step-6--start-the-gateway)
- [Next Steps](#next-steps)

---

## Prerequisites

| Requirement | Minimum Version | How to Check |
|---|---|---|
| Windows 11 | 22H2 or later | `winver` |
| PowerShell | 5.1 or 7+ | `$PSVersionTable.PSVersion` |
| Node.js | 22.x LTS | `node --version` |
| npm | 10.x | `npm --version` |
| Anthropic API key | — | [console.anthropic.com](https://console.anthropic.com) |
| Discord Bot Token | — | [discord.com/developers](https://discord.com/developers/applications) |

> **Tip:** Run the scripts in [`scripts/install.ps1`](../scripts/install.ps1) to have prerequisites checked automatically.

---

## Step 1 — Install Node.js

1. Open a browser and go to <https://nodejs.org>
2. Download the **LTS** installer (22.x or later)
3. Run the installer and accept all defaults
4. Open a new PowerShell window and confirm:

   ```powershell
   node --version   # should print v22.x.x
   npm --version    # should print 10.x.x
   ```

---

## Step 2 — Obtain API Credentials

### Anthropic API Key

1. Sign in at <https://console.anthropic.com>
2. Go to **API Keys** → **Create Key**
3. Copy and save the key securely (it will not be shown again)

### Discord Bot Token

1. Go to <https://discord.com/developers/applications>
2. Click **New Application**, give it a name (e.g., `HAL`)
3. Navigate to **Bot** → **Reset Token** → copy the token
4. Under **Privileged Gateway Intents**, enable:
   - **Server Members Intent**
   - **Message Content Intent**
5. Go to **OAuth2 → URL Generator**, select `bot` scope and the permissions your bot needs, then use the
   generated URL to invite the bot to your server

---

## Step 3 — Run the OpenClaw Installer

Open PowerShell **as Administrator** and run:

```powershell
iwr -useb https://openclaw.ai/install.ps1 | iex
```

Alternatively, use the local automation script:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\install.ps1
```

The installer will:

- Confirm Node.js is present
- Install the `openclaw` CLI globally via npm
- Create the `~/.openclaw/` workspace directory
- Prompt for your Anthropic API key and Discord bot token

---

## Step 4 — Verify the Installation

```powershell
openclaw --version
openclaw gateway status
```

Or run the dedicated verification script:

```powershell
.\scripts\verify.ps1
```

---

## Step 5 — Configure Your Agent

Edit the files created in `~/.openclaw/agents/main/`:

| File | Purpose |
|---|---|
| `SOUL.md` | Agent personality and values |
| `MEMORY.md` | Persistent memory across sessions |
| `HEARTBEAT.md` | Health and activity monitoring |
| `IDENTITY.md` | Agent identity definition |
| `TOOLS.md` | Available tools and capabilities |
| `USER.md` | Your preferences and profile |

For a full list of configuration options, see [`docs/configuration.md`](configuration.md).

---

## Step 6 — Start the Gateway

```powershell
openclaw gateway start
```

Open the dashboard at <http://localhost:3000> (or the port shown in the output) to confirm the gateway is running.

---

## Next Steps

- Read [`docs/configuration.md`](configuration.md) to customise your agent
- Check [`docs/troubleshooting.md`](troubleshooting.md) if something isn't working
- Browse [`docs/faq.md`](faq.md) for common questions
