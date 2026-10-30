# Setup · Editor

> VS Code is what I use. Any editor works — the point is that it's already installed, themed, and has the extensions you need *before* the clock starts.

---

## VS Code

### Extensions

Install all of them at once from the list:

```bash
# macOS / Linux
cat dotfiles/vscode-extensions.txt | xargs -L 1 code --install-extension
```

```powershell
# Windows
Get-Content dotfiles\vscode-extensions.txt | ForEach-Object { code --install-extension $_ }
```

### What I actually use, and why

| Extension | Why |
| --- | --- |
| `catppuccin.catppuccin-vsc` | Theme. Matches Ghostty + Starship + delta. |
| `catppuccin.catppuccin-vsc-icons` | File icons that match. |
| `ms-python.python` + `ms-python.vscode-pylance` | Python language support + IntelliSense. |
| `ms-toolsai.jupyter` | Notebooks — great for quick data work. |
| `ms-vscode.cpptools` | C/C++ (coursework and some hardware tracks). |
| `rust-lang.rust-analyzer` | Rust. |
| `ms-vscode.cmake-tools` | CMake projects. |
| `james-yu.latex-workshop` | LaTeX reports. |
| `yzhang.markdown-all-in-one` | README editing, preview, TOC. |
| `mechatroner.rainbow-csv` | CSV/TSV columns in colour — surprisingly useful. |
| `ms-azuretools.vscode-containers` | Dockerfile/compose help. |
| `vadimcn.vscode-lldb` | Native debugging on macOS. |
| `formulahendry.code-runner` | Run the current file with one click. |
| `anthropic.claude-code` | Claude Code in the editor. |
| `openai.chatgpt` | Codex / ChatGPT. |
| `github.copilot` (optional) | Inline completions. |

The full list is in [../dotfiles/vscode-extensions.txt](../dotfiles/vscode-extensions.txt).

### Settings

Copy [../dotfiles/vscode-settings.json](../dotfiles/vscode-settings.json) into your user settings.

- macOS: `~/Library/Application Support/Code/User/settings.json`
- Windows: `%APPDATA%\Code\User\settings.json`
- Linux: `~/.config/Code/User/settings.json`

Or open the command palette → **Preferences: Open User Settings (JSON)**.

The highlights:

```jsonc
{
  "workbench.colorTheme": "Catppuccin Mocha",
  "editor.fontFamily": "JetBrainsMono Nerd Font, Menlo, Monaco, monospace",
  "editor.fontLigatures": true,
  "editor.lineHeight": 1.6,
  "editor.minimap.enabled": false,
  "editor.stickyScroll.enabled": true,
  "editor.bracketPairColorization.enabled": true,
  "files.autoSave": "afterDelay",
  "code-runner.runInTerminal": true
}
```

> **Monospace font matters.** Install **JetBrains Mono Nerd Font** ([nerdfonts.com](https://www.nerdfonts.com)) — it's the font used in the theme, the terminal, and the prompt icons.

### Keybindings worth learning

| Shortcut (mac / win) | Action |
| --- | --- |
| `⌘P` / `Ctrl+P` | Jump to file |
| `⌘⇧F` / `Ctrl+Shift+F` | Search across the project |
| `⌘⇧E` / `Ctrl+Shift+E` | File explorer |
| `` ⌘` `` / `` Ctrl+` `` | Terminal |
| `⌘D` / `Ctrl+D` | Select next occurrence (rename fast) |
| `⌥↑↓` / `Alt+↑↓` | Move line |
| `⇧⌥↓` / `Shift+Alt+↓` | Duplicate line |
| `F2` | Rename symbol everywhere |
| `⌘⇧V` / `Ctrl+Shift+V` | Markdown preview |

---

## Other editors people use at hackathons

| Editor | Good if… |
| --- | --- |
| **Cursor** | You want AI-first editing with VS Code compatibility |
| **Zed** | You want speed and a clean UI, and don't need many extensions |
| **IntelliJ IDEA** | Java / Kotlin / Android |
| **Neovim** | You already live in it (don't learn it at a hackathon) |
| **JetBrains Fleet** | Lightweight JetBrains |

Whatever you pick: install it, theme it, and open a project **before** the event.

---

## Terminal

| OS | Terminal |
| --- | --- |
| Windows | **Windows Terminal** (built in) — not the old console |
| macOS | **Ghostty** (my pick), iTerm2, or Terminal.app |
| Linux | GNOME Terminal, Konsole, or Ghostty |

Config for Ghostty: [../dotfiles/ghostty.config](../dotfiles/ghostty.config).

---

## AI tool setup

```bash
# Claude Code
npm i -g @anthropic-ai/claude-code
claude            # first run walks you through login

# Codex CLI
npm i -g @openai/codex

# Copilot CLI / VS Code
code --install-extension github.copilot
```

You don't need all of them. Pick one agent tool and one chat tool, and learn their shortcuts. See [../guide/05-ai-tools.md](../guide/05-ai-tools.md) for how I use them.

> **Before the event:** log in to every AI tool you plan to use. Nothing wastes more time than a login wall at hour 3.
