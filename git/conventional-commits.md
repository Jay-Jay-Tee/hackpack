# Conventional commits

A commit message like `fix stuff` tells nobody anything. **Conventional commits** are a small, fixed shape for the message so that anyone reading the history, including a judge, can tell what happened without opening the diff.

```
type(scope): summary
```

```
feat(upload): accept HEIC photos from iPhones
fix(auth): stop the redirect loop after refresh
docs(readme): add the seed data steps
```

![The same line broken into parts: feat is the type, upload in brackets is the scope, and accept HEIC photos is the summary](../assets/img/commit-message.svg)
*Three parts, in a fixed order. Only the summary changes much between commits.*

- **type**: what kind of change it is, from a short fixed list
- **scope**: optional, the part of the project; `upload`, `auth`, `api`, `landing`
- **summary**: what changed, in the imperative ("add", not "added")

## The types

| Type | Use it for | Hackathon example |
| --- | --- | --- |
| `feat` | A new feature users can see | `feat(chat): stream replies as they generate` |
| `fix` | A bug fix | `fix(upload): reject files over 10 MB` |
| `docs` | README, comments, this kind of doc | `docs(readme): add the demo link` |
| `style` | Formatting or CSS only, no behaviour change | `style(landing): tighten the hero spacing` |
| `refactor` | Code reshaped, behaviour unchanged | `refactor(api): move weather calls into lib/weather.ts` |
| `perf` | Made something faster | `perf(search): debounce the query by 250ms` |
| `test` | Tests only | `test(scoring): cover the tie-break case` |
| `chore` | Housekeeping: deps, config, removing logs | `chore: remove leftover console.log calls` |
| `ci` | Build or deploy config | `ci: deploy previews on pull requests` |
| `build` | Build system or dependencies | `build: pin Node to 22` |
| `revert` | Undoing a commit | `revert: feat(chat): stream replies` |

You won't use all of them. At a hackathon, `feat`, `fix`, `docs` and `chore` cover almost everything.

## Writing the summary

- **Imperative**: "add", "fix", "remove", not "added", "fixes", "removing". It should finish the sentence *"If applied, this commit will…"*.
- **Lowercase**, no full stop at the end. It's a label, not a sentence.
- **Short**: aim for under 72 characters, so it doesn't wrap in `git log --oneline`.
- **Specific**: say what changed and where.

| Instead of | Write |
| --- | --- |
| `fixed stuff` | `fix(upload): handle files over 10 MB` |
| `update` | `docs(readme): explain how to run the seed script` |
| `wip` | `feat(chat): send a message and show the reply` |
| `asdf` | `chore: remove leftover console logs` |
| `final` | `feat(pitch): add the demo countdown` |

Resist `wip` and `final`. If a commit isn't finished, commit it on a branch and squash or amend later; if it is finished, say what it does.

## The body, when you need one

The first line is the title. If the change needs explaining, add a blank line and then the why:

```bash
git commit -m "fix(upload): fall back to sample data when the API is down" -m "The venue wifi dropped twice during testing and the demo page went blank. It now shows saved data with a note instead of an error."
```

- The title says **what**; the body says **why**.
- Wrap the body at about 72 characters.
- Skip the body for obvious changes.

## Breaking changes

If the change breaks something that used to work (an API shape, a database column, a config name), mark it with `!` and explain in a footer:

```
feat(api)!: return forecast as a list instead of a map

BREAKING CHANGE: /forecast now returns an array, so the frontend's
data.hours lookup had to change too.
```

At a hackathon this matters less than in a library, but it's worth knowing when you see a `!` in someone else's history.

## Why it's worth the ten seconds

- **Judges skim.** A history full of `feat:`, `fix:` and `docs:` looks like a team that shipped. A history of `update`, `update`, `update` looks like nothing happened.
- **You can find things later.** `git log --oneline --grep="^fix"` shows every bug fix. `git log --oneline --grep="upload"` shows everything that touched uploads.
- **It forces smaller commits.** You can't describe a change in one line if it's really six changes.
- **Tools can read it.** Changelogs, release notes and version bumps can be generated from the messages.
- **The AI can follow it.** Put the rule in your `AGENTS.md` and it writes messages in the same style (see [Instruction files](../ai/instruction-files.md)).

## Using it day to day

You don't type the whole thing from memory. After staging:

```bash
git commit -m "feat(upload): accept HEIC photos from iPhones"
```

Check the last few messages any time:

```bash
git log --oneline -10
```

If you already committed and the message is wrong, and you haven't pushed yet:

```bash
git commit --amend -m "fix(upload): accept HEIC photos from iPhones"
```

That replaces the last commit, message included. If you have pushed, don't amend a shared branch; leave it, or ask before rewriting history. See [Fixing mistakes](fixing-mistakes.md).

## Adopting it halfway through

You don't need to rewrite old commits. Start with the next one. If the team agrees, add one line to the README or `AGENTS.md`:

```markdown
## Commit messages

Follow Conventional Commits: `type(scope): summary`, imperative mood,
lowercase, no full stop. Types we use: feat, fix, docs, chore.
```

Then asking an AI agent for a message is one line:

> Look at `git diff --staged` and write a conventional commit message for it.

## Don't over-engineer it

You don't need commitlint, husky hooks or a CI check at a hackathon. The point is a readable history, not passing a linter. If the team has never heard of this and you're six hours in, matching their style beats starting a formatting argument.

---

Next: [SSH keys](ssh.md) (optional), then [Fixing mistakes](fixing-mistakes.md).
