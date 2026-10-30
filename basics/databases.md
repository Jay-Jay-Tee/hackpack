# Databases

A **database** stores your app's data so it's still there tomorrow and every user sees the same thing. Users, posts, scores, uploaded file records: if it needs to survive a page refresh or be shared between people, it goes in a database.

![A stack of hard drives, close up](../assets/img/hard-drive.jpg)
*Photo: epSos.de, CC BY 2.0.*

## Why not just a variable or a file?

- **A variable** in your code disappears when the server restarts (and serverless functions restart constantly).
- **`localStorage`** in the browser only lives on that one device. rain-check uses it to remember your last city, which is fine because nobody else needs it.
- **A JSON file** on the server breaks when two people write at once, and most hosts don't let you write files permanently anyway.

A database handles many users reading and writing at the same time, searching, sorting and not losing things.

## Two main kinds

### Relational (SQL) databases

Data lives in **tables**, like spreadsheets with strict columns:

**users**

| id | name | email |
| --- | --- | --- |
| 1 | Priya | priya@example.com |
| 2 | Sam | sam@example.com |

**recipes**

| id | user_id | title | created_at |
| --- | --- | --- | --- |
| 10 | 1 | Fried rice | 2026-10-31 |
| 11 | 1 | Omelette | 2026-10-31 |
| 12 | 2 | Pasta | 2026-10-31 |

- Each **row** is one item; each **column** is one field.
- Every row has an **id** (the **primary key**).
- `user_id` in `recipes` points to a user. That link is a **relationship** (a **foreign key**), and it's where "relational" comes from.

You talk to it with **SQL**:

```sql
-- all of Priya's recipes, newest first
SELECT title FROM recipes WHERE user_id = 1 ORDER BY created_at DESC;

-- add one
INSERT INTO recipes (user_id, title) VALUES (2, 'Soup');
```

Examples: **PostgreSQL** (Postgres), **MySQL**, **SQLite**.

### Document (NoSQL) databases

Data is stored as JSON-like **documents** in **collections**, and documents don't all need the same fields:

```json
{
  "_id": "r10",
  "title": "Fried rice",
  "author": { "id": 1, "name": "Priya" },
  "ingredients": ["rice", "egg", "spring onion"]
}
```

Examples: **MongoDB**, **Firebase Firestore**.

### Which kind?

| | SQL (Postgres) | Document (Firestore, MongoDB) |
| --- | --- | --- |
| Data shape | Fixed columns, defined up front | Flexible, can change as you go |
| Relationships (users → posts → comments) | Strong | Awkward; you often copy data around |
| Querying and counting | Powerful | Simpler |
| Getting started | A bit more setup | Very quick |

For a hackathon, either is fine. Pick what someone on the team has used. If nobody has, Supabase (Postgres) or Firebase (Firestore) are the easiest starts.

## Hosted databases

You don't install a database server yourself. Use a hosted one with a free tier:

| Service | Type | Also gives you |
| --- | --- | --- |
| **Supabase** | Postgres | Logins, file storage, auto-generated API, a table editor in the browser |
| **Firebase** | Firestore (document) | Logins, file storage, hosting |
| **Neon** | Postgres | Just the database, fast to set up |
| **MongoDB Atlas** | MongoDB | Just the database |

Supabase and Firebase are **backend-as-a-service**: with their logins, storage and security rules, many hackathon apps need no custom backend at all.

You connect with the service's library (SDK) and a URL/key from its dashboard, kept in [environment variables](stacks.md#environment-variables).

## SQLite: a database in a file

**SQLite** stores a whole SQL database in one file on disk, with no server. It's perfect for a Python script, a local prototype or a data project. It's not suitable for most serverless hosting (the file doesn't persist), so for a deployed web app use a hosted one.

## ORMs

An **ORM** (Object-Relational Mapper) lets you use the database through normal code instead of writing SQL:

```ts
// Prisma (TypeScript) instead of SELECT ... WHERE user_id = 1
const recipes = await prisma.recipe.findMany({ where: { userId: 1 } });
```

Common ones: **Prisma** and **Drizzle** (TypeScript), **SQLAlchemy** (Python). Useful, but one more thing to learn. Supabase's and Firebase's own libraries are enough for a hackathon.

## Schema

The **schema** is the plan of your data: which tables, which columns, what type each is. Sketch it before building, even on paper:

```
users:    id, name, email
recipes:  id, user_id → users, title, image_url, created_at
```

Ten minutes on this at the start saves hours of rework. An AI agent can turn the sketch into the SQL or setup code.

## Security, briefly

- **Never let the frontend run arbitrary queries** or put database passwords in frontend code.
- With Supabase, turn on **Row Level Security** and write rules like "users can only edit their own rows". With Firebase, write **Security Rules**. Their default "test mode" lets anyone read and write everything, which is fine for a weekend demo but not beyond.
- Don't store passwords yourself; use an auth service ([why](frontend-backend.md#logins-authentication)).

## Seed data

Fill the database with realistic sample rows before the demo, so the app doesn't open on an empty screen. Ask your AI agent: "Write a seed script that adds 20 realistic recipes from 5 users."

## Do you need a database at all?

Not if your app only shows data from an API (rain-check), or the data only matters to one person on one device (`localStorage`). Skipping it is one less thing to break.
