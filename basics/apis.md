# APIs

An **API** (Application Programming Interface) is a way for one program to ask another program for something. A website is made for people to click; an API is made for code to call.

Think of a restaurant: you don't walk into the kitchen. You order from a menu, and the waiter brings back the food. The menu is the API: a list of what you can ask for and how to ask.

## You've already seen one

rain-check asks Open-Meteo's API for London's location:

```
GET https://geocoding-api.open-meteo.com/v1/search?name=London&count=1
```

and gets back data, not a web page:

```json
{
  "results": [
    {
      "name": "London",
      "latitude": 51.50853,
      "longitude": -0.12574,
      "country": "United Kingdom"
    }
  ]
}
```

Then it asks a second endpoint for the forecast at those coordinates. That's all "using an API" means: send an HTTP request to a URL, get data back. (New to requests? Read [How the web works](how-the-web-works.md) first.)

## The words

- **Endpoint**: one URL in an API that does one thing, like `/v1/search` or `/v1/forecast`.
- **Method**: `GET` to read, `POST` to send or create, `PUT`/`PATCH` to update, `DELETE` to remove.
- **Parameters**: options you send. In the URL query (`?name=London`) for GETs, or in the request **body** for POSTs.
- **Response**: what comes back, with a [status code](how-the-web-works.md#status-codes-worth-knowing) (200 = worked) and usually JSON.
- **REST**: the most common style of web API, where URLs name things (`/users/42`) and methods say what to do with them. Most APIs you'll meet are REST-ish.
- **SDK**: a library a company provides so you can call its API with normal functions instead of building requests yourself (e.g. `openai`, `@supabase/supabase-js`).
- **Documentation**: the API's menu. It lists endpoints, parameters and example responses. Read it first.

## JSON

Almost every API sends and receives **JSON**, a text format for data:

```json
{
  "name": "Priya",
  "age": 21,
  "student": true,
  "courses": ["CS1101S", "MA1521"],
  "address": { "city": "Singapore" }
}
```

- `{ }` is an object: named values (`"key": value`)
- `[ ]` is a list
- values are text in double quotes, numbers, `true`/`false`, `null`, or more objects and lists

In JavaScript, `await response.json()` turns it into an object. In Python, `response.json()` gives a dictionary.

## Calling an API

### From the terminal

```bash
curl "https://api.open-meteo.com/v1/forecast?latitude=51.5&longitude=-0.13&hourly=precipitation_probability&forecast_days=1"
```

Great for checking an API works before writing any code.

### From JavaScript

```js
const res = await fetch("https://geocoding-api.open-meteo.com/v1/search?name=London&count=1");
if (!res.ok) throw new Error(`HTTP ${res.status}`);
const data = await res.json();
console.log(data.results[0].latitude);
```

### From Python

```python
import requests

res = requests.get(
    "https://geocoding-api.open-meteo.com/v1/search",
    params={"name": "London", "count": 1},
)
res.raise_for_status()
print(res.json()["results"][0]["latitude"])
```

### Sending data (POST)

```js
const res = await fetch("https://example.com/api/notes", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ text: "buy milk" }),
});
```

## API keys

Many APIs need a **key**: a long secret string that identifies your app, for billing and limits. It's usually sent in a header:

```js
fetch("https://api.example.com/v1/thing", {
  headers: { Authorization: `Bearer ${process.env.EXAMPLE_API_KEY}` },
});
```

Rules:

- Keep keys in a `.env` file that's in `.gitignore`, never in your code. See [stacks: environment variables](stacks.md#environment-variables).
- **Never put a secret key in frontend code.** Anyone can read it. Call the API from your backend (even a single serverless function), and have the frontend call your backend.
- If a key leaks, revoke it in the provider's dashboard and make a new one.

Some keys are designed to be public (Supabase's "anon" key, Google Maps browser keys with domain restrictions). The docs will say so. If they don't, assume it's secret.

## Rate limits

APIs limit how many requests you can make, like 60 per minute. Go over and you get a `429` error. To avoid hitting it during the demo:

- Don't call the API on every keystroke; wait for the user to press a button.
- Cache results you've already fetched.
- Keep a saved response to fall back on, like rain-check's `demo-data.js`.

## Making your own API

Your backend is an API too, just one your frontend calls. A tiny one in Next.js:

```ts
// app/api/hello/route.ts  →  GET /api/hello?name=Sam
export async function GET(request: Request) {
  const name = new URL(request.url).searchParams.get("name") ?? "there";
  return Response.json({ message: `Hi ${name}` });
}
```

And in Python with FastAPI (install with `pip install "fastapi[standard]"`):

```python
# main.py  →  run with: fastapi dev main.py  →  GET /hello?name=Sam
from fastapi import FastAPI

app = FastAPI()

@app.get("/hello")
def hello(name: str = "there"):
    return {"message": f"Hi {name}"}
```

FastAPI also gives you a page at `/docs` where you can try every endpoint in the browser.

## CORS

If your frontend on one site calls an API on another site, the browser checks that the API allows it. If not, you get a **CORS error** in the console, even though the same request works in `curl`. It's a browser safety rule, not a bug in your code.

Fixes, in order of preference:

1. Call your own backend on the same site, and have it call the other API (also hides keys).
2. If it's your API, allow your frontend's address. Most frameworks have a CORS setting or package.
3. Use an API that allows browser calls (Open-Meteo does, which is why rain-check doesn't need a backend).

## Webhooks

The reverse of a normal API call: instead of you asking a service for updates, the service calls a URL on *your* backend when something happens ("payment succeeded", "new message"). You'll meet these with Stripe, Discord bots and GitHub integrations. For local testing they need your app to be reachable online; tools like `cloudflared` can expose localhost temporarily.

## Finding APIs

See [APIs and datasets](../resources/apis-and-datasets.md) for free ones you can use without approval, and check what the event's sponsors offer. Sponsor APIs often come with free credits and their own prize.
