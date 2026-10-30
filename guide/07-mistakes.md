# 07 · The mistakes list

> Written from experience, mostly mine. If you avoid half of these you'll have a good weekend.

## 1. Over-scoping (the big one)

You will feel, at hour 5, that you have loads of time. You do not.

The plan always looks like: 3 features, each 4 hours, 36 hours total. Reality: each feature takes 3× longer, plus debugging, plus integration, plus the demo prep you forgot.

**Fix:** scope to *one* wow feature. Put everything else in a "Won't build" list in the README. At the halfway point, anything not started is cut, permanently.

If you're asking "should we add one more feature?" at hour 25, the answer is no.

## 2. Starting to code before the repo exists

Twenty minutes in, someone has a working prototype in a folder called `final_final_v2` and nobody else has it.

**Fix:** repo + `.gitignore` + README + deploy in the first hour. No exceptions.

## 3. Not deploying until the end

The deploy is where all the surprises live: env vars, build errors, CORS, file paths, Node versions.

**Fix:** deploy on hour one. Re-deploy every few hours. Keep a known-good URL.

## 4. Twelve hours of setup

Node isn't installed. Python is 3.9 and the library needs 3.11. The Windows laptop can't run the shell script. Someone's `brew` is broken.

**Fix:** [setup/](../setup/) exists for this. Do it a week early. Test on the venue's Wi-Fi if you can.

## 5. Building for yourself instead of the judges

Beautiful architecture, no visible wow. Or a feature you love that the rubric doesn't mention.

**Fix:** read the rubric. Write the pitch before you write the code. Then build the thing the pitch promises.

## 6. Committing secrets

A key in a public repo can mean disqualification, a drained API balance, or a very awkward email.

**Fix:** `.env` ignored from commit one, `.env.example` committed. Revoke first, panic later.

## 7. Nobody knows who's doing what

Two people built the same login screen. Three people edited the router. One person did nothing for six hours and felt awful.

**Fix:** split by feature. Write the split on a whiteboard. Check in every 2–3 hours out loud.

## 8. The 3am refactor

"It'll be cleaner if we rewrite this properly." At 3am. With 8 hours left.

**Fix:** never refactor after the halfway mark. Duplicate code is fine. Ugly code that runs wins.

## 9. Skipping sleep

You think you're gaining 4 hours. You're losing 4 hours of quality work, plus the demo.

**Fix:** sleep. Even 4 hours in a chair. Your 3am code costs more to debug than it saves.

## 10. Submitting at the deadline

Submission portals crash. Videos fail to upload. Forms need fields you don't have. The deadline is often *before* the demo.

**Fix:** submit a working version 2 hours early, then improve and resubmit if allowed.

## 11. Explaining the tech instead of the product

"…so we used a transformer with a retrieval layer and…" — the judges have stopped listening.

**Fix:** lead with the person and the moment. Tech is one sentence, at 2:20.

## 12. Not asking mentors for help

Mentors are bored. They want to help. A 5-minute conversation can save you 3 hours.

**Fix:** when stuck >20 minutes, go find one. Also: sponsor mentors know what their company is judging for.

## 13. Forgetting the deliverables

Repo public? Video uploaded? Devpost submitted? Team members added? Screenshots in the README?

**Fix:** [templates/CHECKLIST.md](../templates/CHECKLIST.md). Tick it at hour 30.

## 14. Not talking to anyone

The best part of a hackathon is the people. You will learn more in one hallway conversation than in ten tutorials.

**Fix:** talk to the team next to you. Ask what they're building. Be the person who helps someone debug. That's how you get invited to the next one.

## 15. Thinking you have to win

Most people don't. Most people still get: a project for their portfolio, a story, new friends, and usually free food.

**Fix:** pick one thing you want to learn, and make sure you learn it. That's a successful hackathon regardless of the scoreboard.

---

Back to → [README](../README.md)
