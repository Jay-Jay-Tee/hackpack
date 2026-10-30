# Docker (only if you need it)

Short version: most hackathon projects don't need Docker. If you're building a web app and deploying to Vercel or Netlify, skip this page.

## What it is

Docker runs software in **containers**: little boxed-up environments that come with everything the software needs. Instead of installing Postgres, Redis and the right version of Python on your laptop, you run them in containers, and they work the same on everyone's machine.

The words you'll see:

- **Image**: the recipe/package, e.g. `postgres:16`. You download these.
- **Container**: a running copy of an image.
- **Dockerfile**: a file in a project that says how to build its image.
- **`docker-compose.yml` / `compose.yaml`**: a file that starts several containers together (say, your app plus a database) with one command.

## When you actually need it

- A sponsor or track requires it, or their starter code comes with a `Dockerfile` or `compose.yaml`.
- You want a real database (Postgres, MongoDB, Redis) running locally and don't want to install it properly.
- Your teammates are on different operating systems and something only works on one of them.
- You're deploying to a host that takes containers, like Render, Railway, Fly.io or Google Cloud Run.

If none of those apply, close this tab. Docker is big, eats RAM, and is one more thing to break at 3am.

## Installing it

**Windows and macOS:** install [Docker Desktop](https://www.docker.com/products/docker-desktop/). It's free for students and personal use.

```powershell
# Windows (it'll also set up WSL 2 if you don't have it; restart when asked)
winget install --id Docker.DockerDesktop -e
```

```bash
# macOS
brew install --cask docker
```

Then open the Docker Desktop app once and let it finish starting. **Docker commands only work while Docker Desktop is running**, which is the cause of most "it doesn't work" messages.

**Linux:** follow the official instructions for your distro at <https://docs.docker.com/engine/install/>, then let yourself run Docker without `sudo`:

```bash
sudo usermod -aG docker $USER
# log out and back in
```

Check it works:

```bash
docker run hello-world
```

If you get a "Hello from Docker!" message, you're done.

## Commands you'll use

| Command | Does |
| --- | --- |
| `docker compose up` | Start everything in the project's compose file |
| `docker compose up -d` | Same, but in the background |
| `docker compose down` | Stop it all |
| `docker compose logs -f` | Watch the output (Ctrl+C to stop watching) |
| `docker ps` | List running containers |
| `docker build -t myapp .` | Build an image from the `Dockerfile` in this folder |
| `docker run -p 3000:3000 myapp` | Run it, with the container's port 3000 on your port 3000 |
| `docker system prune` | Delete stopped containers and unused stuff to free up space |

## Example: a Postgres database in one command

```bash
docker run --name db -e POSTGRES_PASSWORD=devpassword -p 5432:5432 -d postgres:16
```

Your app can now connect to `postgresql://postgres:devpassword@localhost:5432/postgres`. Use `docker stop db` to stop it and `docker start db` to bring it back.

That password is fine for your laptop. Don't use it for anything on the internet.

## When it breaks

- **"Cannot connect to the Docker daemon"**: Docker Desktop isn't running. Open it and wait a bit.
- **"port is already allocated"**: something else is using that port. Stop the other thing, or change the first number in `-p`, e.g. `-p 5433:5432`.
- **Very slow, or the laptop sounds like a jet engine**: Docker Desktop has resource limits in Settings → Resources. Close it when you're not using it.
- **Disk full**: `docker system prune` (add `-a` to also delete unused images).
- **Apple Silicon Mac and an image won't run**: the image may only be built for Intel. Look for an `arm64` version, or add `--platform linux/amd64` (slower, but usually works).

If Docker is eating your time during the event and you don't strictly need it, drop it. A hosted free database (Supabase, Neon, MongoDB Atlas) does the same job without any of this.
