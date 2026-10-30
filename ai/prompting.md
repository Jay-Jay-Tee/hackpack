# Prompting AI

An AI agent only knows what's in its context window: your project files it has read, and what you tell it ([why](how-ai-works.md)). Most bad answers come from prompts that leave out something you knew and it didn't. This page covers what goes into a good prompt, a workflow that works for real tasks, and what to do when it goes wrong.

## The parts of a good prompt

Not every prompt needs all of these, but a prompt that's going wrong is usually missing one.

| Part | What it is | Example |
| --- | --- | --- |
| **Goal** | What you want, and what "done" looks like | "The Share button copies the link and shows 'Copied!'" |
| **Context** | What it can't know: stack, files, what you've tried | "Next.js + Tailwind. The page is `app/results/page.tsx`." |
| **Input** | The material to work with | The full error, a screenshot, the data |
| **Constraints** | What not to do | "No new packages. Don't touch the styling." |
| **Output format** | The shape of the answer | "A numbered list", "JSON like this example", "just the diff" |
| **Check** | How to know it worked | "Tell me how to test it" |

## Ten habits

### 1. Say what "done" looks like

Instead of:

> make the upload work

Try:

> When I pick a photo on `/upload` and press Submit, it should be saved to Supabase storage and the page should show the image. Right now nothing happens and there's no error.

### 2. Give it the context you have

The stack, the file, what you've already ruled out. An agent can read files, but it doesn't know which one you're looking at.

> The app is Next.js with Tailwind, deployed on Vercel. The form is in `app/upload/page.tsx`, the API route is `app/api/upload/route.ts`. I already checked the Supabase key is in `.env`.

### 3. Paste the full error

The whole thing, in a code block, including file names and line numbers. The useful line is often near the bottom. If the error is in the browser, open the developer console (`F12`) and copy from there.

### 4. Set limits

Agents like to "improve" things you didn't ask about:

- "Make the smallest change that fixes this."
- "Don't add new packages."
- "Don't change anything outside this file."
- "Keep the existing style."

### 5. Show an example

One example beats a paragraph of description.

> Give me 5 fake users as JSON, like this:
>
> `{ "name": "Priya Nair", "university": "NUS", "joined": "2026-09-01" }`

### 6. Plan first for anything bigger than a small fix

It's much easier to fix a wrong plan than wrong code spread across six files.

> Before writing any code, list the files you'd change and what you'd do in each. Wait for me to say go.

Some tools have a planning mode for this (Claude Code's plan mode, Copilot's "Plan" option). Or let it ask you:

> Ask me up to 5 questions before you start, if anything is unclear.

### 7. One task at a time

"Add login, a dashboard and dark mode" gets three half-done things. Ask for one, check it works, commit, then the next.

### 8. Ask how to check it

> After the change, tell me exactly how to test it.

Then test it. "Fixed!" from the AI means it thinks it's fixed.

### 9. Be specific when it's wrong

"Still doesn't work" gives it nothing.

> The image uploads now, but the page still shows the old placeholder until I refresh. No error in the console.

### 10. Start fresh when it goes in circles

Three failed fixes for the same thing usually means the conversation is stuck on a wrong assumption. Start a new chat with a short summary: the goal, what's been tried, what happened each time.

## A workflow for real tasks

For anything more than a one-line fix, this order saves the most time:

1. **Explore.** Let it read first. "Read `app/upload/` and `lib/storage.ts` and explain how uploads currently work. Don't change anything."
2. **Plan.** "Plan how to add image resizing before upload. List the files and changes." Read the plan, push back on anything odd.
3. **Build.** "Go ahead with the plan." For big plans, one step at a time.
4. **Check.** Run it yourself. Ask it to run the tests or the build.
5. **Commit.** Once it works. Then the next task starts from a known good state.

Explore and plan feel slow, but they catch the misunderstanding before it's written into ten files.

## Giving it the right material

**Point at files.** Most agents let you mention files directly, often by typing `@` and the file name (Claude Code, Copilot, Cursor). Otherwise, name the path: "look at `app/api/upload/route.ts`".

**Screenshots.** For layout bugs or "make it look like this", a screenshot says more than a description. Most tools accept pasted or dragged images. Say what's wrong in it: "the button overlaps the text on mobile, see screenshot".

**Docs.** For a library that's new or recently changed, paste the relevant part of its documentation or give the link, and say "use this, not what you remember".

**Data.** Paste a few sample rows rather than a whole file, and say how big the real thing is.

## Ask for options, not just an answer

When there's more than one way to do something:

> Give me 3 ways to store the uploaded images, with the trade-offs of each for a 36-hour hackathon. Recommend one.

Useful for choosing a library, a database, an approach to a feature, or a project name.

## Give it a role when it helps

Telling it who to be changes what it pays attention to:

> Act as a hackathon judge. Here's our pitch script and the judging criteria. What would you score low, and why?

> Act as a first-time user who's never seen this app. Walk through the homepage and tell me what's confusing.

## Putting it together

A prompt for a real task, written in [Markdown](markdown.md):

````markdown
## Goal
Add a "Share" button on the results page that copies the page link to the clipboard
and shows "Copied!" for 2 seconds.

## Context
- Next.js app, Tailwind for styling
- Results page: `app/results/[id]/page.tsx`
- We already have a `Button` component in `components/ui/button.tsx`

## Rules
- Use the existing Button component
- No new packages
- Don't change anything else on the page

## When you're done
Tell me how to test it.
````

You don't need headings for a one-line question. Use them when there's more than one thing to say.

## When it goes wrong

| What's happening | Likely cause | Try |
| --- | --- | --- |
| Generic or off-target answer | Not enough context | Add the goal, files and what you've tried |
| Changes things you didn't ask for | No limits set | "Only change X. Don't touch anything else." |
| Uses a function or package that doesn't exist | Outdated knowledge or a guess | Give it the current docs; check the package exists |
| Same fix again and again | Stuck on a wrong idea | New chat with a summary |
| Forgets something you said earlier | Long chat, context full or compacted | New chat; put lasting rules in an instruction file |
| Huge change that's hard to review | Task too big | Undo (`git restore .`), ask for a plan, do it in steps |
| Says it's fixed but it isn't | It can't see the result | Run it, paste the new output |
| Answer is too long | No format asked for | "Answer in 3 bullet points" |

## Stop repeating yourself

If you keep typing the same things, save them:

- Always true about the project → an [instruction file](instruction-files.md) (`CLAUDE.md` / `AGENTS.md`).
- A procedure you run sometimes → a [skill](skills.md) (`SKILL.md`).
- A prompt you reuse → keep it in a notes file, or start from the [prompt library](prompt-library.md).

## Don't paste in

- Real API keys and passwords. Use placeholders.
- Personal data about real people.
- Anything the event rules say is confidential.
