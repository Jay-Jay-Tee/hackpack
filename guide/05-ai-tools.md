# 05 · Using AI without it using you

> AI is the biggest unfair advantage of the last two years — and the fastest way to demo code you can't explain.

## The rule

**You must be able to explain every line you ship.**

Judges ask "how does this work?" If the answer is "the AI wrote it", you lose the room. Use AI to go faster on things you already understand, not to skip understanding.

## Where AI actually wins at a hackathon

| Task | Great fit |
| --- | --- |
| Boilerplate | Auth screens, form validation, CRUD routes, DB schema |
| "Make it not ugly" | Tailwind classes, layout fixes, empty states |
| Debugging | Paste the full error + the file; ask for the *cause* first |
| Explaining unfamiliar code | "What does this function do, line by line?" |
| Naming things | Variables, features, the project itself |
| Docs | README, pitch script drafts, demo narration |
| Data munging | CSV cleanup, JSON reshaping, quick charts |
| Unblocking APIs | "Here's the docs, write the minimal request" |

## Where it loses

- **Novel architecture decisions.** It doesn't know your constraints or your teammates.
- **Anything time-sensitive.** Models hallucinate package versions and APIs.
- **Security.** Don't let it invent auth. Use a library and a known pattern.
- **The demo moment itself.** The wow should be something you decided.
- **Large refactors at hour 30.** It will confidently rewrite working code into broken code.

## Prompt patterns that work

**1. Give context, not vibes.**

> ❌ "make my app work"
>
> ✅ "Next.js 15 App Router app. `app/upload/page.tsx` throws `TypeError: Cannot read properties of undefined (reading 'name')` when I submit an empty form. Here's the file and the form component. Find the cause before suggesting a fix."

**2. Ask for the smallest change.**

> "Give me the minimal diff to fix this. Don't restructure the file."

**3. Ask it to explain before it writes.**

> "Explain what you're about to change and why, then show the code."

**4. Constrain the stack.**

> "Use only what's already in package.json. No new dependencies."

**5. Make it interview you.**

> "I'm building X for a hackathon demo in 6 hours. Ask me 5 questions to pin down scope, then propose a 3-step plan."

**6. Ask for the failure modes.**

> "What are the 3 most likely ways this breaks during a live demo?"

## Tools I use

| Tool | What for |
| --- | --- |
| **Claude Code** | Agentic work in the repo: multi-file edits, refactors, running commands. Best for "do the boring thing across 8 files". |
| **Codex / ChatGPT** | Quick questions, explaining errors, drafting text, rubber-ducking ideas. |
| **Copilot** | Inline completions while typing. Great for boilerplate, ignore for logic. |
| **Gemini** | Long-context: paste a whole spec, docs page, or a big file. |

Install notes → [../setup/editors.md](../setup/editors.md)

## Guardrails

- **Never paste real keys, passwords, or personal data into a chat.** Use fake values.
- **Review every diff before committing.** `git diff` is your seatbelt.
- **Commit before you let an agent loose.** Then `git diff` shows exactly what it did and `git restore` undoes it.
- **Don't let two agents edit the same file.** Merge chaos.
- **If you can't reproduce the fix, you don't have a fix.**
- **Check the event's AI policy.** Some competitions restrict AI-generated code; most now allow it. Read the rules — a disqualification is not worth it.

## The 10-minute rule

If AI hasn't unblocked you in 10 minutes, it's probably wrong about your problem. Go read the docs or ask a mentor. Agents can loop forever on a bad assumption.

## What to say if a judge asks "did you use AI?"

Be straight:

> "Yes — for boilerplate and debugging. The core idea, the scoping, and the demo flow are ours. Here's the part I'm proudest of, and here's how it works."

Confidence + honesty scores better than pretending.

---

Next → [06-demo-and-pitch.md](06-demo-and-pitch.md)
