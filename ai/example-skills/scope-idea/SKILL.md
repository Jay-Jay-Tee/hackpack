---
name: scope-idea
description: Turns a rough hackathon project idea into a plan a small team can build in time, with must/should/won't lists, a demo script and a timeline. Use when the user describes a hackathon idea, asks what to build first, or asks whether an idea is too big.
---

# Scope a hackathon idea

The goal is a project that can be demoed working in two minutes, not a complete product.

## 1. Fill in what's missing

If the user hasn't said these, ask in a single message (at most 5 questions), then wait for answers:

- How long is the event, and how much time is left?
- How many people are on the team, and what can each of them do?
- What are the judging criteria or prize tracks, if known?
- What stack does the team already know?
- Is there a sponsor API or theme they need to use?

## 2. Find the one main feature

State in one sentence the single thing the demo will show. If the idea needs several unrelated features to make sense, say so and suggest the strongest one to keep.

## 3. Write the plan

Use exactly these sections:

### Main feature
One sentence.

### Must
At most 5 items. The demo doesn't work without them.

### Should
Only if the musts are done and deployed.

### Won't
Things that are explicitly out of scope. Include anything that needs approval from an outside service, a large dataset, or hardware the team doesn't have, and suggest mocking it instead.

### Demo script
The exact steps the presenter will click through, in order, in under two minutes.

### Timeline
A rough plan by hours for the time left, with deployment in the first hour and submission at least two hours before the deadline.

### Biggest risks
The two or three things most likely to break the demo, and a fallback for each.

## Rules

- Be honest if the idea is too big. Cutting scope is the most useful thing you can do here.
- Prefer the team's existing skills over new technology.
- Don't write code in this skill. Planning only.
