# Writing Markdown (.md files)

Markdown is plain text with a few symbols for formatting: `#` for headings, `-` for lists, `**` for bold. Files end in `.md`. Every page on this site is a Markdown file, and so is every README on GitHub.

It matters for AI because AI tools read Markdown really well. Instruction files (`CLAUDE.md`, `AGENTS.md`) and skills (`SKILL.md`) are Markdown, and a prompt with headings and lists gets better results than one big paragraph.

## Making a .md file

**In VS Code:** File → New File, type a name ending in `.md` (like `notes.md`), and save it in your project folder.

**From the terminal:**

```bash
code notes.md        # creates it (if it doesn't exist) and opens it in VS Code
```

To see what it'll look like, press `Ctrl+Shift+V` (`Cmd+Shift+V` on Mac) in VS Code. Or open it side by side with `Ctrl+K V` (`Cmd+K V`).

On GitHub, any `.md` file shows up formatted automatically.

## The syntax you'll actually use

| You type | You get |
| --- | --- |
| `# Title` | Big heading (one per file, at the top) |
| `## Section` | Section heading |
| `### Smaller section` | Smaller heading |
| `**bold**` | **bold** |
| `*italic*` | *italic* |
| `` `code` `` | `code` (for commands, file names, variable names) |
| `- item` | A bullet list |
| `1. item` | A numbered list |
| `- [ ] task` | A checkbox (`- [x]` for ticked) |
| `[text](https://example.com)` | A link |
| `![description](image.png)` | An image |
| `> quote` | A quote block |
| `---` | A horizontal line |

### Code blocks

Put three backticks on the line before and after. Add the language name after the first three for colours:

````markdown
```bash
npm install
npm run dev
```
````

### Tables

```markdown
| Name | Role |
| --- | --- |
| Alex | Frontend |
| Sam | Backend |
```

The `| --- |` line is required. The columns don't have to line up in the file.

### Nested lists

Indent by two spaces:

```markdown
- Frontend
  - Upload page
  - Results page
- Backend
```

## Frontmatter

Some Markdown files start with a block between two `---` lines. That's **frontmatter**: settings written in YAML (`key: value`), not displayed as text. Skills use it for their name and description:

```markdown
---
name: scope-idea
description: Turns a hackathon idea into a buildable plan.
---

# The rest is normal Markdown
```

The first `---` has to be the very first line of the file.

## Things that trip people up

- **Leave a blank line** before and after headings, lists, code blocks and tables. Without it, they often don't render.
- **Close your code blocks.** A missing closing ``` turns the rest of the file into code.
- **A single line break doesn't make a new paragraph.** Leave an empty line between paragraphs.
- **File names are case-sensitive on GitHub and Linux.** `README.md` and `readme.md` aren't the same, and tools look for exact names like `SKILL.md` and `AGENTS.md`.
- **Spaces in link paths break them.** Use `my-notes.md`, not `my notes.md`.

## Writing Markdown for an AI

The same structure that makes a page easy to skim makes a prompt easy for an AI to follow:

- One heading per topic: `## Goal`, `## Context`, `## Rules`.
- Bullet points for separate requirements, so none get lost in a paragraph.
- Code blocks around errors, file contents and commands, so the AI knows exactly where they start and end.
- Short and specific beats long and vague.
