# Frequently Asked Questions — OpenClaw on Windows 11

---

## General

### What is OpenClaw?

OpenClaw is an open-source AI gateway that connects large language models (LLMs) like Claude to messaging
platforms such as Discord. It adds persistent memory, tool access (web search, file system, code execution),
and automation workflows.

---

### Do I need coding experience to use OpenClaw?

No. The installation scripts handle everything. You will need to edit a few Markdown files to personalise your
agent, but no programming is required.

---

### Is OpenClaw free?

OpenClaw itself is free and open-source. However, using the Anthropic API (Claude) incurs usage costs based on
the number of tokens processed. Check pricing at <https://www.anthropic.com/pricing>.

---

### Does OpenClaw work on Windows 10?

This guide is specifically written for Windows 11. OpenClaw may work on Windows 10 with Node.js 22+ installed,
but it is untested and unsupported here.

---

## Installation

### The installer script is blocked by my antivirus

Many antivirus programs flag downloaded PowerShell scripts. You can:

1. Temporarily disable real-time protection during installation
2. Add an exception for the OpenClaw installer URL
3. Review the script source at <https://openclaw.ai/install.ps1> before running it

---

### Can I install OpenClaw without running the installer script?

Yes. Install the CLI manually:

```powershell
npm install -g openclaw
openclaw workspace init
openclaw configure
```

---

### What permissions does the installer need?

The installer needs to run as **Administrator** to:

- Install npm global packages
- Create the `~\.openclaw\` workspace directory
- Optionally register a Windows Task Scheduler job for auto-start

---

## Usage

### How do I restart the gateway after a system reboot?

By default, the gateway does not start automatically. To start it manually:

```powershell
openclaw gateway start
```

To register it as a scheduled task that starts at log-in, see the [Troubleshooting guide](troubleshooting.md#bot-went-offline-after-a-system-restart).

---

### Can I use a model other than Claude?

OpenClaw is currently optimised for Anthropic models. Support for other providers (OpenAI, Ollama, etc.) may be
added in future releases. Check the [OpenClaw repository](https://github.com/Toddni8022/open-claw) for updates.

---

### How do I update OpenClaw?

```powershell
npm update -g openclaw
```

---

### How do I uninstall OpenClaw?

```powershell
npm uninstall -g openclaw
Remove-Item -Recurse -Force ~\.openclaw
```

---

## Memory & Privacy

### Where is my data stored?

All data is stored locally in `~\.openclaw\` on your machine. Nothing is sent to external servers except the
messages you send to the Anthropic API for processing.

---

### Is my Anthropic API key safe?

Your API key is stored in `~\.openclaw\config.json`. Ensure this file is not committed to any public repository.
The `.gitignore` in this guide repository already excludes common secrets.

---

### How do I clear the agent's memory?

Open `~\.openclaw\agents\main\MEMORY.md` and delete the entries you want to remove. The gateway picks up
changes on the next restart.

---

## Discord

### Can I run the bot in multiple Discord servers?

Yes — one bot instance can be invited to multiple servers. Use separate agent directories if you want different
personalities or memory per server.

---

### How do I invite the bot to my Discord server?

1. Go to <https://discord.com/developers/applications>
2. Select your application → **OAuth2 → URL Generator**
3. Select the `bot` scope and required permissions
4. Use the generated URL to invite the bot

---

## Contributing

### How can I improve this guide?

See [CONTRIBUTING.md](../CONTRIBUTING.md) for instructions on submitting corrections or new content.

---

### I found a broken step — what should I do?

Open a [bug report issue](https://github.com/Toddni8022/-Open-Claw-windows-11/issues/new?template=bug_report.md)
with details about the error and your environment.
