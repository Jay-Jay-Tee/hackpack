# Prompting AI

An AI agent only knows what's in your project and what you tell it. Most bad answers come from prompts that leave out something you knew and it didn't. These are the habits that fix that.

## 1. Say what "done" looks like

Not "fix the upload", but what should happen when it's fixed.

Instead of:

> make the upload work

Try:

> When I pick a photo on `/upload` and press Submit, it should be saved to Supabase storage and the page should show the image. Right now nothing happens and there's no error.

## 2. Give it the context you have

The stack, the file, what you already tried. The agent can read files, but it doesn't know which one you're looking at or what you've ruled out.

> The app is Next.js with Tailwind, deployed on Vercel. The form is in `app/upload/page.tsx`, the API route is `app/api/upload/route.ts`. I already checked the Supabase key is in `.env`.

## 3. Paste the full error

The whole thing, in a code block, including the file and line numbers. The useful line is often near the bottom, not the top.

## 4. Set limits

Agents like to "improve" things you didn't ask about. Tell it what not to do:

- "Make the smallest change that fixes this."
- "Don't add new packages."
- "Don't touch the styling."
- "Keep it in the existing file."

## 5. Show an example

If you want output in a particular shape, show it. One example beats a paragraph of description.

> Give me 5 fake users as JSON, like this:
>
> `{ "name": "Priya Nair", "university": "NUS", "joined": "2026-09-01" }`

## 6. Plan first for anything bigger than a small fix

For a new feature, ask for a plan before code. It's much easier to fix a wrong plan than wrong code across six files.

> Before writing any code, list the files you'd change and what you'd do in each. Wait for me to say go.

Or let it ask you:

> Ask me up to 5 questions before you start, if anything is unclear.

## 7. One task at a time

"Add login, a dashboard and dark mode" gets you three half-done things. Ask for one, check it works, commit, then ask for the next.

## 8. Ask how to check it

> After the change, tell me exactly how to test it.

Then actually test it. If it says it fixed something, run the thing.

## 9. Be specific when it's wrong

"Still doesn't work" gives it nothing. Say what happened instead:

> The image uploads now, but the page still shows the old placeholder until I refresh. No error in the console.

## 10. Start fresh when it goes in circles

If it's tried three fixes for the same thing, the conversation is probably stuck on a wrong idea. Start a new chat and give a short summary: what you're trying to do, what's been tried, what happened. A clean start often solves it immediately.

## Putting it together

A prompt for a real task, written in Markdown:

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

## Stop repeating yourself

If you keep typing the same things ("we use Tailwind", "don't add packages"), put them in a file the agent reads automatically:

- Things that are always true about the project → an [instruction file](instruction-files.md) (`CLAUDE.md` / `AGENTS.md`).
- A procedure you run sometimes, like "check we're ready to submit" → a [skill](skills.md) (`SKILL.md`).

## Things not to paste in

- Real API keys and passwords. Use placeholders.
- Personal data about real people.
- Anything the event rules say is confidential.
