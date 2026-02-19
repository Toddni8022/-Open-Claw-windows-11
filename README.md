# OpenClaw — Windows 11 Setup Guide

A complete step-by-step guide for installing and running [OpenClaw](https://openclaw.ai) on Windows 11. OpenClaw is an open-source AI gateway that connects large language models (like Claude) to messaging platforms with persistent memory, tool access, and automation capabilities.

Built and documented by **Todd Nicholas** with the help of HAL, his personal OpenClaw AI assistant.

---

## What Is OpenClaw?

OpenClaw acts as a bridge between LLMs and platforms like Discord. It gives your AI assistant:
- **Persistent memory** across sessions
- **Tool access** (web search, file system, code execution)
- **Automation** workflows triggered by messages or schedules

---

## Requirements

- Windows 11
- Node.js 22+
- Anthropic API key
- Discord bot token

---

## Installation

Run this PowerShell one-liner to install OpenClaw:

```powershell
iwr -useb https://openclaw.ai/install.ps1 | iex
```

---

## Usage

```powershell
# Check gateway status
openclaw gateway status

# Start the gateway
openclaw gateway start

# Stop the gateway
openclaw gateway stop

# Open the dashboard
openclaw dashboard

# Configure settings
openclaw configure
```

---

## Workspace Structure

OpenClaw stores your agent's configuration at `~/.openclaw/agents/main/`:

| File | Purpose |
|------|---------|
| `SOUL.md` | Agent personality and core values |
| `MEMORY.md` | Long-term memory across sessions |
| `HEARTBEAT.md` | Health and activity monitoring |
| `IDENTITY.md` | Agent identity definition |
| `TOOLS.md` | Available tools and capabilities |
| `USER.md` | User preferences and profile |

---

## Related

- [open-claw](https://github.com/Toddni8022/open-claw) — HAL's live workspace (Kali Linux version with browser games)
- [OpenClaw Official](https://openclaw.ai)
