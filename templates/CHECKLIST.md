# Submission checklist

> Tick this at **hour 30**, not hour 35. Portals crash, videos fail to upload, and the deadline is usually earlier than advertised.

## 2 hours before the deadline

- [ ] **Deployed and working** on a public URL, tested in an incognito window and on your phone
- [ ] **Data reset** to a good demo state (no "test test asdf")
- [ ] **Repo is public** (if the rules require it — check! some events forbid public repos)
- [ ] **README** has: one-line description, screenshot, live link, how to run, team names
- [ ] **`.env.example`** exists; **no secrets in git** (`git log -p | grep -i "sk-\|api_key"`)
- [ ] **Demo video** recorded, and **uploaded** (not just exported)
- [ ] **Submitted on Devpost/the portal** — save the confirmation email or screenshot
- [ ] **All team members added** to the submission (easy one to forget)

## 30 minutes before

- [ ] Pitch rehearsed twice with a timer
- [ ] Backup video open in a tab, downloaded locally
- [ ] Local dev server running and seeded
- [ ] Presentation adapters (USB-C / HDMI) and charger packed
- [ ] Slides (if any) exported to PDF — fonts break on other machines
- [ ] Phone on silent, notifications off, Slack/Discord closed
- [ ] Water. You will be nervous and your mouth will be dry.

## Demo-day sanity

- [ ] You can reach the demo URL from the venue Wi-Fi
- [ ] You have a mobile hotspot as backup
- [ ] The person demoing has done it at least once today
- [ ] You know the exact 4 clicks
- [ ] You know the answer to "did you use AI?"

## After submission

- [ ] `git tag v1.0 && git push --tags` — freeze the submitted version
- [ ] Stop pushing to `main`
- [ ] Screenshot the final state for your portfolio
- [ ] Add the project to your GitHub profile / LinkedIn / resume
- [ ] Thank your teammates (and the mentors who actually helped)

## If something goes wrong

| Problem | Move |
| --- | --- |
| Deploy is broken | Roll back / promote the last good deploy in the host dashboard |
| Demo URL is down | Run locally, or play the recorded video |
| Can't submit on the portal | Screenshot the error, email the organisers immediately, keep trying |
| Forgot to make the repo public | Do it now — some judges check after the event |
| Leaked a key | Revoke it first. Then worry about history. |

---

Back to → [README](../README.md)
