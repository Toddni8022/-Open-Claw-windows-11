# Frequently Asked Questions — OpenClaw on Windows 11

---

## General

### What is OpenClaw?

OpenClaw is an open-source AI gateway that connects large language models (like Anthropic's Claude) to platforms such as Discord. It provides persistent memory, tool access, and automation capabilities for your AI assistant.

### Is OpenClaw free to use?

OpenClaw itself is open-source and free. However, you will need an [Anthropic API key](https://console.anthropic.com/), which is billed based on usage. Discord is free.

### Why is this guide focused on Windows 11?

The official OpenClaw documentation is primarily written for Linux. This guide exists to make setup accessible for Windows 11 users, with Windows-specific instructions, scripts, and troubleshooting tips.

### Who maintains this guide?

This guide is maintained by **Todd Nicholas** with the assistance of HAL, an OpenClaw-powered AI assistant.

---

## Installation

### Do I need to run PowerShell as Administrator?

Yes — the installation script needs elevated permissions to install Node.js packages globally and configure system paths. Right-click the Start menu and select *Windows Terminal (Admin)* or *PowerShell (Admin)*.

### Can I install OpenClaw without the one-liner script?

Yes. See [docs/installation.md](installation.md) for the full manual installation walkthrough and the [`scripts/install.ps1`](../scripts/install.ps1) automation script.

### What Node.js version do I need?

Node.js 22 or later is required. OpenClaw uses modern JavaScript features that are not supported in older versions. Download the latest LTS from [nodejs.org](https://nodejs.org/).

### Does OpenClaw work on Windows 10?

This guide is tested and documented for Windows 11 only. OpenClaw may work on Windows 10, but you may encounter differences not covered here.

---

## Configuration

### Where is the configuration file stored?

At `%USERPROFILE%\.openclaw\config.json` (e.g., `C:\Users\YourName\.openclaw\config.json`).

### How do I change the AI model?

Run `openclaw configure` and select the *Model* option. Available models are listed in the [Anthropic documentation](https://docs.anthropic.com/en/docs/about-claude/models).

### Can I run OpenClaw with a different LLM?

Currently, OpenClaw is designed to work with Anthropic's Claude models. Support for other providers may be added in future versions of OpenClaw.

---

## Discord Integration

### How do I create a Discord bot?

1. Go to [discord.com/developers/applications](https://discord.com/developers/applications).
2. Click *New Application* and give it a name.
3. Under *Bot*, click *Add Bot* and copy the token.
4. Use the OAuth2 URL Generator to create an invite link with the required permissions.

See [docs/installation.md#step-5--connect-to-discord](installation.md#step-5--connect-to-discord) for full details.

### What permissions does the bot need?

At minimum:

- Send Messages
- Read Message History
- Use Slash Commands

Grant these in the Discord Developer Portal when generating the invite URL.

---

## Troubleshooting

### The bot is online but not responding — what do I do?

See the [Troubleshooting guide](troubleshooting.md#discord-issues) for a checklist of common Discord issues.

### The gateway crashes at startup — what do I check?

Run `openclaw logs` to see the error output. Common causes are an invalid API key, a port conflict, or an outdated Node.js version. See the [Troubleshooting guide](troubleshooting.md#gateway-issues).

---

## Contributing

### How can I improve this guide?

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines. You can:

- Fix typos or outdated instructions
- Add tips from your own setup experience
- Translate sections into other languages
- Add screenshots to the `screenshots/` directory

### I found a mistake — how do I report it?

Open a [bug report](https://github.com/Toddni8022/-Open-Claw-windows-11/issues/new?template=bug_report.md) on GitHub.
