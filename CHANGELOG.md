# Changelog

All notable changes to this repo. Format inspired by [Keep a Changelog](https://keepachangelog.com).

## [Unreleased]

### Queued for v0.3
- **`agents/claude-code/rules/`** — port the portable rules (voice, naming, workflow, code quality, design guardrails, stack preferences, testing) from the private setup
- **`hooks/`** — port the working Claude Code hooks (destructive-command block, dependency check, quality gate) with documentation
- **`agents/claude-code/subagents/`** — first subagent set, starting with `pr-reviewer.md`
- **`agents/claude-code/skills/`** — index of skills in use (skills install separately)
- Productized `llm-guardrails/` (stack-agnostic, with setup scripts for Next.js and Astro)
- `recipes/new-humanlup-client.md` — discovery to first deploy
- `recipes/add-pr-review-to-existing-repo.md` — short version of the pattern install

### Queued for v0.4
- `patterns/humanlup-site-starter/` — Next.js + Tailwind v4 + Sanity starter tuned for SD small biz
- `patterns/daily-digest/` — GitHub activity → Slack via cron
- `patterns/email-triage-agent/` — Gmail labeler that sorts inbox by sender intent
- Real installable skills (not just an index) for the most reusable ones

## [v0.2] — 2026-05-29 — pivot from prose to OS

This is a structural pivot. The repo went from "9 prose docs" to "a working AI OS."

### Added

- **`patterns/pr-review-agent/`** — turnkey GitHub Action that reviews PRs against `CLAUDE.md`/`AGENTS.md` rules. Includes `setup.sh` installer, example rubric, `.env.example`, full README.
- **`patterns/llm-guardrails/`** — pattern documented; production port queued.
- **`patterns/nl-sql-agent/`** — natural-language Supabase query agent, reference implementation.
- **`recipes/`** — `rename-repo-and-push.md` and `new-claude-code-project.md`. More queued.
- New top-level `README.md` — story-driven, positioning voice.

### Changed

- **Repo identity.** Pivoted from `best-practice-guidelines` (prose for humans) to `lupo-ai-os` (working setup for agents). The old name will redirect via GitHub.
- **Existing 9 prose docs** moved into [`guides/`](guides/) — preserved, indexed, still correct.

### Origin

Most patterns and templates here are adapted from production code at the Composio docs repo (`docs/agents/`, `docs/examples/`, `docs/decisions/`, `lib/llm-guardrails/`). All adaptations include origin attribution in their READMEs. Major credit to the Composio docs team for setting the bar.

## [v0.1] — 2026-04-16 — initial publication

The original `best-practice-guidelines` repo with 9 prose engineering standards (clean code, gitflow, python, next.js, tailwind, css design tokens, database, templating standards, creative standards).

All content from this version is preserved in [`guides/`](guides/) under the same filenames.
