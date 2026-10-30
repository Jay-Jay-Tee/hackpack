# SSH keys for GitHub

When you push to GitHub, it needs to know it's you. There are two ways to prove it:

| | HTTPS | SSH |
| --- | --- | --- |
| Repo URL looks like | `https://github.com/you/app.git` | `git@github.com:you/app.git` |
| How you log in | Browser login, saved by `gh auth login` or Git Credential Manager | A key file on your laptop |
| Setup | Nothing extra if you ran `gh auth login` | About 5 minutes, once per laptop |
| Works on restrictive Wi-Fi | Almost always | Sometimes blocked (fix below) |

**If `gh auth login` works and you can push, you don't need SSH.** HTTPS is fine for a hackathon. Set up SSH if you prefer it, if a tool or server requires it, or if you're deploying to a server you log into over SSH.

## How SSH keys work

An SSH key comes as a pair of files:

- **Private key** (`id_ed25519`): stays on your laptop. Never share it, never commit it, never paste it into a chat.
- **Public key** (`id_ed25519.pub`): safe to share. You give it to GitHub.

When you connect, GitHub checks that your laptop has the private key matching the public key on your account, without the private key ever being sent. It's like GitHub holding a lock and your laptop holding the only key.

## 1. Check whether you already have a key

```bash
ls ~/.ssh
```

If you see `id_ed25519` and `id_ed25519.pub`, you have one; skip to step 3. "No such file or directory" means you don't.

(On Windows, run these in PowerShell or Git Bash. `~` means your user folder, `C:\Users\YourName`.)

## 2. Make a key

```bash
ssh-keygen -t ed25519 -C "you@example.com"
```

- `-t ed25519` is the key type GitHub recommends.
- `-C` is just a label; use your GitHub email.

It asks three things:

1. **Where to save it**: press Enter for the default.
2. **Passphrase**: a password protecting the key file, in case someone gets your laptop. Recommended. Nothing shows while you type.
3. **Passphrase again.**

## 3. Let your laptop remember the passphrase

The **ssh-agent** holds your unlocked key so you don't type the passphrase on every push.

**macOS**: create or edit `~/.ssh/config`:

```bash
code ~/.ssh/config
```

Add:

```
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

Then add the key, saving the passphrase in your Keychain:

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

**Windows**: the agent is a Windows service that's off by default. In PowerShell **as Administrator**, once:

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
```

Then in a normal PowerShell:

```powershell
ssh-add $HOME\.ssh\id_ed25519
```

**Linux**: most desktops start an agent for you. Add the key with:

```bash
ssh-add ~/.ssh/id_ed25519
```

## 4. Give GitHub your public key

Easiest, with the GitHub CLI:

```bash
gh ssh-key add ~/.ssh/id_ed25519.pub --title "my laptop"
```

Or by hand: copy the public key, then paste it at GitHub → Settings → SSH and GPG keys → New SSH key.

```bash
cat ~/.ssh/id_ed25519.pub        # macOS/Linux: prints it; copy the whole line
```

```powershell
Get-Content $HOME\.ssh\id_ed25519.pub | Set-Clipboard   # Windows: copies it
```

Make sure it's the `.pub` file. It starts with `ssh-ed25519`.

## 5. Test it

```bash
ssh -T git@github.com
```

The first time, it asks whether you trust GitHub's server:

```
The authenticity of host 'github.com' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no)?
```

Check the fingerprint matches the one on [GitHub's fingerprint page](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints), then type `yes`. You should see:

```
Hi your-username! You've successfully authenticated, but GitHub does not provide shell access.
```

That message means it worked.

## 6. Use SSH for your repos

**Cloning a new repo**: use the SSH URL (GitHub's green "Code" button → SSH tab):

```bash
git clone git@github.com:owner/repo.git
```

**Make `gh` use SSH by default**:

```bash
gh config set git_protocol ssh
```

**Switch an existing repo from HTTPS to SSH**:

```bash
git remote -v                                         # shows the current URL
git remote set-url origin git@github.com:owner/repo.git
git remote -v                                         # check it changed
```

## When it doesn't work

**`Permission denied (publickey)`**

GitHub didn't get a key it recognises. Check in order:

1. `ssh-add -l` lists a key. If it says "no identities", run `ssh-add` again (step 3).
2. The public key is on your GitHub account (Settings → SSH and GPG keys).
3. You're using the right account: `ssh -T git@github.com` greets you by the username you expect.

For details, run `ssh -vT git@github.com` and look for which key files it tries.

**`Connection timed out` or `Connection refused` on port 22**

Some university and venue networks block port 22, which SSH uses. GitHub also accepts SSH on port 443. Add to `~/.ssh/config`:

```
Host github.com
  Hostname ssh.github.com
  Port 443
  User git
```

Then test again with `ssh -T git@github.com`. Or just use HTTPS for the event.

**`Host key verification failed`**

Your laptop has an old record of GitHub's server key. Remove it and test again (then accept the new fingerprint, after checking it):

```bash
ssh-keygen -R github.com
ssh -T git@github.com
```

**It keeps asking for my passphrase**

The agent isn't holding the key. Redo step 3 for your OS.

**`Bad permissions` / `UNPROTECTED PRIVATE KEY FILE`** (macOS/Linux)

The key file is readable by other users, so SSH refuses it:

```bash
chmod 600 ~/.ssh/id_ed25519
chmod 700 ~/.ssh
```

## Two GitHub accounts on one laptop

For example a personal account and a university one. Make a second key with a different name, then give each account its own host alias in `~/.ssh/config`:

```bash
ssh-keygen -t ed25519 -C "you@uni.edu" -f ~/.ssh/id_ed25519_uni
```

```
Host github.com
  IdentityFile ~/.ssh/id_ed25519

Host github-uni
  Hostname github.com
  IdentityFile ~/.ssh/id_ed25519_uni
```

Add `id_ed25519_uni.pub` to the second account, then clone with the alias:

```bash
git clone git@github-uni:uni-org/repo.git
```

Set the matching email inside that repo so commits are attributed correctly: `git config user.email "you@uni.edu"`.

## Rules for keys

- Never share or commit the private key (the file without `.pub`).
- One key per laptop. If a laptop is lost, delete its key from GitHub's settings.
- A passphrase protects you if someone else gets your files.
- The same key can also log you into servers (a VPS, a Raspberry Pi) by adding the `.pub` to their `~/.ssh/authorized_keys`.

---

Next: [Fixing mistakes](fixing-mistakes.md)
