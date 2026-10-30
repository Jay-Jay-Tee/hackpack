# Start here

Never set up a laptop for coding before? Same, at some point. This page explains what you're about to install, why, and just enough terminal to get through the rest without panicking.

(Not sure what a hackathon even is yet? Read [What is a hackathon?](../what-is-a-hackathon.md) first.)

## What you're installing

- **Terminal**: a window where you type commands instead of clicking. Most setup steps and many coding tools work through it.
- **Git**: keeps a history of your code, so you can see what changed and undo mistakes. It runs on your computer.
- **GitHub**: a website that stores Git projects (called repositories, or repos) online, so your team can share code.
- **GitHub CLI (`gh`)**: lets you log in to GitHub and create repos from the terminal.
- **VS Code**: the editor where you write code. It has a terminal built in.
- **Node.js**: runs JavaScript outside the browser. Almost every web project needs it. It comes with **npm**, which downloads code libraries (packages) for your project.
- **Python**: another programming language, common for data and AI projects. Install it if you'll use it.
- **An AI coding agent** (Claude Code, Codex, Copilot or Gemini CLI): an assistant that can read your project, write code and run commands, with your approval.

## Opening a terminal

- **Windows**: press the Windows key, type `Terminal`, press Enter. (After setup, use the "PowerShell" tab.)
- **macOS**: press `Cmd+Space`, type `Terminal`, press Enter.
- **Linux**: usually `Ctrl+Alt+T`.
- **In VS Code**: menu **Terminal → New Terminal**.

## Using it

The terminal is always "in" a folder. Commands run in that folder.

```bash
pwd          # print which folder you're in
ls           # list what's in it
cd Desktop   # go into the Desktop folder
cd ..        # go up one folder
```

To run a command from these guides, copy it, paste it into the terminal (`Ctrl+V` on Windows and Linux, though some Linux terminals need `Ctrl+Shift+V`; `Cmd+V` on macOS), and press Enter. Wait until the prompt comes back before running the next one.

Some things to know:

- Lines starting with `#` in the guides are comments. You don't need to type them.
- Text in `<angle brackets>` or saying "Your Name" is a placeholder. Replace it with your own value.
- `Ctrl+C` stops whatever is running (on macOS too, not `Cmd+C`).
- Press the up arrow to bring back the last command.
- After installing something, close the terminal and open a new one before using it. The old window doesn't know it exists yet.
- If a command prints a lot of text, scroll up and look for the word "error". That line usually explains what went wrong.

## Order

1. Set up your computer: [Windows](windows.md), [macOS](macos.md) or [Linux](linux.md)
2. [VS Code](vscode.md)
3. [An AI coding agent](ai-agents.md)
4. Learn the [commands worth knowing](../resources/commands.md)
5. Read the [guide](../guide/01-before.md)

If something fails, check [troubleshooting.md](troubleshooting.md), search the error message online, or ask an AI agent with the full error pasted in.
