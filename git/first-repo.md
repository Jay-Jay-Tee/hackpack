# Your first repo

A walkthrough from an empty folder to a merged pull request. Do it once before the hackathon and none of it will be new on the day. Takes about 20 minutes.

You need Git and the GitHub CLI installed and logged in ([setup](../setup/)). Type the commands yourself rather than copying; it sticks better.

## 1. Make a folder and turn it into a repo

```bash
mkdir git-practice
cd git-practice
git init
```

Git replies `Initialized empty Git repository`. (If `git status` below says `master` instead of `main`, run `git config --global init.defaultBranch main` and start again in a new folder.) The folder is now a repo, with an empty history.

```bash
git status
```

```
On branch main
No commits yet
nothing to commit
```

## 2. Make a file and commit it

Create a file called `notes.md` with some text in it (`code notes.md` opens it in VS Code). Save it, then:

```bash
git status
```

```
Untracked files:
        notes.md
```

"Untracked" means Git sees the file but isn't keeping history of it yet. Stage it and commit:

```bash
git add notes.md
git commit -m "add notes"
git log --oneline
```

```
3f2a1b9 (HEAD -> main) add notes
```

That's your first commit.

## 3. Add a .gitignore

Some files should never go into Git: secrets, installed packages, OS junk. List them in a file called `.gitignore`:

```bash
code .gitignore
```

Put this in it and save:

```
.env
node_modules/
.venv/
.DS_Store
```

Now make a fake secret to check it works:

```bash
echo "API_KEY=secret123" > .env
git status
```

`.env` doesn't appear. Git is ignoring it. Commit the `.gitignore`:

```bash
git add .gitignore
git commit -m "add gitignore"
```

## 4. Put it on GitHub

```bash
gh repo create git-practice --public --source=. --push
```

This creates the repo on GitHub, connects it as `origin`, and pushes your commits. Open it:

```bash
gh repo view --web
```

You'll see `notes.md` and `.gitignore`, but not `.env`.

## 5. Change something and look at the difference

Edit `notes.md`: change a line and add a new one. Then:

```bash
git diff
```

Lines starting with `-` were removed and lines starting with `+` were added. Commit and push:

```bash
git add -A
git commit -m "update notes"
git push
```

Refresh the GitHub page; the change is there. Click "commits" to see all three.

## 6. Work on a branch

```bash
git switch -c add-ideas
```

You're now on a new branch called `add-ideas`. Create `ideas.md` with a few lines, then:

```bash
git add -A
git commit -m "add ideas list"
git push
```

Switch back to `main` and look at your files:

```bash
git switch main
```

`ideas.md` is gone, because it only exists on the other branch. Switch back with `git switch add-ideas` and it reappears. Nothing's lost; you're looking at two versions of the project.

## 7. Open and merge a pull request

From the `add-ideas` branch:

```bash
gh pr create --fill
```

`--fill` uses your commit message as the title. Open the PR on GitHub (`gh pr view --web`) and look at the "Files changed" tab: this is what a teammate would review.

Merge it:

```bash
gh pr merge --merge --delete-branch
```

Then get the merged result on your laptop:

```bash
git switch main
git pull
```

`ideas.md` is now on `main`.

## 8. Cause a merge conflict on purpose

Conflicts are much less scary once you've made one deliberately.

```bash
git switch -c title-a
```

Change the first line of `notes.md` to `# Version A`, then commit:

```bash
git commit -am "title A"
git switch main
```

Change the same first line to `# Version B`, then commit and merge the other branch in:

```bash
git commit -am "title B"
git merge title-a
```

```
CONFLICT (content): Merge conflict in notes.md
```

Open `notes.md`. You'll see:

```
<<<<<<< HEAD
# Version B
=======
# Version A
>>>>>>> title-a
```

Change it to what you want (say `# Version A and B`), delete the three marker lines, save, then:

```bash
git add notes.md
git commit -m "merge title-a"
```

Done. That's all a conflict is.

## 9. Clean up

Delete the practice repo from GitHub when you're done if you like (repo → Settings → scroll to the bottom → Delete). On your laptop, just delete the folder.

## What you just learned

| Step | Command |
| --- | --- |
| Start a repo | `git init` |
| See what's going on | `git status`, `git diff`, `git log --oneline` |
| Save a snapshot | `git add`, `git commit -m "..."` |
| Ignore files | `.gitignore` |
| Put it on GitHub | `gh repo create ... --push` |
| Upload / download | `git push`, `git pull` |
| Branches | `git switch -c name`, `git switch main` |
| Pull requests | `gh pr create`, `gh pr merge` |
| Conflicts | edit the file, `git add`, `git commit` |

The messages in this walkthrough are plain on purpose. Once you're comfortable, [Conventional commits](conventional-commits.md) is the habit worth picking up, and the rest of the booklet uses it.

Next: [SSH keys](ssh.md) (optional), then [Fixing mistakes](fixing-mistakes.md) for when something goes wrong.
