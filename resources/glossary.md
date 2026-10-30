# Glossary

Words people at hackathons say as if everyone already knows what they mean.

**API**: a way for one program to ask another for data or to do something. "Calling the weather API" means your code sends a request to a weather service and gets data back. See [APIs](../basics/apis.md).

**API key**: a password that identifies your app to an API. Keep it secret: put it in `.env`, never in code you commit.

**Backend**: the part of an app that runs on a server: saving data, calling APIs, checking logins. The **frontend** is what runs in the user's browser. See [Frontend and backend](../basics/frontend-backend.md).

**Boilerplate**: repetitive code that every project needs and that's similar each time, like a sign-up form.

**Branch**: a separate line of work in Git. You can make changes on a branch without affecting `main`, then merge them in.

**Clone**: download a copy of a repo from GitHub to your computer.

**Commit**: a saved snapshot of your code in Git, with a message describing the change.

**Conventional commits**: a fixed shape for commit messages, `type(scope): summary`, so the history is readable at a glance. See [Conventional commits](../git/conventional-commits.md).

**CRUD**: Create, Read, Update, Delete; the four basic things most apps do with data.

**Database**: where an app stores data permanently, such as users or posts. A **schema** describes what the data looks like (tables and fields). See [Databases](../basics/databases.md).

**Dependency / package**: code written by someone else that your project uses, installed with `npm install` or `pip install`.

**Deploy**: put your app on the internet so anyone can open it with a link. See [Deploying](../basics/deploying.md).

**Dev server**: a copy of your app running on your own computer while you work on it, usually at an address like `http://localhost:3000`. See [How the web works](../basics/how-the-web-works.md#localhost-and-ports).

**Docker / container**: a way to run software in a self-contained box that includes everything it needs, so it works the same on every computer. See [Docker](../setup/docker.md).

**Endpoint / route**: a specific URL on your backend that does one thing, such as `/api/upload`. See [APIs](../basics/apis.md).

**Environment variables / `.env`**: settings and secrets (like API keys) kept outside your code. Locally they go in a `.env` file, which isn't committed; on the hosting site you enter them in its settings. See [Stacks](../basics/stacks.md#environment-variables).

**Framework**: a set of tools and conventions for building a type of app. Next.js and FastAPI are frameworks. See [Stacks](../basics/stacks.md).

**Frontmatter**: settings at the top of a Markdown file between two `---` lines, like a skill's name and description.

**HTTP**: the format browsers and servers use to send requests and responses. See [How the web works](../basics/how-the-web-works.md).

**Instruction file**: a Markdown file such as `CLAUDE.md` or `AGENTS.md` that an AI agent reads at the start of every session. See [Instruction files](../ai/instruction-files.md).

**JSON**: a text format for data, like `{"name": "Priya"}`, used by almost every API. See [APIs](../basics/apis.md#json).

**Markdown**: plain text with symbols for formatting, saved as `.md`. See [Writing Markdown](../ai/markdown.md).

**Merge conflict**: when two people changed the same lines and Git needs you to choose what the final version should be.

**Mock**: fake data or a fake response used in place of a real service, for example when an API isn't available yet.

**`node_modules`**: the folder where npm puts dependencies. It's large and never committed; `npm install` recreates it.

**PATH**: the list of folders your terminal looks in to find commands. If a newly installed command isn't found, the terminal usually needs restarting.

**Pull request (PR)**: a request on GitHub to merge one branch into another, where teammates can look at the changes first.

**Push / pull**: upload your commits to GitHub / download your teammates' commits.

**Rate limit**: a cap on how many requests you can send to an API in a period of time.

**Repo (repository)**: a project folder tracked by Git, usually also stored on GitHub.

**Seed data**: sample data loaded into the app so it doesn't look empty.

**Skill**: a folder with a `SKILL.md` file that teaches an AI agent one procedure, loaded only when needed. See [Skills](../ai/skills.md).

**Smoke test**: a quick check that the main thing works at all, not a full set of tests.

**SSH key**: a pair of files that lets your laptop prove to GitHub (or a server) who you are without a password. See [SSH keys](../git/ssh.md).

**Stack**: the set of tools a project is built with: frontend, backend, database, hosting. See [Stacks](../basics/stacks.md).

**Status code**: the number a server sends back with a response: 200 worked, 404 not found, 500 server error. See [the full list](../basics/how-the-web-works.md#status-codes-worth-knowing).

**Stub**: a placeholder that returns a fixed value so the rest of the app keeps working while the real thing isn't done.

**Virtual environment (venv)**: a private set of Python packages for one project, so projects don't interfere with each other.
