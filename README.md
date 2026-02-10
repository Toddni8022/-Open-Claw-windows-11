# Open Claw on Windows 11

A step-by-step guide documenting how I set up [OpenClaw](https://openclaw.ai) — a personal AI assistant platform — on a Windows 11 machine. OpenClaw connects AI models (like Claude) to messaging platforms (Discord, Telegram, Signal, etc.) and gives the AI access to tools, memory, and automation.

## What is OpenClaw?

OpenClaw is an open-source AI gateway that turns large language models into a persistent, tool-using personal assistant. It runs as a background service on your machine and connects to your favorite chat platforms. Key features:

- **Persistent memory** — the AI remembers context across sessions via markdown files
- **Tool access** — file operations, web browsing, shell commands, and more
- **Multi-channel** — Discord, Telegram, Signal, WhatsApp, Slack, and others
- **Cron jobs & automation** — scheduled tasks and background sub-agents
- **Node pairing** — connect phones, tablets, and other devices

## My Setup

| Component | Details |
|-----------|---------|
| **OS** | Windows 11 (Build 26200) |
| **Node.js** | v24.13.0 |
| **Shell** | PowerShell |
| **AI Model** | Claude (Anthropic) |
| **Channel** | Discord |

## Prerequisites

Before you start, make sure you have:

- **Windows 11** (up to date)
- **Node.js 22+** — download from [nodejs.org](https://nodejs.org) or install via `winget install OpenJS.NodeJS`
- **An Anthropic API key** — sign up at [console.anthropic.com](https://console.anthropic.com)
- **A Discord bot** (optional) — if you want to chat via Discord

## Installation Steps

### 1. Install OpenClaw

Open **PowerShell as Administrator** and run:

```powershell
iwr -useb https://openclaw.ai/install.ps1 | iex
```

This script handles everything: it checks for Node.js, installs the OpenClaw CLI globally via npm, and launches the onboarding wizard.

### 2. Run the Onboarding Wizard

```powershell
openclaw onboard --install-daemon
```

The wizard walks you through:
- **API provider setup** — enter your Anthropic API key (or other provider)
- **Model selection** — choose your default model (e.g., Claude Opus, Sonnet)
- **Channel configuration** — connect Discord, Telegram, or other platforms
- **Gateway service** — installs OpenClaw as a background service that starts automatically

### 3. Verify the Gateway is Running

```powershell
openclaw gateway status
```

You should see the gateway reporting as active.

### 4. Open the Dashboard

```powershell
openclaw dashboard
```

This opens the Control UI in your browser at `http://127.0.0.1:18789/` where you can chat with your AI directly — no channel setup needed.

## Connecting Discord

To use OpenClaw through Discord:

1. **Create a Discord Bot** at the [Discord Developer Portal](https://discord.com/developers/applications)
2. **Enable these Privileged Intents:**
   - Message Content Intent
   - Server Members Intent
   - Presence Intent
3. **Invite the bot** to your server with appropriate permissions (Send Messages, Read Messages, etc.)
4. **Add the bot token** during the onboarding wizard (or update config later with `openclaw configure`)
5. **Mention the bot** in any channel — e.g., `@openclaw hello`

## Project Structure

Once installed, OpenClaw creates a workspace at `~/.openclaw/agents/main/` with these key files:

```
~/.openclaw/
├── agents/
│   └── main/           # Your agent's workspace
│       ├── SOUL.md     # Agent personality and behavior
│       ├── USER.md     # Info about you (the human)
│       ├── MEMORY.md   # Long-term curated memory
│       ├── AGENTS.md   # Workspace conventions
│       ├── TOOLS.md    # Local tool notes
│       ├── HEARTBEAT.md # Periodic task checklist
│       └── memory/     # Daily memory logs
│           └── YYYY-MM-DD.md
└── config/             # Gateway configuration
```

## Useful Commands

```powershell
# Check status
openclaw gateway status

# Start/stop/restart the gateway
openclaw gateway start
openclaw gateway stop
openclaw gateway restart

# Open the web dashboard
openclaw dashboard

# Reconfigure settings
openclaw configure

# Update OpenClaw
openclaw update
```

## Tips for Windows 11

- **Run PowerShell as Admin** for the initial install
- The OpenClaw docs recommend WSL2, but it works natively on Windows with PowerShell
- The gateway runs as a background service — it survives terminal closes
- Use `winget` to manage Node.js updates: `winget upgrade OpenJS.NodeJS`

## Resources

- **OpenClaw Docs:** [docs.openclaw.ai](https://docs.openclaw.ai)
- **Source Code:** [github.com/openclaw/openclaw](https://github.com/openclaw/openclaw)
- **Community Discord:** [discord.com/invite/clawd](https://discord.com/invite/clawd)
- **Skill Hub:** [clawhub.com](https://clawhub.com)

## Author

**Todd Nicholas** — [@Toddni8022](https://github.com/Toddni8022)

Built with the help of HAL 😊 (my OpenClaw AI assistant)

## License

MIT
