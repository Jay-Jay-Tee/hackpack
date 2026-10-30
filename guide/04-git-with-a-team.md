# 04 · Git with a team (without losing code)

> Most "we lost our work" stories are git stories. Ten minutes of setup prevents all of them.

## Hour-zero setup

One person, once:

```bash
git init
git add .
git commit -m "chore: initial scaffold"
gh repo create my-project --public --source=. --push
```

Everyone else:

```bash
gh repo clone <owner>/my-project
# or: git clone https://github.com/<owner>/my-project.git
```

Then, on **every** machine:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true
```

That last one saves you from `--set-upstream` forever. My full config is in [../dotfiles/.gitconfig](../dotfiles/.gitconfig).

## The `.gitignore` rule

Before anyone installs anything, commit a `.gitignore`. Copy [../.gitignore](../.gitignore) or generate one:

```bash
# pick your stack at https://www.toptal.com/developers/gitignore
```

**Never commit:**

- `node_modules/`, `venv/`, `dist/`, `build/`
- `.env`, `*.key`, `*.pem`, API tokens
- `.DS_Store`, `Thumbs.db`

**Do commit:**

- `.env.example` — a plain file listing the variable *names* with fake values
- `README.md` — with how to run it
- Lockfiles (`package-lock.json`, `bun.lockb`, `poetry.lock`) — yes, commit these in a team

## Secrets: the one thing that can disqualify you

```bash
# .env  (never committed)
OPENAI_API_KEY=sk-real-key-here

# .env.example  (committed)
OPENAI_API_KEY=sk-your-key-here
```

If you leak a key mid-event:

1. **Revoke it immediately** in the provider's dashboard.
2. Generate a new one.
3. If it's already pushed, tell your team. Rewriting history is rarely worth the time — revoking is.

Some events auto-scan public repos for keys. A leaked key can get you disqualified.

## Branch strategy for 36 hours

Keep it dumb. Complexity is the enemy.

**Option A — everyone on `main` (small teams, 2–3 people):**

```bash
git pull --rebase     # before you start
# ...work...
git add -A && git commit -m "feat: upload screen"
git pull --rebase     # again, right before pushing
git push
```

Fine if you're splitting by files and talking constantly.

**Option B — one branch per person (3+ people):**

```bash
git switch -c feat/auth
# ...work in small commits...
git push -u origin feat/auth
# open a PR on GitHub, someone approves, squash-merge
```

Merge to `main` **at least every few hours**, not once at the end.

## Commit messages that help at 3am

```
feat: add photo upload to recipe page
fix: stop crash when upload is empty
chore: bump deps
docs: add setup steps to README
wip: half-done stripe checkout   ← fine during a hackathon
```

Short, present tense, says *what changed*. Future-you will be grateful.

## Merge conflicts without panic

A conflict means two people edited the same lines. It's normal.

```bash
git pull --rebase
# CONFLICT in src/app/page.tsx
```

Open the file. You'll see:

```
<<<<<<< HEAD
  <YourVersion />
=======
  <TheirVersion />
>>>>>>> feat/auth
```

1. Decide what the code should actually say (often both, combined).
2. Delete the `<<<<<<<`, `=======`, `>>>>>>>` lines.
3. `git add <file>` then `git rebase --continue` (or `git commit`).

VS Code highlights conflicts with "Accept Current / Incoming / Both" buttons — use them, then read the result.

**If it gets hairy:** `git rebase --abort` and go back to where you were. Nothing is lost.

## Undo cheat sheet

| You want to… | Command |
| --- | --- |
| Unstage a file | `git restore --staged <file>` |
| Throw away local changes to a file | `git restore <file>` |
| Undo the last commit, keep the changes | `git reset --soft HEAD~1` |
| See what you're about to commit | `git diff --staged` |
| Find a lost commit | `git reflog` |
| Revert a pushed bad commit | `git revert <sha>` |
| Save work without committing | `git stash` / `git stash pop` |

`git reflog` + `git reset --hard <sha>` has rescued more hackathon projects than any other command. Learn it.

## The end-of-event freeze

When submissions close:

1. **Tag it:** `git tag v1.0 && git push --tags`
2. **Stop pushing to `main`.** Judges may look at the repo.
3. Make sure the repo is **public** if the rules require it (check — some don't).
4. Add screenshots + a "How to run" section to the README. Judges read it.
5. Keep the deployed URL alive.

## Team hygiene checklist

- [ ] Everyone can push to the repo (test it in the first hour)
- [ ] `.gitignore` committed before `node_modules`
- [ ] `.env.example` committed, `.env` ignored
- [ ] `main` deploys automatically
- [ ] Someone is responsible for merging
- [ ] Nobody force-pushes to `main` (`git push --force-with-lease` at most, and never on shared branches)
- [ ] Repo is public before the deadline

---

Next → [05-ai-tools.md](05-ai-tools.md)
