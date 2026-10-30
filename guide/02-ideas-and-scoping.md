# 02 · Ideas and scoping

> The #1 way first-timers lose: they pick an idea that needs two weeks, then try to build it in one night.

## Pick an idea in 45 minutes, not 4 hours

Have each person bring **two ideas** before you talk. Then:

1. **Kill anything that needs a dataset you don't have.** If the idea starts with "we'll collect data…" it's dead.
2. **Kill anything that needs a hardware you can't borrow.**
3. **Kill anything with more than one "and".** "An app that tracks expenses *and* predicts budgets *and* splits bills *and*…" — no.
4. **Score the survivors** on: can we demo it in 2 minutes? · can we build the core in 12 hours? · would a judge remember it tomorrow?

Tie-breaker: pick the one the whole team is a little excited about. Motivation is a real resource at hour 30.

## The one-wow rule

A winning demo usually has **one** thing that makes people lean in, plus enough scaffolding to make it feel real.

| ✅ One wow + scaffolding | ❌ Five half-features |
| --- | --- |
| A working core, one delightful moment, fake data that looks real | Five buttons, four of which throw errors on stage |

Write your wow down in one sentence. If you can't, you don't have one yet.

> **Example:** "Upload a photo of your fridge, get three recipes." Wow = the photo → recipe moment. Scaffolding = login, saved recipes, a nice landing page. You do **not** need real inventory tracking, nutrition data, or a shopping list API.

## Scope it like an engineer

Write three lists **before** you write code:

**Must** — the demo cannot happen without these. Keep it under 5 items.
**Should** — makes it feel complete. Do these only if Must is done and deployed.
**Won't** — explicitly out of scope. Say it out loud. Put it in the README under "Not built".

Then apply the **cut list**: at the halfway point of your time, anything not started becomes Won't. No negotiation.

## The 36-hour shape

Adjust to your event length, but keep the ratios.

| When | What |
| --- | --- |
| Hour 0–1 | Idea, scope, repo, deploy "hello world" |
| Hour 1–2 | Skeleton: routes, DB schema, one fake screen |
| Hour 2–14 | Build the wow. Ugly is fine. Hardcode everything. |
| Hour 14–17 | **Sleep.** Actually sleep. |
| Hour 17–26 | Connect the pieces, make the happy path work end-to-end |
| Hour 26–30 | Polish *only* the demo path. Nothing else. |
| Hour 30–32 | Record backup video, write README, submit (early!) |
| Hour 32–34 | Rehearse the pitch twice, out loud, with a timer |
| Hour 34+ | Buffer. Something will break. |

## Ruthless prioritisation questions

Ask these every few hours:

- What will the judge *see*? Is that thing working right now?
- If we stopped and demoed this instant, what score do we get?
- What is the single biggest risk to that demo? Fix that next, not the fun thing.
- Are we building a feature, or are we polishing a feature nobody will see?

## Anti-patterns

- **The platform.** "A marketplace for X" needs two sides to exist. Demo one side beautifully.
- **The login wall.** Judges won't sign up. Have a demo account pre-filled, or no auth at all.
- **The real integration.** If the API needs approval, mock it and label it. Swap it in later if you get access.
- **The redesign at hour 28.** Never. Polish the demo path only.
- **The 11th-hour pivot.** If you're pivoting after the halfway mark, you're not pivoting, you're panicking.

---

Next → [03-building.md](03-building.md)
