# Learn the essentials (in the right order)

> You do not need to "learn to code" before your first hackathon. You need to learn **six things** well enough to ship a small web app.

## Priority order

### 1. Terminal basics (1 hour)
You need maybe 12 commands.

```bash
cd, ls, mkdir, pwd        # move around
git clone, git status     # get code
npm install, npm run dev  # run code
code .                    # open the folder in VS Code
```

That's genuinely most of it. Everything else you can look up.

### 2. Git (2 hours)
Enough to not lose work:

```bash
git status                 # what changed?
git add -A                 # stage everything
git commit -m "message"    # save a snapshot
git push                   # upload
git pull                   # get teammates' work
```

Then read [../guide/04-git-with-a-team.md](../guide/04-git-with-a-team.md) for the team workflow.

### 3. HTML + CSS (a weekend, skim it)
You need: elements, classes, flexbox, and how to read a Tailwind class. You do **not** need to master CSS grid or animations.

Use **Tailwind** and **shadcn/ui** so it looks good without design skills.

### 4. JavaScript or Python (the big one)
Pick **one**. JavaScript if you want the web; Python if you want data/ML.

You need: variables, functions, arrays/objects (or lists/dicts), `if`, `for`, `fetch` (or `requests`), and how to read an error message.

### 5. React (2–4 hours to be productive)
Components, props, `useState`, `useEffect`, and mapping over a list. That's enough to build a hackathon UI.

If React feels like too much: **plain HTML + a bit of JS** is a legitimate hackathon stack and deploys in seconds.

### 6. One deploy (30 minutes)
```bash
npx vercel
```
If you can do this, you can show your work. That's the whole game.

---

## Learning resources worth your time

| Resource | Why |
| --- | --- |
| **MDN Web Docs** | The actual reference. Read it instead of random blogs. |
| **javascript.info** | Best structured JS course, free |
| **React docs (react.dev)** | The new docs are excellent, start with "Learn React" |
| **Tailwind docs** | Search-first; you'll live in this tab |
| **Next.js "Learn" course** | Free, builds a real app |
| **FastAPI docs** | If you're doing Python APIs |
| **The Odin Project** | Full free web-dev curriculum, if you want depth |
| **CS50** | If you want the fundamentals properly |
| **Exercism** | Small exercises, good for syntax fluency |

Skip for now: LeetCode, system design, Kubernetes, "100 days of code" playlists.

---

## What to learn *during* the hackathon

- How to read someone else's code
- How to ask a good question (error + what you tried + what you expected)
- How to scope under time pressure
- How to demo

These matter more than any framework, and you can only learn them by doing one.

---

## A 2-week prep plan

If your hackathon is in two weeks and you know nothing:

| Day | Do this |
| --- | --- |
| 1 | Install everything: [setup/](../setup/) · `git`, `node`, VS Code working |
| 2 | Terminal + git basics. Make a repo, push a file. |
| 3–4 | HTML/CSS + Tailwind. Build a static page. |
| 5–6 | JavaScript basics. Fetch an API, render the result. |
| 7 | Deploy the page to Vercel. Open it on your phone. |
| 8–9 | React basics: components, state, list rendering. |
| 10 | Build a tiny app: input → API → list. Deploy it. |
| 11 | Read [../guide/](../guide/) end to end. |
| 12 | Team up, pick an idea, write the pitch using [../templates/PITCH.md](../templates/PITCH.md). |
| 13 | Build a skeleton of that idea. Deploy it. Sleep. |
| 14 | Hackathon. |

You won't be an expert. You'll be able to contribute, which is the actual goal.

---

## The honest truth

Most people at their first hackathon don't know what they're doing. The ones who do well are the ones who **scope small, ship early, and ask for help**. Technical skill is third on that list.

Back to → [README](../README.md)
