# Commands worth knowing

## Terminal

| Command | Does |
| --- | --- |
| `pwd` | Show the current folder |
| `ls` (`dir` on old Windows shells) | List files |
| `cd folder`, `cd ..` | Move into a folder, or up one |
| `mkdir name` | Make a folder |
| `code .` | Open the current folder in VS Code |
| `Ctrl+C` | Stop the running program |
| `↑` | Previous command |
| `Tab` | Complete a file or folder name |

## Git

| Command | Does |
| --- | --- |
| `git clone <url>` | Download a repo |
| `git status` | See what's changed |
| `git add -A` | Stage all changes |
| `git commit -m "message"` | Save a snapshot |
| `git push` | Upload commits |
| `git pull --rebase` | Get teammates' commits |
| `git log --oneline` | List recent commits |
| `git diff` | See unstaged changes |
| `git switch -c name` | Make a new branch and switch to it |
| `git switch main` | Go back to main |
| `git restore <file>` | Discard changes to a file |
| `git stash` / `git stash pop` | Put changes aside and bring them back |

Fixing mistakes is covered in [guide/04-git-with-a-team.md](../guide/04-git-with-a-team.md).

## GitHub CLI

| Command | Does |
| --- | --- |
| `gh auth login` | Log in once |
| `gh repo create name --public --source=. --push` | Turn the current folder into a GitHub repo |
| `gh repo clone owner/name` | Clone a repo |
| `gh repo view --web` | Open the repo in the browser |
| `gh pr create` | Open a pull request for the current branch |
| `gh pr list` / `gh pr checkout 12` | See PRs, or check one out locally |
| `gh pr merge` | Merge a PR |

To add teammates: repo **Settings → Collaborators** on GitHub.

## Node / npm

| Command | Does |
| --- | --- |
| `npm create vite@latest` | Start a new web project |
| `npx create-next-app@latest` | Start a new Next.js project |
| `npm install` | Install the project's dependencies |
| `npm install <package>` | Add a dependency |
| `npm run dev` | Start the dev server |
| `npm run build` | Production build (run this before deploying) |
| `npx vercel` | Deploy to Vercel |

## Python with uv

| Command | Does |
| --- | --- |
| `uv init` | Start a new project |
| `uv add <package>` | Add a dependency |
| `uv run main.py` | Run a script in the project's environment |
| `uv sync` | Install dependencies after cloning |

## AI agents

| Command | Does |
| --- | --- |
| `claude` | Start Claude Code in the current folder |
| `codex` | Start Codex |
| `gemini` | Start Gemini CLI |

See [setup/ai-agents.md](../setup/ai-agents.md).
