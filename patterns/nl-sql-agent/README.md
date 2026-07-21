# Natural Language SQL Agent

Ask your Supabase database questions in plain English. The agent translates to SQL, runs it, and explains the result.

## Status

**Reference implementation.** The Python file (`main.py`) is the original Composio example, lightly annotated. The productized version (CLI install, multi-database support, output formatting) is queued for v0.4 of this repo.

## The 60-second pitch

You have a Supabase database with real production data. You don't want to write SQL every time you need to answer "how many users signed up last week" or "which clients haven't logged in in 30 days." You want to ask.

This agent does that:

```
you > how many active users do we have in the san diego region
agent > Looking at the users table... I see 4,217 active users with region='SD'.
        Here's the breakdown by status:
        - active: 4,217
        - paused: 312
        - canceled: 89
you > of those active users, how many signed up in the last 30 days
agent > [continues]
```

It's an REPL. You ask, it answers, it remembers the context for follow-up questions.

## What you need

| Thing | Where to get it |
|---|---|
| Composio API key | [app.composio.dev](https://app.composio.dev) |
| OpenAI API key | [platform.openai.com](https://platform.openai.com) |
| Supabase project | Existing — the agent connects via OAuth |
| Python 3.12+ | `brew install python@3.12` |

## Run it

### 1. Install dependencies

```bash
pip install composio composio-openai-agents openai-agents
export COMPOSIO_API_KEY=your_key
export OPENAI_API_KEY=your_key
```

### 2. Connect Supabase

```bash
python main.py connect user_123
```

This prints a URL. Open it, authorize Composio to access your Supabase. The script waits for the connection to complete.

### 3. Ask questions

```bash
python main.py query user_123
```

You're now in the REPL. Type questions. Type `exit` to leave.

## How it works

```
user types question
   ↓
OpenAI Agents SDK runs the agent loop with Composio Supabase tools attached
   ↓
Agent's first move: list projects to find the right database
Agent's second move: introspect the schema for the user's question
Agent's third move: compose and run a SELECT query
   ↓
Agent explains the result in natural language
   ↓
REPL retains conversation context for the next question
```

The agent is configured to *only* run SELECT queries by default. Mutations require explicit approval. Edit `main.py` to relax or tighten this.

## Customize

Three high-leverage edits:

1. **The agent instructions** (in `main.py`) — tone, output format, what the agent does first. The current version is read-only and explanation-heavy. You can make it brief, make it write Markdown reports, or make it generate charts.

2. **The toolkits** — `composio.create(user_id, toolkits=["supabase"])` accepts a list. Swap to `["postgres"]`, `["mysql"]`, `["bigquery"]` or any other database Composio supports. Mix toolkits: `["supabase", "slack"]` lets the agent post results to Slack.

3. **The model** — defaults to OpenAI through `OpenAIAgentsProvider`. Other providers (Anthropic, Google, Mastra) are available via different Composio packages.

## When to use this pattern

- You have data in a structured store (Supabase, Postgres, MySQL, BigQuery)
- You want non-technical users to ask questions of that data
- The cost of an LLM-generated query mistake is acceptable (i.e., not production writes)
- You're OK with the model occasionally hallucinating column names

When NOT to use:

- You need deterministic SQL (use a real query builder)
- You're querying sensitive data and can't audit every query
- You need sub-second response times (LLM agents are slower than direct queries)

## Productize this for HumanLup

The HumanLup version of this would be a dashboard at `client-name.humanlup.com/ask` where the SMB owner can ask their data questions. Wire it up to:

- Their POS database (Toast, Square, Shopify)
- Their CRM (HubSpot, Pipedrive)
- Their booking system (Calendly, Acuity)

Single Composio user per client. Sandboxed by row-level security in the underlying DB. Charge as a tier on top of the standard HumanLup site.

## Origin

Adapted from the Composio docs repo (`docs/examples/supabase-sql-agent/main.py`). The original is well-structured — `connect` and `query` are split into separate commands so the auth flow is decoupled from the interactive loop. Kept that structure here.
