# hackpack

Setup guides, configs and notes for people going to their first hackathon. It's what I'd send a friend the week before one: how to get a laptop ready, my terminal and editor config, and a short guide to the event itself.

Take whatever's useful and ignore the rest.

## Contents

- [`guide/`](guide/) – notes on the event, in order: preparing, picking an idea, building, git with a team, AI tools, the demo, and common mistakes.
- [`setup/`](setup/) – installing tools on [Windows](setup/windows.md), [macOS](setup/macos.md) and [Linux](setup/linux.md), plus [editor setup](setup/editors.md) and [fixes for common errors](setup/troubleshooting.md).
- [`dotfiles/`](dotfiles/) – my zsh, git, Starship, Ghostty and VS Code configs.
- [`scripts/`](scripts/) – install scripts for macOS and Windows, and `check.sh` to see what's missing.
- [`templates/`](templates/) – a project README, a pitch outline and a submission checklist.
- [`resources/`](resources/) – free tiers, public APIs and what to learn first.

There's also a web version at <https://jay-jay-tee.github.io/hackpack/>.

## Getting started

```bash
git clone https://github.com/Jay-Jay-Tee/hackpack.git
cd hackpack
```

Then follow the setup page for your OS. On macOS or Linux, `./scripts/check.sh` lists which tools you have and which are missing. It doesn't change anything.

The install scripts only print what they would do. Pass `--apply` (or `-Apply` on Windows) to actually install.

## If you only read one part

- Install and test everything a week before. Deploy a hello-world page somewhere so you know that works.
- Pick an idea you can demo in two minutes, and cut everything that isn't needed for that demo.
- Deploy in the first hour and keep the deployed version working.
- Keep `.env` and API keys out of git.
- Submit early. The submission deadline is usually before judging.
- Sleep at some point.

The rest is in [`guide/`](guide/01-before.md).

## My setup

My main laptop runs Windows. The configs here come from my MacBook: Ghostty, zsh with Starship, and VS Code with the Catppuccin Mocha theme and JetBrains Mono Nerd Font. Runtimes are Node, Bun, Python 3.12 and JDK 25.

You don't need any of this. Git, Node, an editor and a browser are enough.

## Contact

Open an issue if something is wrong or unclear, or reach me at [@Jay-Jay-Tee](https://github.com/Jay-Jay-Tee) / <joshuajacobthomas1@gmail.com>.

MIT licence.
