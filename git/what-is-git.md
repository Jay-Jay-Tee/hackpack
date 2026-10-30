# What is Git?

Git is a program that keeps a history of your project. Every time you tell it to, it takes a snapshot of all your files and remembers it. Later you can see exactly what changed, go back to an old version, or work on two ideas at once without them interfering.

It runs on your computer and works offline. It isn't GitHub; that's next page.

## Why bother

Without Git, a project folder ends up like this:

```
project/
project-final/
project-final-v2/
project-final-v2-WORKING/
project-final-v2-WORKING-alex-changes/
```

With Git, there's one folder and a history inside it:

```
project/          ← always the current version
  (history: 47 snapshots, each with a note about what changed)
```

At a hackathon this means:

- You can undo a change that broke everything.
- Four people can work on the same project and combine their work.
- You can see who changed what, and when.

## The main ideas

### Repository (repo)

A folder that Git is tracking. Git keeps its history in a hidden `.git` folder inside it. You never edit `.git` yourself; deleting it deletes the history.

You turn a normal folder into a repo with `git init`, or you get a copy of an existing one with `git clone`.

### Commit

A snapshot of your project at one moment, with a short message describing what changed (the [conventional commits](conventional-commits.md) page is about writing a good one):

```
a1b2c3d  add photo upload page
e4f5a6b  fix crash when upload is empty
9c8d7e6  initial setup
```

Each commit has an ID (a long code like `a1b2c3d…`; the first 7 characters are usually enough) and remembers its author, its time and the commit before it. Commits are the save points you can go back to.

Commits don't happen automatically. You decide when to make one. A good habit is to commit every time something small works.

### The three places your changes can be

This is the part that confuses everyone at first. A change moves through three stages.

<figure class="diagram">
  <picture>
    <source srcset="{{ '/assets/img/diagrams/git-stages-dark.png' | relative_url }}" media="(prefers-color-scheme: dark)">
    <img src="{{ '/assets/img/diagrams/git-stages-light.png' | relative_url }}" alt="Diagram: the working folder holds the files you edit, the staging area holds what goes in the next commit, and history holds the commits you made. git add moves changes from the working folder to staging; git commit moves them from staging to history." width="1400" height="500">
  </picture>
  <figcaption>git status tells you which stage each file is in.</figcaption>
</figure>

1. **Working folder**: the files as you see them in VS Code. Editing a file changes it here.
2. **Staging area**: changes you've marked as "include these in the next commit", with `git add`.
3. **History**: once you `git commit`, the staged changes become a snapshot.

Why the middle step? So you can choose. If you changed five files but only two are ready, you add those two and commit them.

`git status` tells you what's in each stage. When in doubt, run it.

### Branch

A separate line of work. Every repo starts with one branch, usually called `main`. You can create another branch to try something without touching `main`:

```
main:         A ── B ── C
                         \
upload-page:              D ── E
```

Here someone made branch `upload-page` after commit C, and added commits D and E on it. `main` still stops at C. If the upload page doesn't work out, you can delete the branch and `main` was never affected.

### Merge

Combining one branch into another. When the upload page works, you merge `upload-page` into `main`:

```
main:         A ── B ── C ──────── F
                         \        /
upload-page:              D ── E
```

F is a merge commit that contains everything from both.

### Merge conflict

If two branches changed the same lines of the same file, Git can't decide which version to keep, so it asks you. It marks the spot in the file:

```
<<<<<<< HEAD
<h1>Recipe Snap</h1>
=======
<h1>RecipeSnap!</h1>
>>>>>>> upload-page
```

You edit the file to what it should be, delete the marker lines, then commit. This sounds scary, but it's routine. See [Git with a team](../guide/04-git-with-a-team.md#merge-conflicts).

### HEAD

Git's name for "where you are right now", usually the latest commit on the branch you're on. You'll see it in commands like `git reset --soft HEAD~1` ("one commit before where I am").

### Remote

A copy of the repo somewhere else, usually on GitHub. It's called `origin` by default. `git push` sends your commits to the remote, and `git pull` gets other people's commits from it.

## A day with Git, start to finish

```bash
git pull                         # get teammates' latest work
# ...edit files...
git status                       # see what you changed
git diff                         # see the actual lines that changed
git add -A                       # stage everything
git commit -m "add results page" # save a snapshot
git push                         # upload it
```

That's most of what you'll do. [Your first repo](first-repo.md) walks through it for real.

## What Git doesn't do

- **It doesn't save automatically.** No commit, no snapshot.
- **It doesn't back anything up by itself.** If your laptop dies and you never pushed, the history is gone. Push regularly.
- **It isn't good with big binary files** like videos or large datasets. Keep those out of the repo, or use a separate storage service.
- **It doesn't know about files you told it to ignore** (in `.gitignore`), which is how you keep secrets and `node_modules` out.

