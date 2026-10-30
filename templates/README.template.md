# <Project Name>

> One sentence: what it does, for whom. Not "a platform that leverages AI".

<One or two screenshots or a GIF here. This is the single highest-value thing in the README.>

[**Live demo**](https://your-app.vercel.app) · [**Demo video**](https://youtu.be/xxx) · [Devpost](https://devpost.com/xxx)

---

## The problem

Two or three sentences. A real person, a real moment, a real annoyance. No market-size statistics.

## What we built

What it does in plain language. Then the one thing that makes it interesting.

```
screenshot / diagram / before-after
```

## How it works

```
[ User ] → [ Next.js app ] → [ API route ] → [ OpenAI / your model ]
                                   ↓
                            [ Postgres (Supabase) ]
```

- **Frontend:** Next.js 15 + Tailwind + shadcn/ui
- **Backend:** Next.js API routes (serverless)
- **Database:** Supabase Postgres
- **Deploy:** Vercel
- **Sponsor tech used:** <name the API/SDK and how it's core, not bolted on>

## Run it locally

```bash
git clone https://github.com/<you>/<repo>.git
cd <repo>
npm install
cp .env.example .env       # then fill in your keys
npm run dev                # http://localhost:3000
```

### Environment variables

| Variable | What it's for |
| --- | --- |
| `DATABASE_URL` | Postgres connection string |
| `OPENAI_API_KEY` | Model calls |

## What's mocked / not built

Being honest here makes the demo *more* credible, not less.

- Payments are stubbed — no Stripe keys in the demo
- The "recommendations" use a cached response to keep the demo under 2s
- No auth — the demo route loads a seeded account

## What we'd do next

- [ ] One concrete next step
- [ ] Another one
- [ ] The thing we'd need money/help for

## Team

| Name | What they did |
| --- | --- |
| [@handle](https://github.com/handle) | Frontend, demo script |
| [@handle](https://github.com/handle) | Backend, deploy |
| [@handle](https://github.com/handle) | Design, pitch |

## Built at

<Hackathon name> · <Month Year> · <track/prize, if any>

---

<sub>Built with a lot of coffee and a little sleep.</sub>
