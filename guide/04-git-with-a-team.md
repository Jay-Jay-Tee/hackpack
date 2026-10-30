# 4. Git with a team

New to Git? Read [What is Git?](../git/what-is-git.md) and do [Your first repo](../git/first-repo.md) first. This page is about working as a team during the event.

## Setting up the repo

One person creates it:

```bash
git init
git add .
git commit -m "initial scaffold"
gh repo create my-project --public --source=. --push
```

Everyone else clones it:

```bash
gh repo clone <owner>/my-project
```

Everyone should have these set:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global pull.rebase false
```

`push.autoSetupRemote` means you don't need `--set-upstream` the first time you push a branch. A list of everyday commands is in [resources/commands.md](../resources/commands.md).

## .gitignore

Commit a `.gitignore` before anyone installs dependencies. You can start from the one in [this repo](https://github.com/Jay-Jay-Tee/hackpack/blob/main/.gitignore).

Don't commit `node_modules/`, `venv/`, `dist/`, `build/`, `.env` or key files. Do commit lockfiles (such as `package-lock.json`) and a `.env.example` that lists variable names with placeholder values:

```bash
# .env (not committed)
OPENAI_API_KEY=sk-real-key

# .env.example (committed)
OPENAI_API_KEY=your-key-here
```

If you push a key by accident, revoke it in the provider's dashboard straight away and make a new one. Removing it from git history doesn't help much once it's public; revoking does.

## Branches

**Two or three people**: everyone can work on `main` if you're working in different files.

```bash
git pull
# work, then:
git add -A
git commit -m "add upload page"
git pull
git push
```

**More people**: one branch each, merged through pull requests.

```bash
git switch -c upload-page
# work and commit
git push
# open a PR on GitHub and merge it
```

Merge into `main` every few hours, not once at the end.

## Merge conflicts

A conflict means two people changed the same lines. Git marks them in the file:

```
<<<<<<< HEAD
  <YourVersion />
=======
  <TheirVersion />
>>>>>>> upload-page
```

Edit the file so it says what it should (often a mix of both), delete the marker lines, then run `git add <file>` and `git commit`. VS Code shows buttons above each conflict for picking one side or both.

If it gets confusing, `git merge --abort` puts you back where you were before the pull.

## Undoing things

| To | Run |
| --- | --- |
| Unstage a file | `git restore --staged <file>` |
| Discard changes to a file | `git restore <file>` |
| Undo the last commit but keep the changes | `git reset --soft HEAD~1` |
| See what's staged | `git diff --staged` |
| Undo a commit that's already pushed | `git revert <sha>` |
| Put changes aside for a moment | `git stash`, then `git stash pop` |
| Find a commit you thought you'd lost | `git reflog` |

## At the end

- Tag the submitted version: `git tag v1.0 && git push --tags`.
- Stop pushing to `main` after submission. Judges may look at the repo.
- Make the repo public if the rules require it.
- Add screenshots and run instructions to the README.
- Don't force-push to shared branches.
