# hackpack

A basic setup and some notes for people going to their first hackathon: getting a laptop ready with VS Code, Git, GitHub and an AI coding agent, the commands you'll use, and a short guide to the event itself.

Take whatever's useful and ignore the rest.

Never been to one? Read [What is a hackathon?](what-is-a-hackathon.md) first.

## Contents

New to coding setup? Start with [Start here](setup/start-here.md). It explains what each tool is and how to use the terminal.

<div class="cards">
<p><a class="c-intro" href="what-is-a-hackathon.html"><strong>What is a hackathon?</strong><br><span>What actually happens over the weekend, and what to expect.</span></a></p>
<p><a class="c-setup" href="setup/"><strong>Setup</strong><br><span>Git, VS Code and an AI agent, installed and tested on Windows, macOS or Linux.</span></a></p>
<p><a class="c-basics" href="basics/"><strong>How apps work</strong><br><span>The web, frontend and backend, APIs, databases and stacks, from zero.</span></a></p>
<p><a class="c-git" href="git/"><strong>Git and GitHub</strong><br><span>What they are, a hands-on first repo, SSH keys, and fixing mistakes.</span></a></p>
<p><a class="c-ai" href="ai/"><strong>Working with AI</strong><br><span>How it works, prompting, a prompt library, instruction files and skills.</span></a></p>
<p><a class="c-guide" href="guide/"><strong>Guide</strong><br><span>The event itself: preparing, scoping, building, the demo, and common mistakes.</span></a></p>
<p><a class="c-resources" href="resources/"><strong>Resources</strong><br><span>Commands, a glossary, free tiers, and public APIs and datasets.</span></a></p>
<p><a class="c-templates" href="templates/"><strong>Templates</strong><br><span>A README, a pitch outline, a checklist, and a finished example repo.</span></a></p>
<p><a class="c-scripts" href="scripts/"><strong>Scripts</strong><br><span>Install scripts for macOS and Windows, plus <code>check.sh</code>.</span></a></p>
<p><a class="c-extras" href="extras/"><strong>Extras</strong><br><span>Optional terminal styling from my Mac. Not needed.</span></a></p>
</div>

Website: <https://jay-jay-tee.github.io/hackpack/>. Source: <https://github.com/Jay-Jay-Tee/hackpack>.

## What you need

- Git, and a GitHub account with the GitHub CLI (`gh`) logged in
- VS Code
- Node.js (LTS), and Python if you'll use it
- At least one AI coding agent: Claude Code, Codex or GitHub Copilot
- A browser, and an account on Vercel or Netlify for deploying

## Getting started

Read [start here](setup/start-here.md), follow the setup page for your OS, then [VS Code](setup/vscode.md) and [AI agents](setup/ai-agents.md). Afterwards, on macOS or Linux:

```bash
git clone https://github.com/Jay-Jay-Tee/hackpack.git
cd hackpack
./scripts/check.sh
```

`check.sh` only lists what's installed and what's missing.

## If you only read one part

- Install and test everything a week before. Deploy a hello-world page so you know that works.
- Pick an idea you can demo in two minutes, and cut everything that isn't needed for that demo.
- Deploy in the first hour and keep the deployed version working.
- Keep `.env` and API keys out of git.
- Submit early. The submission deadline is usually before judging.
- Sleep at some point.

The rest is in [`guide/`](guide/01-before.md).

## Contact

Open an issue if something is wrong or unclear, or reach me at [@Jay-Jay-Tee](https://github.com/Jay-Jay-Tee) / <joshuajacobthomas1@gmail.com>.

MIT licence.
