# VS Code

Any editor works. VS Code is just what almost everyone at a hackathon uses, so when you're stuck, the person next to you will know where the buttons are.

## Extensions

A short list that covers most hackathon projects:

- **GitHub Copilot Chat** (`github.copilot-chat`): AI chat and agent mode in the editor
- **ESLint** (`dbaeumer.vscode-eslint`) and **Prettier** (`esbenp.prettier-vscode`): JavaScript/TypeScript linting and formatting
- **Python** (`ms-python.python`): Python support, including Pylance
- **Tailwind CSS IntelliSense** (`bradlc.vscode-tailwindcss`): Tailwind class completion
- **GitLens** (`eamodio.gitlens`): who changed what, inline
- **Live Share** (`ms-vsliveshare.vsliveshare`): edit the same files as a teammate in real time
- **Markdown All in One** (`yzhang.markdown-all-in-one`): editing READMEs

Install them all from [vscode-extensions.txt](vscode-extensions.txt):

```bash
# macOS / Linux
xargs -L 1 code --install-extension < setup/vscode-extensions.txt
```

```powershell
# Windows
Get-Content setup\vscode-extensions.txt | ForEach-Object { code --install-extension $_ }
```

AI agent extensions are covered in [ai-agents.md](ai-agents.md).

## Settings

A few settings that help, in [vscode-settings.json](vscode-settings.json): format on save, auto save, and no minimap. Open the command palette (`Cmd+Shift+P` / `Ctrl+Shift+P`), run **Preferences: Open User Settings (JSON)** and copy across what you want.

## Shortcuts

| macOS | Windows/Linux | |
| --- | --- | --- |
| `⌘⇧P` | `Ctrl+Shift+P` | Command palette |
| `⌘P` | `Ctrl+P` | Open file by name |
| `⌘⇧F` | `Ctrl+Shift+F` | Search the project |
| `` ⌃` `` | `` Ctrl+` `` | Terminal |
| `⌘D` | `Ctrl+D` | Select next match |
| `⌥↑` / `⌥↓` | `Alt+↑` / `Alt+↓` | Move line |
| `F2` | `F2` | Rename symbol |
| `⌘⇧V` | `Ctrl+Shift+V` | Markdown preview |

## Git in VS Code

The Source Control panel (`Ctrl+Shift+G`) lets you stage, commit, push and pull without the terminal. It also shows merge conflicts with buttons to accept either side. It's worth knowing the [commands](../resources/commands.md) too, for when something goes wrong.

## Opening a project

From a terminal in the project folder:

```bash
code .
```
