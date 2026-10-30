# Troubleshooting

> The errors I've actually hit, and the fix. Search this page before you search the internet.

---

## "command not found" right after installing

Your shell hasn't reloaded its PATH.

```bash
# macOS / Linux
exec zsh          # or: source ~/.zshrc

# Windows PowerShell
. $PROFILE
```

If it persists, the installer put the binary somewhere not on your PATH:

```bash
which node || command -v node
echo $PATH
```

Close **the whole terminal app** and reopen. VS Code's integrated terminal caches PATH too — restart VS Code entirely, not just the terminal panel.

---

## `node -v` shows an old version

You have two Node installs fighting. Find them:

```bash
which -a node
```

Fix: pick one manager. I use Homebrew on macOS (`brew install node`) and `winget`/`fnm` on Windows. Remove the other, or make sure the intended one is earlier in `PATH`.

With `fnm`:

```bash
fnm list
fnm use 22
fnm default 22
```

---

## `xcrun: error: invalid active developer path` (macOS)

Xcode command line tools got wiped by an OS update:

```bash
xcode-select --install
```

---

## `EACCES: permission denied` on `npm install -g` (macOS/Linux)

**Don't use `sudo npm`.** It breaks ownership forever. Either use a version manager, or fix the prefix:

```bash
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
exec zsh
```

---

## `bad CPU type in executable` (Apple Silicon)

You installed an Intel build. Reinstall the arm64 version:

```bash
arch -arm64 brew install <package>
# or, for node modules:
rm -rf node_modules package-lock.json && npm install
```

---

## `zsh: command not found: brew` after installing Homebrew

The shellenv line is missing. Add it:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
exec zsh
```

(Intel Macs use `/usr/local/bin/brew`.)

---

## Windows: "running scripts is disabled on this system"

PowerShell's execution policy blocks `.ps1` files:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Then re-run the script.

---

## Windows: `git` says every file changed (CRLF hell)

```powershell
git config --global core.autocrlf true
```

If a repo is already noisy:

```powershell
git rm --cached -r . && git reset --hard
```

---

## Windows: `npm` fails with `EPERM` or "path too long"

1. Run the terminal **as Administrator** for that one command, or
2. Enable long paths:

```powershell
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
  -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

3. Move the project closer to the drive root (`C:\dev\proj`, not `C:\Users\You\Documents\...\...\proj`).

---

## `Permission denied (publickey)` when pushing

```bash
gh auth login          # easiest fix — uses HTTPS
# or
ssh -T git@github.com  # test your key
ssh-add ~/.ssh/id_ed25519
```

---

## Deploy fails but it works locally

Work through this in order:

1. **Environment variables.** Local `.env` doesn't exist on the server. Add them in the Vercel/Netlify dashboard.
2. **Build command.** Does `npm run build` pass locally? Run it. Fix that first.
3. **Node version.** The host may default to an older Node. Set `"engines": { "node": ">=20" }` in `package.json` or set it in the dashboard.
4. **Case sensitivity.** macOS is case-insensitive, Linux isn't. `import ./Components/Button` vs `./components/button` — this bites everyone.
5. **API routes / serverless limits.** Long-running functions time out (10s on many free tiers). Cache or stream instead.

---

## CORS error in the browser

Your frontend and API are on different origins. Options:

- Put the API behind the same domain (`/api/...` route in Next.js) — cleanest.
- On the server, send `Access-Control-Allow-Origin: <your frontend URL>` and handle `OPTIONS`.
- For a hackathon, a permissive `*` is acceptable **for public, non-authenticated** endpoints only.

---

## `Module not found` / weird import errors

```bash
rm -rf node_modules package-lock.json
npm install
```

Then check the import path's **capitalisation** and that the file actually exists. Also check you didn't accidentally create `page.tsx.tsx`.

---

## Port already in use

```bash
# macOS / Linux
lsof -ti:3000 | xargs kill -9

# Windows
netstat -ano | findstr :3000
taskkill /PID <pid> /F
```

Or just run on another port: `npm run dev -- --port 3001`.

---

## Git: "Your local changes would be overwritten by merge"

```bash
git stash          # save your work
git pull --rebase
git stash pop      # reapply
```

If the conflict is too messy and you don't need the local changes:

```bash
git restore .
```

---

## Git: committed to the wrong branch

```bash
git log --oneline -3          # find the commit
git switch correct-branch
git cherry-pick <sha>
git switch wrong-branch
git reset --hard HEAD~1       # removes it from the wrong branch (local only)
```

---

## "I pushed a secret"

1. **Revoke the key now** — provider dashboard. This is the only step that actually matters.
2. Generate a new one, update your local `.env` and your deploy host's env vars.
3. Optionally clean history with `git filter-repo` — but only if the repo is small and it's early. Revoking is faster and safer.

---

## "My deploy is broken and demo is in an hour"

1. Find the last good deployment in your host's dashboard → **Promote / Rollback**. Vercel and Netlify both keep every deploy.
2. If there's no good deploy: cut features until it builds. Comment out the broken route.
3. Fall back to the **recorded video** and run the demo locally.

This is exactly why [06-demo-and-pitch.md](../guide/06-demo-and-pitch.md) says record a backup.

---

## Still stuck?

- Read the **whole** error, bottom to top.
- Search the exact message minus your file paths.
- Ask a mentor. Seriously — that's what they're there for.
- 20-minute rule, then move on and come back.

Back to → [README](../README.md)
