# 03 · Building

> Boring stack. Vertical slice. Deploy early. These three rules will save your weekend.

## Pick a boring stack

Use what you already know. The hackathon is not the place to learn Rust and Kubernetes simultaneously.

If you genuinely have no preference, these are the lowest-friction choices:

| You want | Use | Why |
| --- | --- | --- |
| A website fast | **Next.js + Tailwind + shadcn/ui** | Deploys to Vercel in one click, looks good by default |
| A quick backend | **Node + Express/Fastify**, or Next.js API routes | One language everywhere |
| Python anything | **FastAPI + Jinja/React** | Great for ML, quick to write |
| A mobile-ish app | **React Native (Expo)** | Scan a QR code, runs on a real phone, no app store |
| Data / ML | **Python + pandas + scikit-learn**, maybe an API wrapper | Judges love a live inference demo |
| A landing page only | **Plain HTML + Tailwind CDN** | Zero build step, impossible to break |

Pick the one where **you can produce a working screen in an hour.**

## Vertical slice first

Don't build layer by layer (all models → all routes → all UI). Build **one thin path through everything**:

```
button click → API call → database write → result on screen
```

Get that working end-to-end with ugly code, then widen it. A thin slice that works is worth more than five perfect layers that don't connect.

## Deploy on hour one

Push to Vercel/Netlify/Cloudflare immediately, even if it's a paragraph of text. Then:

- Re-deploy every few hours. Broken deploy at hour 30 is a fire; broken deploy at hour 4 is a Tuesday.
- Keep a **known-good** deployment. If main breaks, you still have a URL to show.
- Never do a risky refactor without a green deploy behind you.

## Make it look real with fake data

Judges judge what they see. This is not cheating, it's demo craft.

- **Seed data that looks plausible.** Real names, real photos, realistic numbers.
- **Hardcode the happy path.** If the AI answer is slow, cache a good answer and stream it in.
- **Add loading states.** Even fake ones. It makes everything feel finished.
- **Empty states matter.** "No projects yet" with a nice illustration beats a white void.
- **Label mocks honestly** in the README and, if asked, in the pitch. "This part is mocked; here's how it would work."

## The demo path is sacred

Identify the exact clicks you'll do on stage. Everything else is optional.

- Put a **"Demo" button** or `/demo` route that skips login and pre-loads state.
- Reset the data before you present.
- Make buttons big enough to hit while nervous.
- Test on the **presentation screen size**, not your laptop.

## Working with a team

- **One person owns the deploy.** Multiple people deploying randomly causes confusion.
- **Announce before you touch shared files** (layout, router, schema, `package.json`).
- **Split by feature/screen, not by layer.** Two people editing the same file is where hours go to die.
- **Merge small, merge often.** A 900-line PR at hour 33 is a disaster waiting to happen.
- Detail → [04-git-with-a-team.md](04-git-with-a-team.md)

## Cheap wins that judges notice

- A real, public URL that loads on their phone
- A README with screenshots and a "how it works" diagram
- The sponsor's logo/API actually used
- Fast, error-free happy path
- A 60-second video they can watch after the event

## Cheap wins that don't matter

- Perfect TypeScript types
- Test coverage (write one smoke test, not a suite)
- CI pipelines
- Microservices
- Auth providers, email verification, password reset
- Dark mode (unless dark mode *is* the product)

## When you get stuck

1. **Read the actual error.** All of it. Not the first line.
2. **Change one thing at a time.**
3. **Search the exact error text** (minus your file paths).
4. **Ask an AI** with the full error + the relevant file — see [05-ai-tools.md](05-ai-tools.md).
5. **Ask a mentor.** That's what they're for. They've seen your bug 40 times.
6. **Timebox to 20 minutes.** If it's still broken, stub it out, move on, come back with fresh eyes.

---

Next → [04-git-with-a-team.md](04-git-with-a-team.md)
