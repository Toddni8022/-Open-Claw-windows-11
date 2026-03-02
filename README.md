# OpenClaw — Windows 11 Setup Guide

[![CI](https://github.com/Toddni8022/-Open-Claw-windows-11/actions/workflows/ci.yml/badge.svg)](https://github.com/Toddni8022/-Open-Claw-windows-11/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A complete step-by-step guide for installing and running [OpenClaw](https://openclaw.ai) on Windows 11. OpenClaw is an open-source AI gateway that connects large language models (like Claude) to messaging platforms with persistent memory, tool access, and automation capabilities.

Built and documented by **Todd Nicholas** with the help of HAL, his personal OpenClaw AI assistant.

---

## Table of Contents

- [What Is OpenClaw?](#what-is-openclaw)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Workspace Structure](#workspace-structure)
- [Screenshots](#screenshots)
- [Documentation](#documentation)
- [Scripts](#scripts)
- [Contributing](#contributing)
- [Related](#related)
- [License](#license)

---

## What Is OpenClaw?

OpenClaw acts as a bridge between LLMs and platforms like Discord. It gives your AI assistant:

- **Persistent memory** across sessions
- **Tool access** (web search, file system, code execution)
- **Automation** workflows triggered by messages or schedules

---

## Prerequisites

Before installing OpenClaw, ensure your system meets the following requirements:

**Operating System**

- Windows 11 (Build 22000 or later)

**Hardware**

- 4 GB RAM minimum (8 GB recommended)
- 2 GB free disk space

**Software**

- [Node.js](https://nodejs.org/) 22 or later
- [Git](https://git-scm.com/) (optional, for cloning configs)
- PowerShell 5.1 or later (included with Windows 11)

**Accounts & API Keys**

- [Anthropic](https://console.anthropic.com/) API key (for Claude)
- [Discord](https://discord.com/developers/applications) bot token (for Discord integration)

---

## Quick Start

1. Open **PowerShell as Administrator**.
2. Run the automated install script:

   ```powershell
   iwr -useb https://openclaw.ai/install.ps1 | iex
   ```

3. Follow the on-screen prompts to enter your API keys.
4. Verify the installation:

   ```powershell
   openclaw gateway status
   ```

For a detailed walkthrough, see [docs/installation.md](docs/installation.md).

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

## Screenshots

> Screenshots will be added here as the guide evolves. See the [`screenshots/`](screenshots/) directory.

---

## Documentation

| Document | Description |
|----------|-------------|
| [Installation Guide](docs/installation.md) | Detailed step-by-step installation instructions |
| [Configuration](docs/configuration.md) | Configuration options and customization |
| [Troubleshooting](docs/troubleshooting.md) | Common issues and solutions |
| [FAQ](docs/faq.md) | Frequently asked questions |

---

## Scripts

Automation scripts are available in the [`scripts/`](scripts/) directory:

| Script | Description |
|--------|-------------|
| [`install.ps1`](scripts/install.ps1) | Automates the full OpenClaw setup on Windows 11 |
| [`verify.ps1`](scripts/verify.ps1) | Verifies the installation is working correctly |

See [scripts/README.md](scripts/README.md) for usage instructions.

---

## Contributing

Contributions are welcome! Whether you spotted a mistake, want to add clarity, or have a tip that helped you — please share it.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to get involved.

---

## Related

- [open-claw](https://github.com/Toddni8022/open-claw) — HAL's live workspace (Kali Linux version with browser games)
- [OpenClaw Official](https://openclaw.ai)

---

## License

This project is licensed under the [MIT License](LICENSE).
