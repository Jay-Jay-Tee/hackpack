# 5. AI tools

Check the event rules first. Most hackathons allow AI tools, but some restrict them.

The main rule I'd follow: understand everything you ship. Judges often ask how something works, and you need to be able to answer.

## Where they help

- Repetitive code: forms, basic create/read/update/delete routes, database tables
- Layout and styling fixes
- Explaining an error or an unfamiliar piece of code
- Writing a minimal request against an API when you paste in its docs
- Cleaning up data
- First drafts of the README and pitch

## Where they cause problems

- Package versions and API details, which they sometimes get wrong
- Authentication and security; use a library instead
- Large rewrites late in the event, which can break working code
- Deciding what to build

## Asking well

Give the context: the framework, the file, the full error, and what you expected to happen. For example:

> Next.js App Router. Submitting an empty form on `app/upload/page.tsx` throws `TypeError: Cannot read properties of undefined (reading 'name')`. Here's the page and the form component. What's causing it?

Other things that help:

- Ask for the smallest change that fixes the problem.
- Tell it not to add new dependencies.
- Ask it to explain the cause before writing code.

## Habits

- Commit before letting an agent edit files, so `git diff` shows what it changed and `git restore` can undo it.
- Read the diff before you commit.
- Don't paste real API keys or personal data into a chat.
- Don't run two agents on the same files.
- If it hasn't helped after ten minutes or so, read the docs or ask a mentor instead.

## Setup

Installing Claude Code, Codex, Copilot or Gemini CLI, and writing a project instructions file, is covered in [setup/ai-agents.md](../setup/ai-agents.md).

If a judge asks whether you used AI, say yes and say what for.

---

Next: [6. Demo and pitch](06-demo-and-pitch.md)
