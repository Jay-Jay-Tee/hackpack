# Example repo: what a finished submission looks like

[**rain-check**](https://github.com/Jay-Jay-Tee/rain-check) is a small, real project made to show what a good hackathon repo looks like when judges open it. Type a city, and it tells you whether to bring an umbrella. [Try the live demo.](https://jay-jay-tee.github.io/rain-check/)

It wasn't entered in a real hackathon; it exists so you can see every part of a submission in one place. Open it in another tab and go through the list below.

![Screenshot of the rain-check app](https://raw.githubusercontent.com/Jay-Jay-Tee/rain-check/main/docs/screenshot.png)

## What to look at

### The repo page

[github.com/Jay-Jay-Tee/rain-check](https://github.com/Jay-Jay-Tee/rain-check)

- **The About box** (top right): a one-line description, the live demo link, and topics. Set these under the gear icon next to "About".
- **The README** shows straight under the files. It's the first thing a judge reads.

### The README

[Read it](https://github.com/Jay-Jay-Tee/rain-check#readme). It follows the [README template](README.template.md):

- one-line description at the top
- a screenshot, before any text about the problem
- the live demo link, near the top
- the problem in two sentences
- what it does, in bullets
- how it works: a small diagram and the stack
- how to run it locally, including environment variables (here, none)
- what's mocked, what's not built, next steps
- the team

### The commit history

[See the commits](https://github.com/Jay-Jay-Tee/rain-check/commits/main). Each one is a small step with a message that says what changed: "Set up the page and search form", "Look up the city and show the hourly chance of rain". Click one to see exactly which lines changed.

### A pull request

[PR #2: Remember the last city checked](https://github.com/Jay-Jay-Tee/rain-check/pull/2). This is how a teammate would add a feature without disturbing `main`: a branch, a description of what, why, how and how to test, then a merge. Look at the "Files changed" tab.

### An issue

[Issue #1: Use the browser's location](https://github.com/Jay-Jay-Tee/rain-check/issues/1). Issues are the team's to-do list. This one is an idea that didn't make it into the demo, written down so it isn't lost, and linked from the README's "Not built" section.

### Instruction files and a skill

- [`AGENTS.md`](https://github.com/Jay-Jay-Tee/rain-check/blob/main/AGENTS.md): what any AI agent should know about the project. See [Instruction files](../ai/instruction-files.md).
- [`CLAUDE.md`](https://github.com/Jay-Jay-Tee/rain-check/blob/main/CLAUDE.md): one line, `@AGENTS.md`, so Claude Code reads the same file.
- [`.claude/skills/demo-check/`](https://github.com/Jay-Jay-Tee/rain-check/tree/main/.claude/skills/demo-check): the demo-check skill from [Skills](../ai/skills.md), committed so the whole team has it.

### The small files

- [`.gitignore`](https://github.com/Jay-Jay-Tee/rain-check/blob/main/.gitignore): keeps `.env`, OS junk and `node_modules/` out, even though this project doesn't have them yet.
- [`LICENSE`](https://github.com/Jay-Jay-Tee/rain-check/blob/main/LICENSE): says others may reuse the code (MIT here).
- No `.env.example`, because there are no keys. If your project has any, include one.

### The release tag

[Tag v1.0](https://github.com/Jay-Jay-Tee/rain-check/tags) marks the submitted version, made with:

```bash
git tag -a v1.0 -m "Submitted version"
git push --tags
```

If you keep working after the deadline, judges can still see exactly what you submitted.

### The live demo

[jay-jay-tee.github.io/rain-check](https://jay-jay-tee.github.io/rain-check/), hosted free on GitHub Pages. It has:

- a "Try it with Singapore" button, so judges don't have to type
- `?city=London` links that open straight to a result
- a fallback to saved data if the weather service is down, with a note saying so, so the demo can't break

## Your repo doesn't need to match exactly

A bigger project will have more folders, a framework, and a `.env.example`. What matters is that a judge can understand what you built in 30 seconds from the README, open a working demo, and see a history of real work.

Before submitting, go through the [submission checklist](CHECKLIST.md).
