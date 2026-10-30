# Skills (SKILL.md)

A skill is a folder with a `SKILL.md` file that teaches your agent how to do one specific job: "check we're ready to submit", "write the README", "plan this idea". The agent sees only the skill's name and description until a task matches, then reads the full instructions.

It's an open format ([agentskills.io](https://agentskills.io)), so the same skill works in Claude Code, Codex, GitHub Copilot in VS Code, Gemini CLI, Cursor, OpenCode and others.

## Skill or instruction file?

- **[Instruction file](instruction-files.md)** (`CLAUDE.md` / `AGENTS.md`): facts that are always true, read every session. "We use Next.js. Don't add packages."
- **Skill**: a procedure you need sometimes, loaded only when it's relevant. "Here's how to check we're ready to demo."

Make a skill when you notice you keep pasting the same multi-step instructions into chat.

## What one looks like

```
demo-check/
└── SKILL.md
```

`SKILL.md` has two parts: [frontmatter](markdown.md#frontmatter) at the top, then Markdown instructions.

```markdown
---
name: demo-check
description: Checks whether a hackathon project is ready to demo and submit. Use when the user is about to submit, present or demo.
---

# Check the project is ready to demo

1. Run the build and note any errors.
2. Check no .env files or API keys are committed.
3. ...
```

- `name`: lowercase letters, numbers and hyphens, and the same as the folder name.
- `description`: what it does **and when to use it**. This is the most important line, because it's how the agent decides whether to load the skill.

A skill folder can also hold extra files (a template, a script, a longer reference) that the instructions point to. Most don't need them.

## Writing a good description

The agent only sees the description until it decides to use the skill, so say when it applies, using the words a person would actually type.

Too vague:

```yaml
description: Helps with demos.
```

Better:

```yaml
description: Checks whether a hackathon project is ready to demo and submit, covering the build, secrets, README and deployment. Use when the user is about to submit, present or demo, or asks if the project is ready.
```

## Writing the instructions

Everything on [Prompting AI](prompting.md) applies, because a skill is a prompt you've saved:

- Say what the end result should look like, ideally with the exact sections of the output.
- Number the steps.
- Set limits ("don't change any code", "ask before fixing").
- Keep it short. Under a page is usually plenty.
- Write it for a smart reader who knows nothing about your situation.

## Where to put them

For **Claude Code**:

| Folder | Works in |
| --- | --- |
| `.claude/skills/<name>/SKILL.md` in your project | That project. Commit it so your team gets it. |
| `~/.claude/skills/<name>/SKILL.md` | All your projects on your computer |

Other agents read from their own folders; check the "skills" page in your agent's docs. The skill files themselves are the same.

## Using one

- **Automatically**: just ask normally ("are we ready to submit?") and the agent loads the matching skill.
- **Directly**: in Claude Code, type `/` and the skill name, like `/demo-check`.

If a skill never gets used, its description probably doesn't match how you ask. Add the phrases you actually use.

## Example skills for hackathons

Three skills in this repo, ready to copy. To add them to a project for Claude Code:

```bash
# from inside your project folder, with hackpack cloned next to it
mkdir -p .claude/skills
cp -r ../hackpack/ai/example-skills/* .claude/skills/
```

Or copy one from the boxes below into `.claude/skills/<name>/SKILL.md` yourself. They're also [on GitHub](https://github.com/Jay-Jay-Tee/hackpack/tree/main/ai/example-skills).

### scope-idea

[View the file on GitHub](https://github.com/Jay-Jay-Tee/hackpack/blob/main/ai/example-skills/scope-idea/SKILL.md)

Turns a rough idea into must/should/won't lists, a demo script and a timeline. Good for the first hour.

~~~markdown
{% include_relative example-skills/scope-idea/SKILL.md %}
~~~

### explain-changes

[View the file on GitHub](https://github.com/Jay-Jay-Tee/hackpack/blob/main/ai/example-skills/explain-changes/SKILL.md)

Explains what the code (or the AI) did, in plain words, and prepares answers for judges' questions.

~~~markdown
{% include_relative example-skills/explain-changes/SKILL.md %}
~~~

### demo-check

[View the file on GitHub](https://github.com/Jay-Jay-Tee/hackpack/blob/main/ai/example-skills/demo-check/SKILL.md)

Checks the build, secrets, README and git status before you submit, and reports problems without fixing them.

~~~markdown
{% include_relative example-skills/demo-check/SKILL.md %}
~~~
