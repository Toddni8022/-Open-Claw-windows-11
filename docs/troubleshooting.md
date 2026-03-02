# Troubleshooting — OpenClaw on Windows 11

This document covers common issues encountered when installing or running OpenClaw on Windows 11 and how to resolve them.

---

## Table of Contents

- [Installation Issues](#installation-issues)
- [Gateway Issues](#gateway-issues)
- [Discord Issues](#discord-issues)
- [API Issues](#api-issues)
- [Getting Further Help](#getting-further-help)

---

## Installation Issues

### `iwr` command fails or hangs

**Symptom:** Running the one-liner installer returns an error or never completes.

**Fixes:**

1. Check your internet connection.
2. Confirm PowerShell is running as Administrator.
3. Temporarily disable your antivirus or Windows Defender SmartScreen for the install.
4. Try downloading the script manually and running it:

   ```powershell
   Invoke-WebRequest -Uri https://openclaw.ai/install.ps1 -OutFile install.ps1
   .\install.ps1
   ```

---

### `npm: command not found` or `node is not recognized`

**Symptom:** PowerShell cannot find `npm` or `node` after installing Node.js.

**Fix:**

1. Close and reopen PowerShell to reload the PATH.
2. If still not found, check that Node.js was added to PATH:

   ```powershell
   $env:PATH -split ";" | Select-String "node"
   ```

3. Manually add Node.js to PATH via *System Properties → Environment Variables*.

---

### Execution policy error

**Symptom:** `File cannot be loaded because running scripts is disabled on this system.`

**Fix:**

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Run this command once, then retry the installer.

---

## Gateway Issues

### Gateway fails to start

**Symptom:** `openclaw gateway start` returns an error or exits immediately.

**Fixes:**

1. Check the logs:

   ```powershell
   openclaw logs
   ```

2. Ensure your API keys are configured:

   ```powershell
   openclaw configure
   ```

3. Confirm Node.js is at version 22+:

   ```powershell
   node --version
   ```

---

### Gateway stops unexpectedly

**Symptom:** The gateway runs briefly and then crashes.

**Fixes:**

1. Check logs for error messages: `openclaw logs`
2. Verify your Anthropic API key has available credits.
3. Restart the gateway: `openclaw gateway restart`

---

### Port conflict

**Symptom:** `Error: listen EADDRINUSE :::3000`

**Fix:** Find and stop the conflicting process:

```powershell
netstat -ano | findstr :3000
Stop-Process -Id <PID>
```

---

## Discord Issues

### Bot is offline in Discord

**Symptom:** The bot appears offline even though the gateway is running.

**Fixes:**

1. Verify the Discord bot token is correct: `openclaw configure`
2. Ensure the bot has been invited to your server with the correct permissions.
3. Check for rate limit messages in: `openclaw logs`

---

### Bot does not respond to commands

**Symptom:** The bot is online but does not react to messages or slash commands.

**Fixes:**

1. Ensure slash commands are registered:

   ```powershell
   openclaw discord sync-commands
   ```

2. Verify the bot has *Send Messages* and *Read Message History* permissions in the channel.
3. Check that the correct Guild ID is configured: `openclaw configure`

---

## API Issues

### `401 Unauthorized` from Anthropic

**Symptom:** Logs show `401` or `Authentication error` when calling Claude.

**Fix:** Your API key is invalid or expired. Generate a new key at [console.anthropic.com](https://console.anthropic.com/) and update it:

```powershell
openclaw configure
```

---

### `429 Too Many Requests`

**Symptom:** Logs show rate limit errors.

**Fix:** You have exceeded your Anthropic API quota. Check your usage at [console.anthropic.com](https://console.anthropic.com/) and consider upgrading your plan or reducing request frequency.

---

## Getting Further Help

If none of the above solutions resolve your issue:

1. Check existing issues in this repository: [GitHub Issues](https://github.com/Toddni8022/-Open-Claw-windows-11/issues)
2. Open a new bug report using the [bug report template](../.github/ISSUE_TEMPLATE/bug_report.md).
3. Visit the [OpenClaw official site](https://openclaw.ai) for additional resources.
