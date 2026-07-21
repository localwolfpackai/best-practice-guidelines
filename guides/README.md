# Guides

Engineering standards as prose. These are the original `best-practice-guidelines` documents, preserved here because they're still useful reference material — but they're no longer the headline of the repo.

For *patterns* you can install and run, see [`../patterns/`](../patterns/). The behavior-rules layer for Claude Code (rules, hooks, subagents) lands in v0.3 — see the [CHANGELOG](../CHANGELOG.md).

## What's in here

| Guide | What it covers | Use when |
|---|---|---|
| [Clean Code](clean-code.md) | Naming, structure, maintainability principles | Forgot why magic numbers are bad |
| [Gitflow](gitflow.md) | Branch strategy, commit conventions, release workflows | Onboarding a contributor |
| [Python](python.md) | Project structure, type hints, modern Python tooling | Starting a Python script or service |
| [Next.js](nextjs.md) | App Router patterns, server components, performance | Building a Next.js app |
| [Tailwind CSS](tailwind.md) | Utility-first styling, responsive design, component patterns | Reaching for Tailwind defaults |
| [CSS Design Tokens](css-design-tokens.md) | Custom properties for typography, color, spacing, layout | Setting up a new design system |
| [Database](database.md) | Schema design, indexing, queries, security across ORMs | Designing a data model |
| [Templating Standards](templating-standards.md) | Naming conventions, folder structures, versioning | Standardizing across repos |
| [Creative Standards](creative-standards.md) | Semantic HTML, accessibility, performance, design system patterns | Building creative-led pages |

## How these relate to the rules layer (coming in v0.3)

Rules are **behavior instructions for Claude**. Tight, prescriptive, sometimes terse. They're meant to load fast into a context window and apply automatically. They ship in `agents/claude-code/rules/` in v0.3.

The guides here are **reference for humans** (and for Claude when asked specifically). They explain *why* the conventions are what they are, with examples.

When they overlap, the rules win for Claude's behavior. The guides win when you're trying to teach a new contributor.

## Why I'm keeping the guides

Three reasons:

1. **They're still correct.** The conventions in these files match how I work today.
2. **Renaming a repo doesn't have to mean breaking content.** If someone bookmarked `clean-code.md`, it still works at the new path.
3. **Prose explanations have a different shape than rules.** A rule says "no `any`." A guide explains *why* and shows what to do instead.

## Origin

These were the entire content of the original `best-practice-guidelines` repo. They date from ~2026 and accumulated as I worked on real projects. Some sections are tighter than others — `clean-code.md` is solid, `database.md` could use more concrete examples.

If you want to contribute updates, [open an issue](https://github.com/localwolfpackai/lupo-ai-os/issues) first so we agree on direction before you write.
