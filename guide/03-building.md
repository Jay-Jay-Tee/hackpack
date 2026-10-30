# 3. Building

## Use what you know

Not sure what these words mean? See [How apps work](../basics/), especially [Stacks](../basics/stacks.md).

A hackathon isn't a good time to learn a new language or framework. If you don't have a preference:

![A room of people working on laptops at long tables](../assets/img/hackathon-room.jpg)
*A Wikimedia hackathon in Morocco, 2026. Photo: DERDAKI ILIAS, CC BY-SA 4.0.*

- **Website**: Next.js with Tailwind. Deploys to Vercel with almost no setup.
- **Backend**: Next.js API routes or Express if you're in JavaScript, FastAPI if you prefer Python.
- **Mobile**: React Native with Expo, which runs on your phone without going through an app store.
- **Data/ML**: Python with pandas and scikit-learn, behind a small API.
- **Static page**: plain HTML and CSS.

## Get one path working end to end

Instead of building the whole backend and then the whole frontend, get one action working all the way through first: a button that calls the API, saves something to the database and shows the result. Then build on that.

## Deploy early

Deploy in the first hour, even if the page is empty, and redeploy every few hours. Deployment problems (missing environment variables, build errors, Node versions, case-sensitive paths) are much easier to fix early than late. Don't start a large refactor unless the current deploy works.

## Demo data

Seed the app with realistic data so the demo doesn't start on an empty screen. If something is slow or unreliable, such as an LLM call, it's fine to cache a good result for the demo. Note in the README what's mocked.

## The demo path

Work out the exact clicks you'll make during the demo and make that path reliable before anything else. A `/demo` route that skips login and loads sample data helps. Check it at the resolution of the screen you'll present on.

## Splitting work

- One person handles deploys.
- Split work by feature or screen rather than frontend/backend, so people aren't editing the same files.
- Tell the team before changing shared files: layout, routes, database schema, `package.json`.
- Merge small changes often. See [4. Git with a team](04-git-with-a-team.md).

## Things to skip

Thorough test suites, CI, microservices, password reset, email verification, dark mode. A quick check that the main path works is enough.

## When you're stuck

1. Read the whole error message, not just the first line.
2. Change one thing at a time.
3. Search the error text with your own file paths removed.
4. Ask an AI tool, and give it the full error and the relevant file.
5. Ask a mentor. That's what they're there for.
6. After about 20 minutes, replace it with a placeholder (for example, return fixed data), move on and come back later.
