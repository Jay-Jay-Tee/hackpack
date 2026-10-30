# Editor setup

I use VS Code. Any editor is fine as long as it's installed and set up before the event.

## VS Code extensions

Install everything in my list:

```bash
# macOS / Linux
xargs -L 1 code --install-extension < dotfiles/vscode-extensions.txt
```

```powershell
# Windows
Get-Content dotfiles\vscode-extensions.txt | ForEach-Object { code --install-extension $_ }
```

My list includes C/C++, Rust, LaTeX and Jupyter extensions for coursework, which you may not need. The ones most useful for a hackathon:

- `ms-python.python`, `ms-python.vscode-pylance`: Python
- `ms-toolsai.jupyter`: notebooks
- `yzhang.markdown-all-in-one`: editing READMEs
- `mechatroner.rainbow-csv`: CSV files
- `ms-azuretools.vscode-containers`: Docker
- `anthropic.claude-code`, `openai.chatgpt`: AI assistants
- `catppuccin.catppuccin-vsc`, `catppuccin.catppuccin-vsc-icons`: theme and icons

## Settings

My settings are in [dotfiles/vscode-settings.json](../dotfiles/vscode-settings.json). Open the command palette, run **Preferences: Open User Settings (JSON)**, and copy across what you want. The file lives at:

- macOS: `~/Library/Application Support/Code/User/settings.json`
- Windows: `%APPDATA%\Code\User\settings.json`
- Linux: `~/.config/Code/User/settings.json`

The font setting expects JetBrains Mono Nerd Font to be installed.

## Shortcuts

| macOS | Windows/Linux | |
| --- | --- | --- |
| `⌘P` | `Ctrl+P` | Open file by name |
| `⌘⇧F` | `Ctrl+Shift+F` | Search the project |
| `` ⌃` `` | `` Ctrl+` `` | Terminal |
| `⌘D` | `Ctrl+D` | Select next match |
| `⌥↑` / `⌥↓` | `Alt+↑` / `Alt+↓` | Move line |
| `F2` | `F2` | Rename symbol |
| `⌘⇧V` | `Ctrl+Shift+V` | Markdown preview |

## Other editors

Cursor and Zed are both reasonable choices, and IntelliJ IDEA is the usual pick for Java and Android. Whatever you use, don't switch editors right before the event.

## Terminals

- Windows: Windows Terminal
- macOS: Ghostty ([my config](../dotfiles/ghostty.config)), iTerm2 or the built-in Terminal
- Linux: whatever your distro ships, or Ghostty

## AI tools

```bash
npm i -g @anthropic-ai/claude-code   # then run: claude
npm i -g @openai/codex               # then run: codex
```

Log in to any AI tools before the event. See [guide/05-ai-tools.md](../guide/05-ai-tools.md).
