# hackpack

A basic setup and some notes for people going to their first hackathon: getting a laptop ready with VS Code, Git, GitHub and an AI coding agent, the commands you'll use, and a short guide to the event itself.

Take whatever's useful and ignore the rest.

Never been to one? Read [What is a hackathon?](what-is-a-hackathon.md) first.

## Contents

New to coding setup? Start with [setup/start-here.md](setup/start-here.md). It explains what each tool is and how to use the terminal.

- [`setup/`](setup/) – installing the basics on [Windows](setup/windows.md), [macOS](setup/macos.md) or [Linux](setup/linux.md), then [VS Code](setup/vscode.md), [AI coding agents](setup/ai-agents.md), and [fixes for common errors](setup/troubleshooting.md).
- [`git/`](git/) – what Git and GitHub are, a hands-on first repo, SSH keys, and fixing mistakes.
- [`ai/`](ai/) – working with AI: how it works, writing Markdown, prompting well, a prompt library, `CLAUDE.md` / `AGENTS.md`, and skills (`SKILL.md`), with three example skills to copy.
- [`resources/commands.md`](resources/commands.md) – terminal, git and GitHub commands worth knowing.
- [`resources/glossary.md`](resources/glossary.md) – short explanations of terms like API, deploy, branch and `.env`.
- [`guide/`](guide/) – notes on the event, in order: preparing, picking an idea, building, git with a team, using AI, the demo, and common mistakes.
- [`templates/`](templates/) – a project README, a pitch outline and a submission checklist.
- [`resources/`](resources/) – free tiers, public APIs and what to learn first.
- [`scripts/`](scripts/) – install scripts for macOS and Windows, and `check.sh` to see what's missing.
- [`extras/`](extras/) – optional terminal styling from my Mac. Not needed.

Website: <https://jay-jay-tee.github.io/hackpack/>. Source: <https://github.com/Jay-Jay-Tee/hackpack>.

## What you need

- Git, and a GitHub account with the GitHub CLI (`gh`) logged in
- VS Code
- Node.js (LTS), and Python if you'll use it
- At least one AI coding agent: Claude Code, Codex or GitHub Copilot
- A browser, and an account on Vercel or Netlify for deploying

## Getting started

Read [start here](setup/start-here.md), follow the setup page for your OS, then [VS Code](setup/vscode.md) and [AI agents](setup/ai-agents.md). Afterwards, on macOS or Linux:

```bash
git clone https://github.com/Jay-Jay-Tee/hackpack.git
cd hackpack
./scripts/check.sh
```

`check.sh` only lists what's installed and what's missing.

## If you only read one part

- Install and test everything a week before. Deploy a hello-world page so you know that works.
- Pick an idea you can demo in two minutes, and cut everything that isn't needed for that demo.
- Deploy in the first hour and keep the deployed version working.
- Keep `.env` and API keys out of git.
- Submit early. The submission deadline is usually before judging.
- Sleep at some point.

The rest is in [`guide/`](guide/01-before.md).

## Contact

Open an issue if something is wrong or unclear, or reach me at [@Jay-Jay-Tee](https://github.com/Jay-Jay-Tee) / <joshuajacobthomas1@gmail.com>.

MIT licence.
