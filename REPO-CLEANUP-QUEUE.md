# Repository Salvage and Cleanup Queue

This queue turns repository sprawl into controlled review, salvage, consolidation, and user-approved lifecycle decisions.

## Current estate

- 69 repositories
- 26 archived
- 43 active
- 0 automatically renamed, archived, or deleted

## Latest progress — 2026-08-06

Completed a file-level Margie workflow salvage pass.

Preserved in `docs/repo-salvage/2026-08-06-margie-content-workflow-manifest.md`:

- scheduling domain concepts from `margie-social-studio/src/hooks/useScheduledPosts.ts`
- calendar review interaction from `margie-social-studio/src/components/SchedulerCalendar.tsx`
- content-library, preview, analytics, and Brentwood utility module inventory from `margie-social-studio/README.md`
- AI knowledge, valuation, market pulse, and neighborhood concepts from `margielupo-1/README.md`
- a normalized editorial-item model for future `margie-os`
- explicit repair requirements and production boundaries

No application code was copied wholesale. The existing Vite/shadcn prototypes are source material, not the future architecture.

## Batch 01 — component and design-system overlap

| Repository | Classification | Direction |
|---|---|---|
| `untitled-ui` | `CORE` | Main component library and visual catalog |
| `design-system-hub-ui` | `SALVAGE` | Extract catalog navigation, token presentation, and inspection concepts |
| `nextui-component-library` | `REVIEW` | Recommend retirement if it is only a generated shell |
| `visualize-workflow` | `SALVAGE / KEEP` | Extract an accessible workflow visualizer and schema into `untitled-ui` and `lupo-ai-os` |

Required before lifecycle decisions: provenance, responsive review, keyboard operation, reduced motion, and deployment checks.

## Batch 02 — design knowledge and prompt overlap

| Repository | Classification | Direction |
|---|---|---|
| `aiuiux-playbooks` | `ACTIVE DESTINATION` | Normalized design knowledge, prompt kits, findings schemas, and QA checklists |
| `nightowl-prompts` | `CONSOLIDATE` | Preserve taxonomy, search, favorites, collections, command palette, and local-first persistence |
| `prompts-071525` | `RETIREMENT CANDIDATE` | Inspect unique records, import/export formats, filters, and UI |
| `vivid-uiux-prompt-library` | `CONSOLIDATE` | Preserve schema, types, generation logic, analytics models, and setup guidance |
| `checklists-and-prompts` | `CONSOLIDATE` | Compare unique prompts and metadata before retirement recommendation |
| `design-intelligence` | `THIN EXPERIMENT` | Inspect unique scoring, extraction, research, or recommendation logic |

## Batch 03 — agent and operating-system overlap

| Repository | Classification | Result / next gate |
|---|---|---|
| `claude-config` | `CORE SUPPORT` | Keep separate as deployed configuration source of truth |
| `daily-dose-agent` | `ACTIVE PRODUCT` | Extract newsletter synthesis workflow pattern |
| `code-autopsy` | `ACTIVE PRODUCT` | Filename-grounded audit schema already preserved |
| `ai-os` | `READY FOR DECISION` | Operating model preserved; inspect branches and deployments, then recommend archive as superseded |
| `ai-insights` | `SALVAGED / CONSOLIDATE` | Fan-out/fan-in workflow preserved; inspect branches and integrations |
| `taste` | `INCUBATING` | Implement a real agent-taste schema or consolidate the idea |
| `social-post` | `CLEANUP CANDIDATE` | Empty repository; verify branches, history, hooks, and integrations |

## Batch 04 — Margie real-estate family

| Repository | Classification | Direction |
|---|---|---|
| `margielupo-com` | `CLIENT / PRODUCTION` | Keep as only deployable public-site source of truth; no salvage writes |
| `margielupo-docs` | `CLIENT / AUTHORITY HUB` | Keep strategy, SEO, brand knowledge, deliverables, and backup policy authoritative |
| `margie-social-studio` | `SALVAGE / PRODUCT PROTOTYPE` | Preserve library, scheduler, previews, analytics, hooks, and Brentwood utilities |
| `margielupo-1` | `ARCHIVED / SALVAGE` | Inspect unique implementation and assets for AI chat, valuation, market, and neighborhood concepts |
| future `margie-os` | `PROPOSED DESTINATION` | Independent editorial OS using mocked data first and the active design system |

### Completed

- repository-role boundary documented
- scheduling hook and calendar component inspected
- normalized editorial entity proposed
- first provenance ledger created
- production and authority repositories left untouched

### Next gates

1. inspect content library and platform-preview files in `margie-social-studio`
2. inspect analytics hooks and Brentwood market-data utilities
3. locate actual feature and asset paths in `margielupo-1`
4. check non-default branches and deployment/integration links
5. create `margie-os` only when its first milestone is ready to scaffold

No current Margie repository is ready for deletion. `margielupo-1` remains archived; `margie-social-studio` remains available until all reusable work is represented in provenance.

## Batch 05 — Plants family

Repositories: `photosynthesis-site`, `plant-species-app`, `plant-universe-experiment`, `plants-intro-hero`, and `v0-plants-interactive-gallery`.

Compare before selecting a primary destination:

- illustrations and image assets
- plant schemas and species content
- hero and gallery interactions
- responsive behavior and accessibility
- deployments and integrations

## Next priority order

1. Finish file-level Margie social-studio inventory and archived predecessor asset review.
2. Confirm `ai-insights`, `ai-os`, and `social-post` branch/integration state.
3. Extract and repair the accessible `visualize-workflow` pattern.
4. Compare `nightowl-prompts` and `vivid-uiux-prompt-library` against `aiuiux-playbooks`.
5. Begin the Plants family comparison.
6. Review thin and ambiguously named active repositories added since the original inventory.

## Proposed rename queue

Recommendations only. Do not rename automatically.

| Current | Proposed | Reason |
|---|---|---|
| `untitled-ui` | `lupos-ui` or `kit-lupos-ui` | Replace temporary naming with an owned system identity |
| `checklists-and-prompts` | `kit-uiux-prompts` | Clarify reusable reference purpose if retained |
| `daily-dose-agent` | `agent-daily-dose` | Align with purpose-based naming |
| `code-autopsy` | `app-code-autopsy` | Clarify runnable-product status |
| `design-system-hub-ui` | `lab-design-system-workbench` | Mark experimental source material |
| `nightowl-prompts` | `app-nightowl-prompts` | Clarify product type if retained |
| `prompts-071525` | `lab-elite-prompts` | Remove date and generator-era naming |
| `design-intelligence` | `lab-design-intelligence` | Mark as experimental |
| `visualize-workflow` | `lab-workflow-visualizer` | Describe its strongest function |
| `taste` | `kit-agent-taste` | Clarify reusable context purpose if implemented |
| `ai-insights` | `lab-ai-insights` | Use only if retained rather than consolidated |
| `margielupo-docs` | `margie-workspace` | Optional; requires local-path and automation checks |
| `margie-social-studio` | `lab-margie-social-studio` | Optional after salvage is complete |

## Decision gate

A repository is ready for a user decision only after:

- unique code, docs, prompts, and assets have been inspected
- reusable material has been copied, adapted, or intentionally left in place
- provenance is documented
- dependencies, branches, deployments, and integrations are checked
- a destination and naming recommendation are recorded

No repository is renamed, archived, deleted, or removed automatically.