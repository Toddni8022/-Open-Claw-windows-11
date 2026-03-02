# Contributing to the OpenClaw Windows 11 Guide

Thank you for helping improve this guide! Whether you're fixing a typo, adding a missing step, or writing a whole
new section — every contribution is welcome.

---

## Table of Contents

- [Ways to Contribute](#ways-to-contribute)
- [Getting Started](#getting-started)
- [Style Guide](#style-guide)
- [Submitting a Pull Request](#submitting-a-pull-request)
- [Reporting Issues](#reporting-issues)
- [Code of Conduct](#code-of-conduct)

---

## Ways to Contribute

- **Fix errors** — broken commands, outdated screenshots, wrong paths
- **Add clarity** — expand vague steps, add context, improve wording
- **New content** — new FAQ entries, troubleshooting tips, configuration options
- **Scripts** — improve or extend the PowerShell automation scripts
- **Translations** — translate the guide to other languages

---

## Getting Started

1. **Fork** this repository
2. **Clone** your fork:

   ```powershell
   git clone https://github.com/<your-username>/-Open-Claw-windows-11.git
   cd -Open-Claw-windows-11
   ```

3. Create a new branch:

   ```powershell
   git checkout -b my-improvement
   ```

4. Make your changes
5. Commit and push:

   ```powershell
   git add .
   git commit -m "docs: describe your change"
   git push origin my-improvement
   ```

6. Open a **Pull Request** against `main`

---

## Style Guide

- Write in clear, simple English — assume the reader is not a developer
- Use title case for headings (e.g., `## Quick Start` not `## quick start`)
- Wrap code in fenced code blocks with the appropriate language tag (`powershell`, `json`, etc.)
- Keep lines under 120 characters where possible
- Place a blank line before and after headings and code blocks
- Use `docs/` for narrative documentation and `scripts/` for automation

---

## Submitting a Pull Request

- Reference any related issue with `Fixes #<number>` in the PR description
- Describe *what* changed and *why*
- Keep PRs focused — one logical change per PR
- The CI pipeline will automatically lint Markdown; please fix any reported issues before requesting a review

---

## Reporting Issues

Use the GitHub Issue templates:

- [🐛 Bug Report](.github/ISSUE_TEMPLATE/bug_report.md) — for errors or broken steps in the guide
- [💡 Improvement](.github/ISSUE_TEMPLATE/improvement.md) — for suggestions to expand or clarify content

---

## Code of Conduct

Be respectful and constructive. This is a community resource maintained in good faith.
