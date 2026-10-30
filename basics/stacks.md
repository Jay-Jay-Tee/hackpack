# Stacks

Your **stack** (or tech stack) is the set of tools your project is built with, layer by layer: what the frontend is written in, what runs the backend, where data is stored, and where it's hosted. "What's your stack?" just means "what did you build it with?"

| Layer | What it is | Example |
| --- | --- | --- |
| Frontend | What users see | React + Tailwind |
| Backend | Logic and secrets | Next.js API routes |
| Database | Where data lives | Supabase |
| Hosting | Where it runs online | Vercel |
| Extras | Outside services | Gemini API |

rain-check's stack is tiny: plain HTML/CSS/JavaScript, no backend, no database, Open-Meteo for data, GitHub Pages for hosting.

## Common hackathon stacks

### Next.js + Supabase + Vercel

The most common web stack at hackathons right now.

The browser loads React pages built by Next.js. Those pages call Next.js API routes, which talk to Supabase for the database, logins and file storage, and to the AI API, where the key stays hidden. Vercel hosts the whole thing.

Good for: almost any web app. One language (JavaScript/TypeScript) everywhere.

### React (Vite) + FastAPI

The browser loads a React app from Netlify or Vercel. It calls a FastAPI backend over HTTP, and that backend talks to the database or the model. The backend runs on Render or Railway.

Good for: when the interesting part is in Python (machine learning, data processing). Two deployments to manage, and you'll need to allow [CORS](apis.md#cors).

### Firebase only

The browser loads your frontend, and Firebase handles the database, logins, storage and hosting behind it.

Good for: getting logins and shared data working fast without writing a backend.

### Static site + public APIs

The browser loads plain HTML, CSS and JavaScript from GitHub Pages or Netlify, and the JavaScript calls public APIs that need no key.

Good for: simple tools and visualisations. This is rain-check. Nothing to break.

### Python data app (Streamlit)

The browser loads a Streamlit app, which is Python running on Streamlit Community Cloud. Inside it, pandas, your models or outside APIs do the work.

Good for: data and ML projects where you want a UI without writing any frontend code.

### Mobile: Expo (React Native)

The phone runs your app through Expo Go, which talks to Supabase, Firebase or your own API.

Good for: when it really needs to be on a phone (camera, location, notifications). Demo on a real phone by scanning a QR code; no app store needed.

## How to choose

1. **What does the team already know?** This beats everything else. Learning a new framework during the event eats the time you need to build.
2. **Where's the interesting part?** ML in Python → a Python backend. Fancy UI → a strong frontend framework.
3. **Does it need a backend?** Secret keys, shared data or heavy processing say yes. Otherwise skip it ([details](frontend-backend.md#do-i-need-a-backend)).
4. **Can you deploy it in the first hour?** If not, simplify.
5. **Sponsor tracks**: if a sponsor prize needs their API or platform, build it in from the start.

Ask your AI agent to compare two options for your idea ([prompt](../ai/prompt-library.md#choose-a-stack)), but make the decision as a team.

## Packages and package managers

Nobody writes everything from scratch. **Packages** (also called libraries or dependencies) are code other people wrote that you install:

| Language | Package manager | List of dependencies | Installed into |
| --- | --- | --- | --- |
| JavaScript | `npm` (or `pnpm`, `yarn`, `bun`) | `package.json` | `node_modules/` |
| Python | `pip` (or `uv`) | `requirements.txt` or `pyproject.toml` | a virtual environment, `.venv/` |

```bash
npm install @supabase/supabase-js     # adds it to package.json and node_modules/
pip install requests                  # into the active virtual environment
```

- **Commit** `package.json` / `requirements.txt` and the **lockfile** (`package-lock.json`), which pins exact versions so everyone gets the same thing.
- **Don't commit** `node_modules/` or `.venv/`. They're huge, and `npm install` / `pip install -r requirements.txt` recreates them.
- Before adding a package an AI suggested, check it actually exists and is popular. Made-up package names are a known trick for spreading malware.

### Scripts

`package.json` has a `scripts` section, which is where `npm run dev` comes from:

```json
"scripts": {
  "dev": "next dev",
  "build": "next build",
  "start": "next start"
}
```

## Environment variables

Settings that change between your laptop and the live site, or that are secret, don't go in the code. They go in **environment variables**.

Locally, they live in a `.env` file (Next.js uses `.env.local`):

```bash
# .env  (never committed)
SUPABASE_URL=https://abcd.supabase.co
GEMINI_API_KEY=AIza...real-key...
```

Your code reads them:

```js
const key = process.env.GEMINI_API_KEY;          // JavaScript (Node)
```

```python
import os
key = os.environ["GEMINI_API_KEY"]               # Python (load .env with python-dotenv)
```

Then:

1. Put `.env` in `.gitignore`.
2. Commit a **`.env.example`** with the same names and fake values, so teammates know what to set.
3. Add the real values in your host's dashboard (Vercel → Project → Settings → Environment Variables). The live site doesn't have your `.env` file.

**Frontend gotcha:** frameworks only send variables to the browser if they have a special prefix (`NEXT_PUBLIC_` in Next.js, `VITE_` in Vite). Anything with that prefix is visible to every user, so never give a secret key that prefix.

## The build step

Many frameworks turn your source code into optimised files before deploying. That's the **build** (`npm run build`). The dev server (`npm run dev`) is forgiving; the build is strict. Run the build locally before you deploy, because most "works on my laptop, fails on Vercel" problems show up there first.
