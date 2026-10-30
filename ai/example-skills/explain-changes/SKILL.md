---
name: explain-changes
description: Explains recent code changes in plain language so the user understands what their code does and can answer judges' questions. Use when the user asks what changed, how a feature works, what the AI wrote, or is preparing for a demo or Q&A.
---

# Explain recent changes

The user needs to understand and explain this code themselves, often to judges. Assume they're a beginner.

## 1. Find the changes

- Run `git status` and `git diff` for uncommitted changes.
- If the user asks about a feature or a time period, use `git log --oneline -20` and `git show <commit>` to find the relevant commits.
- If they name a file or feature, read those files.

## 2. Explain

For each change or feature:

- **What it does**, in one or two sentences, from the user's point of view.
- **How it works**, step by step, in plain words. Mention the file and function names so they can find them.
- **Anything risky**: hardcoded values, missing error handling, secrets in code, things that only work with demo data.

Avoid jargon. If a technical term is needed, explain it in a few words the first time.

## 3. Prepare for questions

List 3 to 5 questions a judge might ask about this code, each with a short answer the user could give in their own words. Include at least one about what's mocked or would need to change for real users.

## Rules

- Don't change any code. Explaining only.
- If you're not sure what some code does, say so rather than guessing.
