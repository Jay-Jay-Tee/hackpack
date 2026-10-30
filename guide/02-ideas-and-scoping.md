# 2. Ideas and scoping

Over-scoping is the most common way to run out of time, and it's what went wrong at my first hackathon. Most of this page is about avoiding it.

## Picking an idea

Have everyone bring two ideas, then take no more than an hour to decide. Drop ideas that:

- need data you don't already have
- need hardware you can't get at the event
- only make sense with several separate features

For what's left, ask whether you could show it working in two minutes, and whether you could build the core in about twelve hours. If two ideas are tied, pick the one the team is more interested in.

## One main feature

Decide on the one thing you'll show the judges and write it down in a sentence. Build that first and make it work properly. Everything around it (login, settings, a landing page) only needs to be good enough not to get in the way.

## Must, should, won't

Before writing code, make three lists:

- **Must**: the demo doesn't work without it. Keep this short.
- **Should**: worth doing once the musts are done and deployed.
- **Won't**: out of scope. Write it in the README.

At the halfway point, anything not started moves to "won't".

## A rough timeline for 36 hours

Scale it down for shorter events.

| Hours | |
| --- | --- |
| 0–1 | Idea, scope, repo, deploy a blank page |
| 1–2 | Skeleton, data model, one screen |
| 2–14 | Build the main feature. Hardcode things if it helps. |
| 14–17 | Sleep |
| 17–26 | Connect everything so the main path works end to end |
| 26–30 | Fix and polish the demo path only |
| 30–32 | Record a backup video, finish the README, submit |
| 32–34 | Practise the pitch |
| After | Buffer for whatever breaks |

## Checking in

Every few hours, ask:

- If we had to demo right now, what would we show?
- What's most likely to break the demo? Fix that next.
- Is anyone working on something the judges won't see?

## Ideas that usually go badly

- Marketplaces and other two-sided platforms. You can realistically only demo one side.
- Anything behind a sign-up. Judges won't create an account; use a demo account or skip auth.
- APIs that need approval. Mock them and say so.
- Redesigns or pivots after the halfway point.
