# PR Review Agent

A GitHub Action that reviews every pull request against your `CLAUDE.md` or `AGENTS.md` rules. Posts findings as a structured PR comment. Skips style nitpicks. Flags real issues.

## The 60-second pitch

You don't need to read your own diffs anymore. Add this to a repo, define your rules in a `CLAUDE.md` (or `AGENTS.md`) file, and every PR gets a code review tailored to *your* standards — not generic linter output.

The agent reads the diff, treats your `CLAUDE.md` as the review rubric, and writes a PR comment in this format:

```markdown
## PR Review

**Summary**: [2-3 sentences on what this PR does]
**Review effort [1-5]**: [1 = trivial, 5 = complex and risky]

### Key issues
| # | File | Lines | Category | Description |
|---|------|-------|----------|-------------|
| 1 | file.py | 12-15 | Possible bug | [description] |

### Security concerns
[Any security issues, or "None"]

### CLAUDE.md / AGENTS.md compliance
[Rule violations, or "All rules followed"]

### Tests
[Were relevant tests added? Yes/No with brief explanation]
```

What it deliberately does **not** flag:
- Style preferences or minor wording
- Issues in unchanged code that existed before the PR
- Missing docstrings, type hints, or comments
- Things a linter or CI already catches

## What you need

| Thing | Where to get it |
|---|---|
| Composio API key | [app.composio.dev](https://app.composio.dev) — free tier covers small repos |
| OpenAI API key | [platform.openai.com](https://platform.openai.com) — uses `gpt-4o-mini` by default |
| GitHub access | Standard — the workflow runs as `GITHUB_TOKEN` |
| A `CLAUDE.md` or `AGENTS.md` | Optional but recommended — see `example-claude-rules.md` in this folder |

Estimated cost: ~$0.01–0.05 per PR depending on diff size.

## Install (20 minutes, mostly waiting)

### Option A — guided install via setup.sh

```bash
# from inside this repo
bash patterns/pr-review-agent/setup.sh /path/to/your/target/repo
```

The script copies the workflow, the agent script, and the example `CLAUDE.md` into the right places in the target repo, then prints next steps for setting secrets.

### Option B — manual

1. Copy `patterns/pr-review-agent/.github/workflows/pr-review.yml` into your target repo at the same path
2. Copy `patterns/pr-review-agent/agent.py` into your target repo at `.github/scripts/pr-review-agent.py` (and update the workflow's `run:` step to point there)
3. Copy `example-claude-rules.md` to your repo root as `CLAUDE.md` and edit
4. Set repo secrets:
   ```bash
   gh secret set COMPOSIO_API_KEY
   gh secret set OPENAI_API_KEY
   ```
5. Open a PR and watch the review post

## Tuning the rubric

The agent's behavior is shaped by three things, in order of leverage:

1. **Your `CLAUDE.md` / `AGENTS.md`** — this is your rubric. The agent treats every rule in it as required. Be specific. See `example-claude-rules.md` for what mine looks like.
2. **The agent's system prompt** — in `agent.py`, the `instructions=` block. Customize what the agent prioritizes, ignores, or formats differently.
3. **The model** — defaults to `gpt-4o-mini` for cost. Swap to `gpt-4o` or `claude-3-5-sonnet` for higher-stakes repos. Edit `agent.py`.

## How it works (under the hood)

```
PR opened/synced
   ↓
GitHub Action triggers pr-review.yml
   ↓
Action runs agent.py
   ↓
agent.py uses Composio to:
   - Read PR metadata (title, description, files changed)
   - Read the diff
   - Look for CLAUDE.md or AGENTS.md in the repo root
   - Read those files as the rubric
   ↓
OpenAI Agents SDK runs the review prompt against the gathered context
   ↓
Agent uses Composio's GitHub tools to post the review as a PR comment
```

Composio handles the GitHub API calls (auth, rate limits, etc.). The OpenAI Agents SDK handles the agent loop. You write the rules.

## Troubleshooting

| Problem | Fix |
|---|---|
| "Composio user not found" | The agent uses a hardcoded `user_id="user_123"` for the GitHub Action. Pre-authorize that user once at the Composio dashboard. |
| Agent posts nothing | Check action logs in the Actions tab. Most failures are missing secrets or rate-limited LLM calls. |
| Reviews are too long / nitpicky | Tighten `CLAUDE.md`. Add a `## What NOT to flag` section explicitly. |
| Reviews miss real bugs | Add specific rules in `CLAUDE.md` for the kind of bug you care about. Example: "Always flag SQL string concatenation." |
| Cost too high | Switch to `gpt-4o-mini` in `agent.py` (default) or limit the workflow trigger to specific branches |

## Files in this folder

| File | What it is |
|---|---|
| `README.md` | This file |
| `agent.py` | The agent. Python, ~90 lines, uses `composio` + `openai-agents`. |
| `.github/workflows/pr-review.yml` | The GitHub Actions workflow. Triggers on PR open/sync. |
| `example-claude-rules.md` | An example `CLAUDE.md` rubric — copy to your repo root and edit |
| `.env.example` | Required environment variables, for local testing |
| `setup.sh` | One-shot installer for target repos |

## Origin

This pattern was lifted from the Composio docs repo (`docs/examples/pr-review-agent/`) and adapted. The original is excellent reference material for how to compose Composio + OpenAI Agents SDK; this version adds the install script, example rubric, and integrated documentation so it's ready to drop into any repo.

## What's next

- `agent-anthropic.py` — same agent, Claude as the LLM instead of OpenAI
- `agent-with-tests.py` — variant that also runs the test suite and includes test failures in the review
- Webhook variant for non-GitHub repos (GitLab, Bitbucket)

Status today: works on GitHub repos with OpenAI as the LLM. Other variants are scoped, not built.
