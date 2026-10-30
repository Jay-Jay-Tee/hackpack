# Fixing mistakes in Git

Almost nothing in Git is truly lost once it's been committed. Find what happened below.

Before doing anything drastic, run `git status`. It often tells you the exact command to fix the situation.

## I haven't committed yet

**I want to throw away my changes to one file**

```bash
git restore path/to/file
```

The file goes back to how it was at the last commit. This can't be undone, so be sure.

**I want to throw away all my uncommitted changes**

```bash
git restore .
```

New files you created aren't removed by this. To delete those too: `git clean -n` shows what would be deleted, `git clean -f` deletes it.

**I staged a file by accident**

```bash
git restore --staged path/to/file
```

The change stays in your file; it's just not staged any more.

**I need to switch branches but I'm in the middle of something**

```bash
git stash         # put changes aside
git switch other-branch
# ...later, back on your branch:
git stash pop     # bring them back
```

## I committed, but haven't pushed

**The commit message is wrong**

```bash
git commit --amend -m "better message"
```

**I forgot to include a file**

```bash
git add forgotten-file
git commit --amend --no-edit
```

**I want to undo the last commit but keep the changes**

```bash
git reset --soft HEAD~1
```

The commit disappears and its changes are back in staging, ready to fix and commit again.

**I committed to the wrong branch**

```bash
git log --oneline -1           # copy the commit ID
git switch right-branch
git cherry-pick <commit-id>    # copies the commit here
git switch wrong-branch
git reset --hard HEAD~1        # removes it from the wrong branch
```

## I already pushed

Don't rewrite history that teammates may have pulled. Add a new commit that undoes the bad one instead:

```bash
git log --oneline              # find the bad commit's ID
git revert <commit-id>
git push
```

**I pushed a secret (API key, password)**

1. **Revoke it now** in the provider's dashboard and make a new one. This is the only step that really matters; bots find keys in public repos within minutes.
2. Put the new key in `.env` (not committed) and make sure `.env` is in `.gitignore`.
3. Remove the key from the code and commit.

Removing it from history is possible but fiddly, and pointless once the key is revoked.

## Pushing and pulling problems

**`git push` says "rejected" / "fetch first"**

Someone pushed before you. Get their work, then push:

```bash
git pull
git push
```

**`git pull` says "Your local changes would be overwritten"**

```bash
git stash
git pull
git stash pop
```

**`git pull` asks how to reconcile divergent branches**

Your local branch and GitHub both have new commits. Tell Git to merge them (once, for all repos):

```bash
git config --global pull.rebase false
git pull
```

**I'm in the middle of a merge and want out**

```bash
git merge --abort
```

You're back to before the merge started.

## Something is really wrong

**I deleted a branch / reset too far / lost a commit**

Git keeps a log of everywhere `HEAD` has been, even for commits that seem gone:

```bash
git reflog
```

```
9c2e1f0 HEAD@{0}: reset: moving to HEAD~3
a4b8d21 HEAD@{1}: commit: add results page   ← the one you lost
```

Get it back:

```bash
git switch -c rescued a4b8d21
```

**"detached HEAD"**

You've checked out an old commit instead of a branch. Look around freely; to go back:

```bash
git switch main
```

If you made commits while detached and want to keep them, make a branch first: `git switch -c keep-this`.

**The repo is a mess and the deadline is close**

Make sure everything good is pushed somewhere. Then clone a fresh copy into a new folder and carry on there. It's not elegant, but it works.

```bash
cd ..
gh repo clone your-name/your-repo your-repo-fresh
```

## Habits that prevent most of this

- Run `git status` before and after anything.
- Commit small and often.
- Pull before you start working, and before you push.
- Commit before letting an AI agent edit your code.
- Never `git push --force` to a shared branch.
