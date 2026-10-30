# hackpack 🎒

**Everything you need for your first hackathon — my actual setup, my notes, and the mistakes I made so you don't have to.**

This isn't a course. It's the folder I wish someone had handed me before my first 36-hour sprint: my terminal config, my install scripts, and a playbook that fits on a few pages.

Clone it, steal the parts you like, delete the rest.

```
git clone https://github.com/Jay-Jay-Tee/hackpack.git
```

---

## What's in here

| Folder | What it's for |
| --- | --- |
| [`guide/`](guide/) | The playbook. Read this first — 20 minutes, start to finish. |
| [`setup/`](setup/) | Step-by-step machine setup for **Windows**, **macOS**, **Linux**. |
| [`dotfiles/`](dotfiles/) | My real configs: zsh, starship, git, Ghostty, VS Code. |
| [`scripts/`](scripts/) | `install.sh` / `install.ps1` — safe by default, dry-run first. |
| [`templates/`](templates/) | README template, pitch template, submission checklist. |

---

## Pick your path

**Windows (my main machine)**
→ [setup/windows.md](setup/windows.md) · then `scripts/install.ps1`

**macOS**
→ [setup/macos.md](setup/macos.md) · then `scripts/install.sh`

**Linux**
→ [setup/linux.md](setup/linux.md) · then `scripts/install.sh`

**"I just want the advice, not the config"**
→ [guide/01-before.md](guide/01-before.md) and keep going. It's numbered for a reason.

---

## The short version

If you read nothing else:

1. **Install everything a week before, not the morning of.** Test that you can deploy *something* to a public URL before you arrive.
2. **Scope for a 2-minute demo, not a 2-year product.** One feature that makes people go "oh, nice" beats ten that half-work.
3. **Deploy on day one**, even if the page just says "hello". A working URL changes everything.
4. **Commit early, commit often.** A broken main branch at hour 40 is how teams lose.
5. **Never commit secrets.** `.env` stays out of git; plain `.env.example` goes in.
6. **Build for the judges, not for yourself.** Know the rubric. If there's a sponsor prize, use the sponsor's API.
7. **Rehearse the demo twice.** Have a recorded video as backup. Wi-Fi will betray you.
8. **Sleep.** A 4-hour-nap team beats a 36-hour-awake team every single time.

Full detail → [guide/07-mistakes.md](guide/07-mistakes.md)

---

## My setup at a glance

| | |
| --- | --- |
| **Main laptop** | Windows — where the real work happens |
| **This repo's config** | macOS (Apple M5, 24 GB) — my second machine |
| **Terminal** | Ghostty + zsh + Starship |
| **Shell tools** | `eza` `bat` `fzf` `zoxide` `ripgrep` `fd` `delta` `lazygit` `btop` |
| **Editor** | VS Code (Catppuccin Mocha, JetBrains Mono Nerd Font) |
| **Runtimes** | Node 26 · Bun · Python 3.12 · OpenJDK 25 |
| **Package managers** | Homebrew (macOS) · winget (Windows) |
| **AI** | Claude Code, Codex, Copilot — see [guide/05-ai-tools.md](guide/05-ai-tools.md) |

None of this is required to win. A laptop with VS Code, Node, Git and a browser is enough. The config just removes friction.

---

## Ground rules for using this

- **The scripts default to dry-run.** Nothing changes until you pass `--apply`. Read what it prints.
- **Don't blindly copy dotfiles.** Merge them into yours, or you'll break something you already had.
- **Your setup should be boring.** The hackathon is the wrong time to try a new OS, a new language, and a new editor at once.

---

## Found a bug / want to add something?

Open an issue or a PR. If you're a first-timer and something here was confusing, that's a bug too — tell me.

## Questions

- GitHub: [@Jay-Jay-Tee](https://github.com/Jay-Jay-Tee)
- Email: <joshuajacobthomas1@gmail.com>

<!-- TODO: add LinkedIn / Discord / Instagram if you want them public -->

Good luck. Ship something small and ship it early. 🚀

---

<sub>MIT licensed. Take it, fork it, put your name on it.</sub>
