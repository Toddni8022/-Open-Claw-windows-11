# Contributing to the OpenClaw Windows 11 Setup Guide

Thank you for your interest in improving this guide! Contributions of all sizes are welcome — from fixing a typo to adding a whole new section.

---

## Table of Contents

- [Types of Contributions](#types-of-contributions)
- [Getting Started](#getting-started)
- [Style Guidelines](#style-guidelines)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Reporting Issues](#reporting-issues)
- [Code of Conduct](#code-of-conduct)

---

## Types of Contributions

| Type | Examples |
|------|---------|
| **Bug fixes** | Correct outdated commands, fix broken links, fix typos |
| **Improvements** | Clarify unclear steps, add missing detail, improve formatting |
| **New content** | Add a new troubleshooting entry, expand the FAQ, write a new doc section |
| **Screenshots** | Add screenshots to the `screenshots/` directory |
| **Scripts** | Improve or extend PowerShell scripts in `scripts/` |
| **Translations** | Add translated versions of documents |

---

## Getting Started

1. **Fork** this repository on GitHub.
2. **Clone** your fork:

   ```powershell
   git clone https://github.com/<your-username>/-Open-Claw-windows-11.git
   cd -Open-Claw-windows-11
   ```

3. Create a **feature branch**:

   ```powershell
   git checkout -b fix/typo-in-installation
   ```

4. Make your changes.
5. Commit with a descriptive message:

   ```powershell
   git commit -m "docs: fix Node.js version requirement in installation.md"
   ```

6. Push and open a **Pull Request** against `main`.

---

## Style Guidelines

### Markdown

- Use ATX-style headings (`#`, `##`, etc.)
- Use fenced code blocks with a language identifier (` ```powershell `, ` ```json `, etc.)
- Keep line length reasonable (no hard limit, but avoid very long lines)
- End every file with a newline

The repository uses [markdownlint](https://github.com/DavidAnson/markdownlint) to enforce consistent Markdown style. You can check your changes locally by installing markdownlint-cli:

```powershell
npm install -g markdownlint-cli
markdownlint "**/*.md" --ignore node_modules
```

### PowerShell Scripts

- Include a `.SYNOPSIS`, `.DESCRIPTION`, and `.EXAMPLE` in the comment-based help block
- Use `Set-StrictMode -Version Latest` and `$ErrorActionPreference = 'Stop'`
- Print clear pass/fail messages for each check
- Keep scripts idempotent (safe to run multiple times)

---

## Submitting a Pull Request

Before submitting, please:

- [ ] Confirm your Markdown passes linting (`markdownlint`)
- [ ] Test any PowerShell script changes on Windows 11
- [ ] Verify all links in your changes are valid
- [ ] Describe *what* you changed and *why* in the PR description

---

## Reporting Issues

Use the GitHub issue templates to report problems:

- [Bug report](.github/ISSUE_TEMPLATE/bug_report.md) — for incorrect or broken guide content
- [Improvement suggestion](.github/ISSUE_TEMPLATE/improvement.md) — for ideas on how to make the guide better

---

## Code of Conduct

Please be respectful and constructive in all interactions. This is a community resource and should be welcoming to everyone regardless of experience level.
