# Patterns

Reusable agent architectures you drop into target repos. Not snippets — full working setups with their own README, install script, and example config.

## What's here

| Pattern | What it does | Status |
|---|---|---|
| [`pr-review-agent/`](pr-review-agent/) | CLAUDE.md-aware PR reviewer as a GitHub Action | Ready |
| [`llm-guardrails/`](llm-guardrails/) | Inject hidden instructions into `/llms.txt` so AI agents describe your site/SDK correctly | Pattern documented, port in progress |
| [`nl-sql-agent/`](nl-sql-agent/) | Natural language → SQL queries via Composio + Supabase | Reference impl, productize later |

## What makes something a "pattern"

A pattern in this repo always has:

1. **A README that explains the 60-second pitch.** What it does, why, what you need to run it.
2. **Working code.** Not pseudocode, not "imagine you have…" examples. Real files that run.
3. **An install path.** Either a `setup.sh` script, or a documented manual install with copy-paste commands.
4. **Origin attribution.** Where this pattern came from. Most of mine adapted from production code in other repos — I credit the source.

If something doesn't have all four, it's not a pattern yet — it's a draft.

## How to use patterns

Patterns are designed to be **forked into target repos**, not run from inside this repo. The flow:

```bash
# from anywhere
git clone https://github.com/localwolfpackai/lupo-ai-os.git

# install a pattern into your target repo
cd lupo-ai-os
bash patterns/pr-review-agent/setup.sh /path/to/your/target/repo

# the target repo now has its own copy — edit it freely
```

Once installed, the pattern lives independently in your target repo. Updates here don't auto-propagate. That's intentional — once a pattern is in your repo, it's yours to evolve.

## Coming next

- `humanlup-site-starter/` — Next.js + Tailwind v4 + Sanity starter tuned for SD small-biz sites
- `daily-digest/` — GitHub activity summarized to Slack via cron
- `email-triage-agent/` — Gmail labeler that sorts inbox by sender intent
- `voice-validator/` — pre-commit hook that checks content against `rules/voice.md`

If you want to see one of these next, [open an issue](https://github.com/localwolfpackai/lupo-ai-os/issues).
