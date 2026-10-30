# Submission checklist

Go through this a few hours before the deadline. For what a finished repo looks like, see the [example repo](example-repo.md).

## Submission

- [ ] Deployed and working; tested in a private window and on a phone
- [ ] Demo data reset
- [ ] Repo public, if the rules require it
- [ ] README has a description, screenshot, live link, run instructions and team names
- [ ] `.env.example` committed and no keys in the repo (`git log -p | grep -iE "api_key|sk-"`)
- [ ] Video recorded and uploaded
- [ ] Submitted on the event's platform, with a screenshot of the confirmation
- [ ] All team members added to the submission

## Before presenting

- [ ] Pitch practised twice with a timer
- [ ] Backup video downloaded locally
- [ ] App running locally as a fallback
- [ ] Display adapter and charger
- [ ] Slides exported to PDF
- [ ] Notifications off
- [ ] Demo URL loads on the venue Wi-Fi, with a phone hotspot as backup

## Afterwards

- [ ] `git tag v1.0 && git push --tags`
- [ ] Stop pushing to `main` until judging is over
- [ ] Add the project to your GitHub profile or CV

## If something goes wrong

- Deploy broken: roll back to the last working deploy in the host's dashboard.
- Site down during the demo: run it locally or play the recording.
- Submission platform failing: screenshot the error and email the organisers straight away.
- Leaked a key: revoke it first.
