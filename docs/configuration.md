# Configuration — OpenClaw on Windows 11

This document describes all available configuration options for OpenClaw and how to customize your setup.

---

## Table of Contents

- [Configuration File Location](#configuration-file-location)
- [Interactive Configuration Wizard](#interactive-configuration-wizard)
- [Configuration Options Reference](#configuration-options-reference)
- [Agent Workspace Files](#agent-workspace-files)
- [Environment Variables](#environment-variables)
- [Advanced Configuration](#advanced-configuration)

---

## Configuration File Location

OpenClaw stores its configuration at:

```
%USERPROFILE%\.openclaw\config.json
```

In PowerShell:

```powershell
notepad "$env:USERPROFILE\.openclaw\config.json"
```

---

## Interactive Configuration Wizard

The easiest way to configure OpenClaw is using the built-in wizard:

```powershell
openclaw configure
```

This walks you through all required settings and saves them to `config.json`.

---

## Configuration Options Reference

Below is a complete list of configuration options and their defaults.

### `anthropic`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `apiKey` | string | Your Anthropic API key | *(required)* |
| `model` | string | Claude model to use | `claude-3-5-sonnet-20241022` |
| `maxTokens` | number | Max tokens per response | `4096` |
| `temperature` | number | Sampling temperature (0–1) | `0.7` |

### `discord`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `token` | string | Discord bot token | *(required)* |
| `guildId` | string | Discord server (guild) ID | *(required)* |
| `prefix` | string | Legacy command prefix | `!` |
| `slashCommands` | boolean | Enable slash commands | `true` |

### `gateway`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `port` | number | Port the gateway listens on | `3000` |
| `host` | string | Host to bind | `localhost` |
| `logLevel` | string | Logging verbosity (`debug`, `info`, `warn`, `error`) | `info` |
| `autoRestart` | boolean | Restart on crash | `true` |

### `memory`

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| `enabled` | boolean | Enable persistent memory | `true` |
| `maxEntries` | number | Max memory entries to keep | `500` |
| `summarizeAfter` | number | Summarize memory after N entries | `100` |

---

## Agent Workspace Files

Your agent's identity and memory live in `~/.openclaw/agents/main/`. You can edit these files directly with any text editor.

### `SOUL.md`

Defines your agent's personality, values, and communication style. Edit this to change how your AI assistant presents itself.

### `MEMORY.md`

Stores long-term memories that persist across conversations. OpenClaw automatically manages this file, but you can manually add or remove entries.

### `IDENTITY.md`

Defines the agent's name, role, and backstory. This is injected into every conversation as context.

### `TOOLS.md`

Lists the tools available to the agent (web search, file access, etc.) and their usage guidelines.

### `USER.md`

Stores preferences and information about you (the user) so the agent can personalize responses.

### `HEARTBEAT.md`

Used internally for health and activity monitoring. Generally not edited manually.

---

## Environment Variables

You can override any configuration value with environment variables, which take precedence over `config.json`:

| Variable | Corresponds To |
|----------|---------------|
| `ANTHROPIC_API_KEY` | `anthropic.apiKey` |
| `DISCORD_TOKEN` | `discord.token` |
| `DISCORD_GUILD_ID` | `discord.guildId` |
| `OPENCLAW_PORT` | `gateway.port` |
| `OPENCLAW_LOG_LEVEL` | `gateway.logLevel` |

Set a variable in PowerShell for the current session:

```powershell
$env:ANTHROPIC_API_KEY = "sk-ant-..."
```

Set it permanently via System Properties → Environment Variables.

---

## Advanced Configuration

### Changing the Claude Model

To switch to a different Claude model:

```powershell
openclaw configure
```

Select *Model* and enter the model ID (e.g., `claude-3-opus-20240229`). See [Anthropic's model docs](https://docs.anthropic.com/en/docs/about-claude/models) for available models.

### Running Multiple Agents

OpenClaw supports multiple named agents. Create a new agent workspace:

```powershell
openclaw agent create --name myagent
openclaw configure --agent myagent
openclaw gateway start --agent myagent
```

Agent workspaces are stored at `~/.openclaw/agents/<name>/`.

### Enabling Debug Logging

```powershell
openclaw gateway start --log-level debug
```

Or set `gateway.logLevel` to `"debug"` in `config.json`.
