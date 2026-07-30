<p align="center">
  <img src="logo.svg" alt="Lupo AI OS" width="56" height="56" />
</p>

<h1 align="center">Lupo AI OS</h1>

<p align="center">
  A working AI operating system for people who orchestrate Claude — not a list, not a curation, the actual setup I use to ship.
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-black" alt="MIT" /></a>
  <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/built%20for-Claude%20Code-black" alt="Claude Code" /></a>
  <a href="#start-with-one-of-these"><img src="https://img.shields.io/badge/v0.2-ai--os%20pivot-black" alt="v0.2" /></a>
</p>

---

## Who this is for

You orchestrate AI tools but you don't write production code. You want Claude Code to feel less like a chatbot and more like a coworker with a job description, a quality bar, and standing rules. You've already cloned a few "awesome-claude-code" lists and bounced — they're directories, not setups.

This is a setup.

## Why it exists

10 years selling SaaS at Salesforce, Yext, Samsara — President's Club at Yext. Pivoted to AI in 2023 and started building with Claude. Now I ship websites for San Diego small businesses at HumanLup and write daily about what I learn at Lupo Studios. None of that works without a system underneath it.

This repo is that system, made portable. Every file in here is something I actually run.

## What's inside

```
lupo-ai-os/
├── patterns/             — reusable agent architectures
│   ├── pr-review-agent/  — CLAUDE.md-aware PR reviewer, turnkey GitHub Action
│   ├── llm-guardrails/   — control how AI agents describe your site/SDK
│   └── nl-sql-agent/     — natural language → SQL via Composio + Supabase
├── recipes/              — opinionated walkthroughs for common bootstraps
├── guides/               — engineering standards and references
├── REPO-CATALOG.md       — central map of the GitHub estate
└── REPO-CLEANUP-QUEUE.md — salvage, naming, and consolidation queue
```

The config layer — portable rules, hooks, subagents — is the next port. See [Status](#status).

Each folder has its own README explaining the philosophy and what's inside.

## Repository governance

The GitHub estate is now treated as a portfolio of reusable assets rather than a pile of disconnected experiments.

- [`REPO-CATALOG.md`](REPO-CATALOG.md) records purpose, status, overlap, and destination.
- [`REPO-CLEANUP-QUEUE.md`](REPO-CLEANUP-QUEUE.md) tracks salvage work, provenance, naming proposals, and decision-ready cleanup candidates.

Repository lifecycle changes are never automatic. Unique work is reviewed and preserved before a rename, archive, or removal is proposed.

## Start with one of these

Pick the one that matches your day:

| If you want… | Start here | Time |
|---|---|---|
| A CLAUDE.md-aware PR reviewer on any repo | [`patterns/pr-review-agent/`](patterns/pr-review-agent/) | 20 min |
| To bootstrap a new project the right way | [`recipes/new-claude-code-project.md`](recipes/new-claude-code-project.md) | 10 min |
| Engineering standards docs (Next.js, Python, Tailwind, etc.) | [`guides/`](guides/) | browse |
| To understand or consolidate the GitHub estate | [`REPO-CATALOG.md`](REPO-CATALOG.md) | browse |

## How the pieces fit

```
  Claude Code  ─→  your repo
       │
       └─→ patterns/  (drop into target repos)
       └─→ recipes/   (walkthroughs you follow once)
       └─→ guides/    (reference when you forget a convention)
       └─→ catalog    (know what already exists before rebuilding)
```

Patterns are pre-built architectures you drop into target repos. Recipes are walkthroughs you follow once and reuse forever. Guides are reference material when you need to remember a convention. The repository catalog prevents duplicate work and turns older experiments into reusable assets.

## Design principles

- **Opinionated over exhaustive.** This isn't every Claude pattern that exists — it's the ones I use.
- **Every file runs.** No "TODO: write this section" stubs. If it's here, it ships.
- **The mess is the method.** Built by learning, breaking, shipping. The system reflects what survived.
- **Preserve before consolidating.** Reusable work keeps its source attribution.
- **No emojis. No "delve." No "leverage."** Real specifics over corporate fluff.

## Status

**v0.2 — pivot from prose to OS.** The original `best-practice-guidelines` content is preserved in [`guides/`](guides/). Patterns and recipes are the shape going forward.

- `patterns/pr-review-agent/` — ready to clone
- `patterns/llm-guardrails/` — pattern documented, port in progress
- `patterns/nl-sql-agent/` — reference implementation, productize later
- `agents/claude-code/` — portable rules, subagents, skills index — queued for v0.3
- `hooks/` — working Claude Code hooks — queued for v0.3
- Repository catalog and consolidation queue — active

## Contributing

Fork it. Steal from it. Open an issue if something doesn't make sense or breaks when you try it. This is a working setup — not academic.

## License

[MIT](LICENSE) — use it, remix it, ship with it.

---

Built and maintained by [Anthony Lupo](https://github.com/localwolfpackai). Find me on [X @humanlup](https://twitter.com/humanlup), [IG @_lupo](https://instagram.com/_lupo).

— Lupo / Still Human