# Prompt library

Prompts for each stage of a hackathon. Copy one, replace the parts in `<angle brackets>`, and add any detail you have. They're starting points; the more specific you make them, the better they work.

## Before you build

### Brainstorm ideas

```markdown
We're a team of <number> at a <length>-hour hackathon. The theme is <theme>.
Prize tracks: <tracks, or "none announced">.
Our skills: <e.g. "two of us know React, one knows Python, one does design">.

Suggest 8 project ideas. For each: one sentence on what it does, who it's for,
and what the 2-minute demo would show. Avoid ideas that need data we don't have,
hardware, or APIs that need approval. Then pick the 3 strongest and say why.
```

### Pressure-test an idea

```markdown
Here's our hackathon idea: <idea>.
We have <hours> hours and <number> people who know <skills>.

Be blunt. Is this too big? What's the single feature the demo should show?
What would you cut? What's most likely to go wrong?
```

### Scope it

```markdown
Turn this idea into a plan: <idea>.
Give me: the one main feature, a "must" list (max 5), a "should" list,
a "won't" list, a demo script under 2 minutes, and a timeline for <hours> hours
with deployment in the first hour.
```

(The [scope-idea skill](skills.md#scope-idea) does this automatically.)

### Choose a stack

```markdown
We want to build <idea>. We know <languages/frameworks>.
Suggest a stack we can set up in under an hour and deploy for free.
Compare 2 options in a short table and recommend one.
```

## Setting up

### Scaffold the project

```markdown
Create a new <framework> project in this folder for <idea>.
Set up: <e.g. Tailwind, a basic layout, a home page and a /demo page>.
Add a .gitignore, a .env.example, and a README with how to run it.
Don't add anything else yet. Tell me the commands to run it.
```

### Write the instruction file

```markdown
Look at this project and write an AGENTS.md (under 40 lines) with:
what the project is in one sentence, the stack, how to install and run it,
where things live, and these rules: <your rules>.
```

### Deploy

```markdown
I want to deploy this <framework> app to <Vercel/Netlify/Render>.
Walk me through it step by step, including which environment variables
from .env.example I need to set on the host. I'm a beginner at deploying.
```

## Building

### Add a feature

```markdown
## Goal
<What the feature does, from the user's point of view>

## Context
- Relevant files: <paths>
- Similar existing code: <e.g. "the upload page works the same way">

## Rules
- Smallest change that works
- No new packages unless you ask first

First, explain your plan in a few bullet points and wait for me to say go.
```

### Make it look better

```markdown
This page works but looks rough (screenshot attached). Make it look clean and
modern using <Tailwind / our existing components>. Keep the layout and the
functionality exactly the same. Make sure it works on a phone screen too.
```

### Fake data for the demo

```markdown
Create realistic sample data for the demo: <what, how many>.
Use realistic names and values, not "test1, test2". Save it in <file>
in this format: <example>.
```

### Call an API

```markdown
I want to use <API name> to <goal>. Here's the relevant part of their docs:
<paste docs or link>

Write the smallest working request from <file>, with error handling that
falls back to <saved sample data> if the API fails, so the demo never breaks.
```

## Fixing

### Debug an error

````markdown
## What I'm doing
<what you clicked or ran>

## What should happen
<expected>

## What happens
<actual>

## Error
```
<full error, all of it>
```

## Already tried
<what you've tried>

Find the cause before suggesting a fix. Then make the smallest change.
````

### It works locally but not when deployed

```markdown
The app works on localhost but fails on <host>. Here's the build log / the error
in the browser console: <paste>. Go through the usual causes (environment
variables, Node version, file name case, build command) and tell me what to check.
```

### Understand someone else's code

```markdown
Explain <file or folder> to me like I'm new to <framework>.
What does it do, how does the data flow through it, and which parts
would I change to <goal>? Don't change anything.
```

### Before committing

```markdown
Look at my uncommitted changes (git diff). Is there anything risky:
leftover debug code, hardcoded secrets, broken edge cases?
Then write a conventional commit message: `type(scope): summary`,
imperative, under 72 characters. Types: feat, fix, docs, chore.
```

## Finishing

### Write the README

```markdown
Write a README.md for this project for hackathon judges. Include: a one-line
description, a placeholder for a screenshot, the live demo link <url>,
the problem it solves, how it works (stack + one short diagram), how to run it
locally, what's mocked, next steps, and the team: <names>.
Keep it short and specific; no marketing language.
```

### Write the pitch

```markdown
Here's our project: <description>. Judging criteria: <criteria>.
Write a 3-minute pitch: problem (40s), live demo steps (100s),
how it works (20s), what's next (20s). Start with a real person's problem,
not "Hi, we're team X". Then list 5 questions judges might ask with short answers.
```

### Get judged before the judges

```markdown
Act as a strict hackathon judge. Criteria: <criteria>.
Here's our README and pitch: <paste>.
Score each criterion out of 10, say what would lose us points,
and give the 3 changes that would help most in the next <hours> hours.
```

### Check you're ready

```markdown
We're submitting in <time>. Check: does the build pass, are any secrets
committed, is every environment variable in .env.example, does the README
have run instructions and the demo link, is everything committed and pushed?
Report problems; don't fix anything without asking.
```

(The [demo-check skill](skills.md#demo-check) does this.)
