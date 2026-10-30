# Troubleshooting

Something broke. Normal. Find your error below; if it's not here, paste the full error into your AI agent or show it to a mentor.

## "command not found" right after installing

The shell hasn't picked up the new PATH. Close the terminal app completely and open it again. VS Code caches PATH too, so restart VS Code, not just its terminal panel.

If it still fails, check where the program was installed and whether that's on your PATH:

```bash
command -v node
echo $PATH
```

## `node -v` shows the wrong version

You probably have two installs. `which -a node` lists them. Pick one way of installing Node and remove the other, or make sure the one you want comes first in PATH. With fnm: `fnm use 22` and `fnm default 22`.

## macOS: `xcrun: error: invalid active developer path`

The Xcode command line tools are missing, often after a macOS update:

```bash
xcode-select --install
```

## macOS: `zsh: command not found: brew`

Homebrew isn't on your PATH:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
exec zsh
```

Intel Macs use `/usr/local/bin/brew`.

## `EACCES: permission denied` on `npm install -g`

Don't use `sudo npm`. Either install Node through a version manager (fnm), or move npm's global folder:

```bash
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
exec zsh
```

## Windows: `python` opens the Microsoft Store

Go to Settings → Apps → Advanced app settings → App execution aliases, and turn off the entries for `python.exe` and `python3.exe`. Then open a new terminal.

## Windows: "running scripts is disabled on this system"

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

## Windows: git shows every file as changed

Line endings. Set this, then re-clone if the repo is still noisy:

```powershell
git config --global core.autocrlf true
```

## Windows: npm fails with `EPERM` or path too long

Enable long paths (see [windows.md](windows.md)) and keep projects near the drive root, e.g. `C:\dev\project`.

## `Permission denied (publickey)` when pushing

Run `gh auth login` and choose HTTPS. Or, if you want SSH, check your key with `ssh -T git@github.com`.

## Works locally, fails when deployed

Check in this order:

1. Environment variables. Your `.env` isn't uploaded; add the values in the host's dashboard.
2. Does `npm run build` work locally?
3. Node version. Set it in the host's settings or with `"engines"` in `package.json`.
4. Filename case. macOS ignores case and Linux servers don't, so `./Components/Button` and `./components/button` are different files there.
5. Timeouts. Serverless functions on free plans often stop after about 10 seconds.

## CORS error in the browser

The frontend and API are on different origins. The simplest fix is to serve the API from the same domain (for example Next.js API routes). Otherwise, have the server send `Access-Control-Allow-Origin` with your frontend's URL and handle `OPTIONS` requests.

## `Module not found`

Check the capitalisation of the import path and that the file exists. If that's fine:

```bash
rm -rf node_modules package-lock.json
npm install
```

## Port already in use

```bash
# macOS / Linux
lsof -ti:3000 | xargs kill

# Windows
netstat -ano | findstr :3000
taskkill /PID <pid> /F
```

Or use another port: `npm run dev -- --port 3001`.

## "Your local changes would be overwritten by merge"

```bash
git stash
git pull
git stash pop
```

## Committed to the wrong branch

```bash
git log --oneline -3           # note the commit hash
git switch right-branch
git cherry-pick <sha>
git switch wrong-branch
git reset --hard HEAD~1        # only if you haven't pushed it
```

## Pushed an API key

Revoke it in the provider's dashboard and create a new one. Then update your `.env` and the deploy host's settings.

## Deploy is broken shortly before the demo

Vercel and Netlify keep every previous deploy; promote the last working one. Failing that, run the app locally or show the backup recording.
