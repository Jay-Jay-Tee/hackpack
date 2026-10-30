# What is GitHub?

GitHub is a website that stores Git repositories online. Git keeps the history on your laptop; GitHub keeps a copy on the internet so your team can share it, and adds tools for working together.

| Git | GitHub |
| --- | --- |
| A program on your computer | A website (github.com) |
| Tracks history in a folder | Hosts copies of those folders online |
| Works offline | Needs internet |
| Free and open source | A company (owned by Microsoft), free for most uses |

You can use Git without GitHub. You can't really use GitHub without Git. Other sites do the same job (GitLab, Bitbucket), but GitHub is what nearly every hackathon uses.

## How your laptop and GitHub talk

```
  your laptop                              GitHub
 ┌─────────────┐     git push  ──────▶   ┌─────────────┐
 │  local repo │                          │ remote repo │
 │  (commits)  │     ◀──────  git pull    │  "origin"   │
 └─────────────┘                          └─────────────┘
        ▲                                        │
        │            git clone (first time)      │
        └────────────────────────────────────────┘
```

- **`git clone`**: download a repo from GitHub to your laptop, once.
- **`git push`**: upload your new commits.
- **`git pull`**: download commits other people pushed.

Your teammates do the same with their own copies. GitHub is the shared meeting point.

## What's on a repo page

When you open a repo on GitHub, you'll see:

- **Code**: the files, with the `README.md` shown underneath. This is the first thing judges see.
- **Commits**: the history, with who changed what.
- **Branches**: the lines of work that exist.
- **Issues**: a to-do and bug list. Useful for splitting work in a team.
- **Pull requests**: proposed changes waiting to be merged (below).
- **Actions**: automated jobs, like running tests or deploying. You won't need these at a first hackathon.
- **Settings**: including **Collaborators**, where you add teammates so they can push.

## Pull requests (PRs)

A pull request says: "I've made changes on a branch; please merge them into `main`." It shows every changed line, and teammates can comment or approve before merging.

```
1. make a branch        git switch -c results-page
2. commit and push      git push
3. open a PR            gh pr create   (or the green button on GitHub)
4. someone reviews it   comments, approves
5. merge it             "Merge pull request" button, or gh pr merge
6. everyone pulls       git pull on main
```

In a 2-person team you can skip PRs and push straight to `main`. With 3 or more people, PRs stop you from overwriting each other's work.

## Forks

A fork is your own copy of someone else's repo, on your account. You'd fork a project to change it without permission to the original, for example to contribute to open source or to build on a starter template. At a hackathon you usually just create your own repo instead.

## Public or private

- **Public**: anyone can see the code. Most hackathons require this for judging, and it's good for your portfolio.
- **Private**: only people you invite. Fine during the event if the rules allow it, but check whether judges need access.

Never put API keys or passwords in a public repo. Bots scan GitHub for them within minutes.

## Other things GitHub gives you

- **Your profile** (github.com/your-username): a public record of your projects. Recruiters do look at it. Pin your best repos.
- **README rendering**: any `.md` file shows formatted. Write a good README; see the [template](../templates/README.template.md).
- **GitHub Pages**: free hosting for static websites, straight from a repo. This site runs on it.
- **GitHub Desktop**: a free app if you prefer clicking to commands. VS Code's Source Control panel does most of the same.
- **The Student Developer Pack**: free tools and credits, including Copilot. See [free stuff](../resources/free-stuff.md).

## The GitHub CLI (`gh`)

A command-line tool for GitHub itself (Git doesn't know about PRs or repos on GitHub). The commands you'll use:

```bash
gh auth login                                   # log in once
gh repo create my-app --public --source=. --push  # put this folder on GitHub
gh repo clone owner/my-app                      # download a repo
gh pr create                                    # open a pull request
gh pr merge                                     # merge it
gh repo view --web                              # open the repo in your browser
```

