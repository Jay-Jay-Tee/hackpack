# Frontend and backend

Most apps are split into two halves that run in different places.

```
   FRONTEND                         BACKEND                        DATABASE
   runs in the user's browser       runs on a server               stores data
  ┌──────────────────────┐        ┌──────────────────────┐       ┌────────────┐
  │ what you see and     │  API   │ logic, checks,       │       │ users,     │
  │ click: pages,        │ ─────▶ │ secrets, talking to  │ ────▶ │ posts,     │
  │ buttons, forms       │ ◀───── │ other services       │ ◀──── │ orders...  │
  └──────────────────────┘        └──────────────────────┘       └────────────┘
```

## Frontend

Everything the user sees and interacts with. It runs **on the user's device**, in their browser.

Built from three languages:

| | Does | Example |
| --- | --- | --- |
| **HTML** | Structure and content | `<button>Check</button>` |
| **CSS** | How it looks | `button { background: blue; }` |
| **JavaScript** | Behaviour: reacting to clicks, fetching data, changing the page | `button.onclick = checkWeather` |

rain-check is a frontend only: `index.html`, `style.css` and `app.js`, calling someone else's API.

### Frontend frameworks

Writing big apps in plain JavaScript gets messy, so most people use a framework that organises the page into reusable **components**:

- **React**: the most common. You'll hear it everywhere.
- **Next.js**: React plus routing, a backend and easy deployment. A common hackathon choice.
- **Vue**, **Svelte**, **Angular**: alternatives that do the same job differently.
- **Tailwind CSS**: a quick way to style things with classes like `bg-blue-500 p-4`, used with any of the above.

### The important rule

**Anything in the frontend is visible to the user.** They can open developer tools and read all of your JavaScript. So:

- Never put secret API keys in frontend code.
- Never trust the frontend to enforce rules ("only admins see this button"). Someone can call your backend directly. Check on the backend.

## Backend

The part that runs **on a server** you control. Users never see its code, only what it sends back. It's for things the frontend can't or shouldn't do:

- **Keeping secrets**: calling an AI or payment API with a key the user mustn't see.
- **Storing and reading data**: talking to the database.
- **Rules and checks**: "is this user logged in?", "is this file too big?".
- **Heavy work**: processing images, running a model.
- **Talking to other services**: sending emails, calling other APIs.

The backend usually exposes an [API](apis.md): a set of URLs the frontend can call, like `POST /api/upload`.

### Backend languages and frameworks

| Language | Common frameworks |
| --- | --- |
| JavaScript / TypeScript | Next.js API routes, Express, Fastify, Hono |
| Python | FastAPI, Flask, Django |
| Java / Kotlin | Spring Boot |
| Go | the standard library, Gin |

At a hackathon, use the language you know best. If that's JavaScript, Next.js lets you write frontend and backend in one project.

## Do I need a backend?

Not always:

| Your app… | Backend needed? |
| --- | --- |
| Shows information and calls public APIs with no key (like rain-check) | No |
| Uses an API that needs a **secret** key (most AI APIs) | Yes, even a tiny one, to hide the key |
| Saves data that other users or devices should see | Yes, or a backend-as-a-service like Supabase/Firebase |
| Has logins | Use a service (below) rather than building your own |

### Backend-as-a-service

Services like **Supabase** and **Firebase** give you a database, logins and file storage without writing a backend. The frontend talks to them directly, and you set rules about who can read and write what. For a hackathon, this is often the fastest route.

### Serverless functions

Hosts like Vercel and Netlify let you write backend code as small functions (for example, `app/api/upload/route.ts` in Next.js). They run only when called, and you don't manage a server. Most hackathon backends can be just a few of these. The catch: they usually have time limits (often around 10 seconds on free plans), so long jobs need another approach.

## Logins (authentication)

**Authentication** is checking who someone is (logging in). **Authorisation** is checking what they're allowed to do.

Don't build your own login system at a hackathon. Password storage, reset emails and sessions take ages and are easy to get dangerously wrong. Use:

- **Supabase Auth** or **Firebase Auth** if you're already using them
- **Clerk** or **Auth.js** for Next.js
- "Sign in with Google/GitHub" through one of the above

Better still, ask whether the demo needs logins at all. Judges won't make an account; a pre-logged-in demo user is often enough.

## Full stack

"Full stack" just means working on both frontend and backend. On a hackathon team, people often split by feature (one person does the upload feature end to end) rather than by frontend/backend, so nobody's waiting on anyone else.
