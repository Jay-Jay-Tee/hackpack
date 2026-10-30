# Instruction files (CLAUDE.md, AGENTS.md)

An instruction file is a Markdown file in your project that your agent reads at the start of every session. It's where you put the things you'd otherwise repeat in every prompt: the stack, how to run the app, the rules.

Make one in the first hour of the hackathon and commit it, so everyone on the team gets the same behaviour from their agent.

## Which file

| Agent | File |
| --- | --- |
| Claude Code | `CLAUDE.md` |
| Codex, Cursor, and many others | `AGENTS.md` |
| GitHub Copilot | `.github/copilot-instructions.md` (it reads `AGENTS.md` too) |
| Gemini CLI | `GEMINI.md` |

They all go in the root of your project (the top folder).

**Team using different agents?** Write everything in `AGENTS.md`, then make a `CLAUDE.md` containing just this line, which tells Claude Code to read `AGENTS.md`:

```markdown
@AGENTS.md
```

Now there's one file to keep up to date.

## Getting a first draft

You don't have to start from nothing. In Claude Code, run `/init` and it writes a `CLAUDE.md` by looking at your project. With other agents, ask: "Look at this project and write an AGENTS.md with the stack, how to run it, and the folder structure." Then cut it down.

## What to put in it

- What the project is, in one or two sentences
- The stack
- How to install, run and build it
- Where things live (which folder has what)
- Rules the agent should follow
- Anything it keeps getting wrong

## What not to put in it

- Secrets or API keys (the file is committed)
- Long explanations. It's read every session, so every line costs time and attention. If a section is only needed sometimes, make it a [skill](skills.md) instead.
- Things the agent can see for itself, like listing every file

## An example for a hackathon

```markdown
# Recipe Snap

Upload a photo of your fridge, get three recipes. Built for a 36-hour hackathon;
the demo matters more than perfect code.

## Stack
- Next.js (App Router) + Tailwind
- Supabase for the database and image storage
- Gemini API for reading the photo
- Deployed on Vercel from `main`

## Commands
- `npm install` then `npm run dev` (http://localhost:3000)
- `npm run build` must pass before pushing

## Where things are
- Pages: `app/`
- API routes: `app/api/`
- Shared components: `components/`
- Sample data for the demo: `lib/demo-data.ts`

## Rules
- Don't add new packages without asking
- Keep secrets in `.env.local`; add any new variable names to `.env.example`
- Prefer simple code over abstractions
- If the Gemini call fails, fall back to `lib/demo-data.ts` so the demo never breaks
```

That's enough. Update it when the agent makes the same mistake twice.
