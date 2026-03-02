# Troubleshooting — OpenClaw on Windows 11

This page covers the most common problems encountered when installing or running OpenClaw on Windows 11.

---

## Table of Contents

- [Installation Issues](#installation-issues)
- [Gateway Won't Start](#gateway-wont-start)
- [Discord Bot Not Responding](#discord-bot-not-responding)
- [API / Authentication Errors](#api--authentication-errors)
- [Memory / Workspace Issues](#memory--workspace-issues)
- [Still Stuck?](#still-stuck)

---

## Installation Issues

### `iwr` or `iex` is not recognised

**Cause:** Execution policy is blocking the installer script.

**Fix:**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
iwr -useb https://openclaw.ai/install.ps1 | iex
```

---

### `openclaw` command not found after installation

**Cause:** npm global binaries are not on your PATH.

**Fix:**

1. Find the npm global bin directory:

   ```powershell
   npm config get prefix
   ```

2. Add the `bin` sub-folder to your PATH:

   ```powershell
   $env:PATH += ";$(npm config get prefix)"
   ```

3. Restart PowerShell and try again.

---

### Node.js version mismatch

**Cause:** OpenClaw requires Node.js 22+.

**Fix:**

```powershell
node --version   # must be 22.x.x or higher
```

Download the latest LTS from <https://nodejs.org> and reinstall.

---

## Gateway Won't Start

### Port already in use

**Cause:** Another process is listening on the gateway port (default 3000).

**Fix:**

```powershell
# Find the process using port 3000
netstat -ano | findstr :3000

# Kill it (replace <PID> with the actual process ID)
taskkill /PID <PID> /F
```

Then start the gateway again:

```powershell
openclaw gateway start
```

---

### Gateway crashes immediately

**Cause:** Missing or invalid credentials in the workspace config.

**Fix:**

1. Open `~\.openclaw\config.json`
2. Verify `anthropicApiKey` and `discordToken` are set correctly
3. Re-run `openclaw configure` to reset credentials

---

## Discord Bot Not Responding

### Bot is online but ignores messages

**Cause:** The **Message Content Intent** is not enabled for the bot.

**Fix:**

1. Go to <https://discord.com/developers/applications>
2. Select your application → **Bot**
3. Enable **Message Content Intent**
4. Restart the gateway

---

### Bot went offline after a system restart

**Cause:** The gateway is not configured to start on boot.

**Fix:** Register OpenClaw as a Windows Task Scheduler job:

```powershell
$action  = New-ScheduledTaskAction -Execute "openclaw" -Argument "gateway start"
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -TaskName "OpenClaw Gateway" -Action $action -Trigger $trigger -RunLevel Highest
```

---

## API / Authentication Errors

### `401 Unauthorized` from Anthropic

**Cause:** Invalid or expired API key.

**Fix:**

1. Generate a new key at <https://console.anthropic.com>
2. Update it in your config:

   ```powershell
   openclaw configure
   ```

---

### Rate limit errors (`429 Too Many Requests`)

**Cause:** Your Anthropic account has hit its rate or spending limit.

**Fix:** Check your usage at <https://console.anthropic.com> and increase your limit or reduce request frequency.

---

## Memory / Workspace Issues

### `MEMORY.md` growing too large

OpenClaw appends to `MEMORY.md` over time. To trim it:

1. Open `~\.openclaw\agents\main\MEMORY.md`
2. Remove outdated entries
3. The gateway picks up changes automatically

---

### Workspace files missing after an update

If an update removed workspace files, restore defaults:

```powershell
openclaw workspace init --reset
```

> **Warning:** This overwrites `SOUL.md` and `IDENTITY.md` with defaults. Back up your customisations first.

---

## Still Stuck?

- Check [`docs/faq.md`](faq.md) for more answers
- Search [existing issues](https://github.com/Toddni8022/-Open-Claw-windows-11/issues) on this repo
- Open a [bug report](../.github/ISSUE_TEMPLATE/bug_report.md) with the exact error message and your environment details
