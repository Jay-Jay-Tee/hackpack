# How the web works

Every web app, including whatever you build at a hackathon, is two computers talking: yours asks for something, another one answers. Once that picture is clear, APIs, backends and deploying make a lot more sense.

## Clients and servers

- A **client** is the thing asking. Usually a browser, sometimes a phone app or a script.
- A **server** is a computer, somewhere, that's always on and waiting for requests. It sends back pages, data or files.

```
  client (your browser)                     server (some computer online)
 ┌──────────────────┐   request: "give me /  " ┌──────────────────┐
 │                  │ ───────────────────────▶ │                  │
 │                  │                          │                  │
 │                  │ ◀─────────────────────── │                  │
 └──────────────────┘   response: the page     └──────────────────┘
```

A "server" isn't a special kind of machine. It's any computer running a program that answers requests. When you run `npm run dev`, your laptop becomes a server for itself.

## What happens when you open a URL

Say you open `https://jay-jay-tee.github.io/rain-check/?city=London`:

1. **The URL is split up:**

   ```
   https://  jay-jay-tee.github.io  /rain-check/  ?city=London
   └scheme┘  └──────── host ──────┘  └── path ──┘  └─ query ──┘
   ```

   - **scheme**: how to talk (`https` is the encrypted version of `http`)
   - **host**: which server
   - **path**: which thing on that server
   - **query**: extra options, as `key=value` pairs after a `?`

2. **DNS** turns the host name into the server's address (an IP address like `185.199.108.153`), like looking up a contact's number.
3. **The browser sends an HTTP request** to that server.
4. **The server sends back a response**: the HTML of the page.
5. **The browser reads the HTML** and sends more requests for everything it mentions: CSS, JavaScript, images.
6. **The JavaScript runs** in your browser. In rain-check, it sends its own requests to a weather API and draws the result.

One page load is often dozens of requests. You can watch them: open the browser's developer tools (`F12`, or `Cmd+Option+I` on a Mac), go to the **Network** tab, and reload.

## HTTP: requests and responses

HTTP is the format those messages follow. A request says *what* you want and *what to do*:

```
GET /v1/search?name=London HTTP/1.1
Host: geocoding-api.open-meteo.com
```

The first word is the **method**:

| Method | Means | Example |
| --- | --- | --- |
| `GET` | Give me something | Load a page, fetch a forecast |
| `POST` | Here's something new, store or process it | Submit a form, upload a photo |
| `PUT` / `PATCH` | Update something that exists | Edit your profile |
| `DELETE` | Remove something | Delete a post |

The response comes back with a **status code**, some **headers** (information about the response) and a **body** (the actual content):

```
HTTP/1.1 200 OK
Content-Type: application/json

{"results":[{"name":"London","latitude":51.50853,"longitude":-0.12574}]}
```

## Status codes worth knowing

| Code | Means | Usually because |
| --- | --- | --- |
| **200** OK | It worked | |
| **201** Created | It worked and made something new | After a POST |
| **301 / 302** | Moved, go here instead | Redirects |
| **400** Bad Request | Your request is wrong | Missing or badly formatted data |
| **401** Unauthorized | Who are you? | Missing or wrong API key / not logged in |
| **403** Forbidden | I know who you are, and no | No permission |
| **404** Not Found | That doesn't exist | Wrong URL or path |
| **429** Too Many Requests | Slow down | You hit a rate limit |
| **500** Internal Server Error | The server broke | A bug in the backend; check its logs |
| **502 / 503 / 504** | The server is down or too slow | Crashed, overloaded or timed out |

Rule of thumb: **4xx means the request was wrong, 5xx means the server was wrong.**

## localhost and ports

**`localhost`** means "this computer". When you run a dev server, it's only reachable from your own laptop, at an address like:

```
http://localhost:3000
```

The **port** (`3000`) picks which program on the computer to talk to, since several servers can run at once. Common ones: `3000` (Node/Next.js), `5173` (Vite), `8000` (Python), `5432` (Postgres). "Port already in use" means another program already has it; see [troubleshooting](../setup/troubleshooting.md#port-already-in-use).

Your teammates can't open your `localhost`. To share your app, you [deploy](deploying.md) it.

## HTTPS

The `s` means the connection is encrypted, so nobody between you and the server can read or change it. Hosting services (Vercel, Netlify, GitHub Pages) give you HTTPS automatically. Browsers block some features, like camera and location access, on plain `http` sites other than `localhost`.

## Try it yourself

`curl` sends a request from the terminal and prints the response. It's built into macOS, Linux and Windows 10+:

```bash
curl "https://geocoding-api.open-meteo.com/v1/search?name=London&count=1"
```

You just did what rain-check does when you type "London". Add `-i` to see the status code and headers too.
