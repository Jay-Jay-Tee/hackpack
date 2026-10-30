# AI coding agents

An agent can read your project, edit several files, and run commands like `npm install` or your tests. That's different from a chat window where you copy and paste code. One agent is enough; pick whichever you have access to.

Install and log in before the event. Logins and subscriptions are the usual thing that goes wrong.

## The options

### Claude Code

Runs in the terminal, with a VS Code extension. Needs a Claude Pro or Max subscription, or an Anthropic API account.

```bash
# macOS / Linux / WSL
curl -fsSL https://claude.ai/install.sh | bash
```

```powershell
# Windows PowerShell
irm https://claude.ai/install.ps1 | iex
```

Or with npm on any OS: `npm install -g @anthropic-ai/claude-code`.

Run `claude` in a project folder and log in when asked. In VS Code, install the **Claude Code** extension (`anthropic.claude-code`).

### Codex

OpenAI's agent. Works with a ChatGPT account.

```bash
npm install -g @openai/codex
```

Run `codex` in a project folder. In VS Code, install the **Codex** extension (`openai.chatgpt`).

### GitHub Copilot

Built into VS Code through the Copilot Chat extension. There's a free tier, and it's free for verified students through the [GitHub Student Developer Pack](https://education.github.com/pack). Sign in with GitHub, open the chat panel, and switch the mode to **Agent** to let it edit files and run commands.

### Gemini CLI

Google's terminal agent, with a free tier using a Google account.

```bash
npm install -g @google/gemini-cli
```

Run `gemini` in a project folder.

## Project instructions file

Each agent reads a Markdown file in the project root for context. Create one in the first hour so the agent knows the stack and conventions, and commit it so the whole team's agents use the same instructions.

- Claude Code: `CLAUDE.md` (running `/init` inside Claude Code writes a first draft)
- Codex: `AGENTS.md`
- Copilot: `.github/copilot-instructions.md`
- Gemini CLI: `GEMINI.md`

Example:

```markdown
# Project

Next.js app with Tailwind and Supabase, deployed on Vercel.

- Run with `npm run dev`
- Don't add new dependencies without asking
- Put API calls in `lib/api.ts`
- This is a hackathon demo; prefer simple code over abstractions
```

## A safe way to work

1. Commit before asking the agent to change anything.
2. Give it one task at a time, with context: the file, the error, what should happen.
3. Read the diff (`git diff`, or the Source Control panel in VS Code) before committing.
4. If it went wrong, `git restore .` puts everything back.

Agents usually ask before running commands or editing files. Leave that on, at least until you're used to what they do.

Don't paste real API keys into a prompt, and don't let two agents edit the same files at once.

More on using them during the event: [guide/05-ai-tools.md](../guide/05-ai-tools.md).
