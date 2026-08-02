# OS and incubator overlap review — 2026-08-02

## Scope

Reviewed the current repository inventory, including archived repositories, with a focused comparison of `ai-os`, `lupo-ai-os`, and very small incubator repositories.

## Findings

### `ai-os`

**Classification:** consolidate into `lupo-ai-os`, then lifecycle review.

**Why:** `ai-os` contains a strong workspace taxonomy organized by business function and project state:

- `00-command-center`
- `01-brand-studio`
- `02-content-engine`
- `03-products`
- `04-labs`
- `05-agents`
- `06-knowledge`
- `07-ops`
- `08-assets`
- `09-archive`

This is useful operating architecture, but the repository overlaps directly with `lupo-ai-os`, which is already the public source of truth for agent patterns, recipes, guides, repository governance, and salvage provenance.

**Reusable material to preserve:**

| Source | Destination | Reason |
|---|---|---|
| `ai-os/README.md` workspace taxonomy | `lupo-ai-os/guides/workspace-architecture.md` | Durable function-and-state organization model |
| `ai-os/07-ops/NAMING_CONVENTIONS.md` | Merge non-duplicative rules into `lupo-ai-os` governance docs | Naming discipline |
| `ai-os/00-command-center/PROJECT_STATUS.md` | Adapt into a reusable status-board pattern | Operational visibility |
| `ai-os/07-ops/repo-templates/project-starter/` | Compare with existing recipes before copying | Potential project bootstrap template |
| `ai-os/01-brand-studio/site/` | Review for original branding or visual assets | Preserve only distinct work |

**Recommendation:** Do not archive yet. First complete the file-level comparison and copy only non-duplicative operating material with provenance. After preservation, recommend archiving `ai-os` as superseded by `lupo-ai-os`.

### `taste`

**Classification:** incubating knowledge-layer concept.

The repository currently contains a concise philosophy and brand assets but no substantive knowledge corpus. The concept is valuable: provide agents with curated aesthetic and editorial context rather than generic rules.

**Destination options:**

1. Keep as a focused product only after a real schema and initial corpus exist.
2. Otherwise preserve the concept in `aiuiux-playbooks` as a `taste-context` collection and recommend archiving the shell.

**Proposed future name if retained:** `kit-agent-taste`.

### `ai-insights`

**Classification:** empty or near-empty incubator requiring final file inspection.

At repository size 2 KB, it should not remain an ambiguous active repository. Compare its contents against `aiuiux-playbooks`, `daily-dose-agent`, and `lupo-ai-os`. Preserve any unique prompt or data model, then recommend consolidation if no runnable product boundary exists.

**Proposed future name if retained:** `lab-ai-insights`.

### `social-post`

**Classification:** empty repository cleanup candidate.

The repository reports zero size. There is no reusable work to preserve unless branches or deployment links reveal otherwise. Confirm branch history and integrations, then recommend archive or deletion through a user-approved decision.

**Proposed future name if retained:** none until a concrete purpose exists.

## Inventory snapshot

The connected account currently exposes 64 repositories in the reviewed page, including archived repositories. The estate now has two clearly overlapping OS repositories, several mature destination repositories, and a small group of empty or near-empty incubators that should be resolved before more experiments are created.

## Decision rule

No repository should be archived, renamed, or deleted until unique work, branch history, deployment links, and reusable assets have been checked and provenance has been recorded.