# OpenClaw — Windows 11 Setup Guide

[![CI — Markdown Lint](https://github.com/Toddni8022/-Open-Claw-windows-11/actions/workflows/ci.yml/badge.svg)](https://github.com/Toddni8022/-Open-Claw-windows-11/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A complete step-by-step guide for installing and running [OpenClaw](https://openclaw.ai) on Windows 11.
OpenClaw is an open-source AI gateway that connects large language models (like Claude) to messaging platforms
with persistent memory, tool access, and automation capabilities.

Built and documented by **Todd Nicholas** with the help of HAL, his personal OpenClaw AI assistant.

---

## Table of Contents

- [What Is OpenClaw?](#what-is-openclaw)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Workspace Structure](#workspace-structure)
- [Documentation](#documentation)
- [Screenshots](#screenshots)
- [Related Projects](#related-projects)
- [Contributing](#contributing)
- [License](#license)

---

## What Is OpenClaw?

OpenClaw acts as a bridge between LLMs and platforms like Discord. It gives your AI assistant:

- **Persistent memory** across sessions
- **Tool access** (web search, file system, code execution)
- **Automation** workflows triggered by messages or schedules

---

## Prerequisites

| Requirement | Minimum Version | How to Check |
|---|---|---|
| Windows 11 | 22H2 or later | `winver` |
| PowerShell | 5.1 or 7+ | `$PSVersionTable.PSVersion` |
| Node.js | 22.x LTS | `node --version` |
| Anthropic API key | — | [console.anthropic.com](https://console.anthropic.com) |
| Discord Bot Token | — | [discord.com/developers](https://discord.com/developers/applications) |

---

## Quick Start

Open PowerShell **as Administrator** and run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
iwr -useb https://openclaw.ai/install.ps1 | iex
```

Or use the local automation script included in this repository:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\install.ps1
```

For a full walkthrough, see [`docs/installation.md`](docs/installation.md).

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

OpenClaw stores your agent's configuration at `~\.openclaw\agents\main\`:

| File | Purpose |
|---|---|
| `SOUL.md` | Agent personality and core values |
| `MEMORY.md` | Long-term memory across sessions |
| `HEARTBEAT.md` | Health and activity monitoring |
| `IDENTITY.md` | Agent identity definition |
| `TOOLS.md` | Available tools and capabilities |
| `USER.md` | User preferences and profile |

---

## Documentation

| Document | Description |
|---|---|
| [`docs/installation.md`](docs/installation.md) | Detailed step-by-step installation guide |
| [`docs/configuration.md`](docs/configuration.md) | Configuration options and customisation |
| [`docs/troubleshooting.md`](docs/troubleshooting.md) | Common issues and fixes |
| [`docs/faq.md`](docs/faq.md) | Frequently asked questions |
| [`scripts/README.md`](scripts/README.md) | How to use the automation scripts |

---

## Screenshots

> Screenshots will be added here as the guide matures. See the [`screenshots/`](screenshots/) directory.

---

## Related Projects

- [open-claw](https://github.com/Toddni8022/open-claw) — HAL's live workspace (Kali Linux version)
- [OpenClaw Official](https://openclaw.ai) — project homepage and documentation

---

## Contributing

Contributions are welcome! Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) for guidelines on how to improve
this guide, fix errors, or suggest new content.

---

## License

This project is licensed under the [MIT License](LICENSE).
