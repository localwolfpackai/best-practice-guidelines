# Repository Catalog

Central inventory and disposition map for the `localwolfpackai` GitHub estate.

## Inventory snapshot

- Repositories inventoried: **69**
- Archived: **26**
- Active: **43**
- Automatically renamed, archived, or deleted: **0**
- Last focused review: **2026-08-06 — Margie content workflow salvage**

## Status vocabulary

- `CORE`: long-term destination repository
- `ACTIVE`: current project with a clear purpose
- `INCUBATING`: experiment still being evaluated
- `CLIENT`: client-specific work
- `SALVAGE`: inspect for reusable code, design, prompts, docs, or assets
- `CONSOLIDATE`: preserve unique value, then merge into a stronger destination
- `REVIEW`: not deeply inspected yet
- `CLEANUP CANDIDATE`: empty or superseded after final checks and user decision

## Core destinations

| Repository | Purpose | Status |
|---|---|---|
| `untitled-ui` | Active design system, component library, and showcase | `CORE` |
| `lupo-ai-os` | Operating documentation, repo governance, workflows, and salvage provenance | `CORE` |
| `claude-config` | Live Claude Code configuration, rules, skills, hooks, and backup policy | `CORE SUPPORT` |
| `aiuiux-playbooks` | Design findings, prompt kits, and QA playbooks | `ACTIVE` |
| `lupo-portfolio` | Portfolio and proof of work | `ACTIVE` |
| `sessions-and-lessons` | Durable learning record | `ACTIVE` |

## Client repositories

Keep client work isolated: `bumperdoc-santee`, `margielupo-com`, `margielupo-docs`, `margie-social-studio`, `guyfox-seo`, `meesh-fullsite`, and `tradition-x`. Reusable patterns may be copied out only with provenance.

### Margie family

| Repository | Status | Boundary and direction |
|---|---|---|
| `margielupo-com` | `CLIENT / PRODUCTION` | Only deployable public-site source of truth; keep isolated |
| `margielupo-docs` | `CLIENT / AUTHORITY HUB` | Strategy, SEO, brand knowledge, project map, and deliverables |
| `margie-social-studio` | `SALVAGE / PRODUCT PROTOTYPE` | Preserve workflow models, library, previews, analytics, scheduler, and Brentwood utilities for future `margie-os` |
| `margielupo-1` | `ARCHIVED / SALVAGE` | Preserve unique AI knowledge, valuation, market, neighborhood, and asset concepts before any further decision |
| future `margie-os` | `PROPOSED DESTINATION` | Independent internal editorial OS; mocked data first; no production dependency |

The first file-level manifest is documented in `docs/repo-salvage/2026-08-06-margie-content-workflow-manifest.md`. It preserves scheduling semantics and calendar interaction patterns while explicitly rejecting wholesale migration of the old Vite/shadcn implementations.

## Design and UI family

| Repository | Status | Direction |
|---|---|---|
| `untitled-ui` | `CORE` | Destination for durable primitives, application components, and showcases |
| `design-system-hub-ui` | `SALVAGE` | Extract catalog navigation, token presentation, and inspection concepts |
| `nextui-component-library` | `REVIEW` | Verify whether it contains unique implementation beyond a generated shell |
| `visual-canvas` | `INCUBATING` | Review preview and canvas patterns |
| `geist-pixel-studio` | `INCUBATING` | Review typography and pixel-system assets |
| `visualize-workflow` | `SALVAGE / KEEP` | Extract accessible workflow visualization and schema |
| `v0-darkloops` | `SALVAGE` | Review visual loops and reusable motion patterns |
| `glass-agent-portal` | `SALVAGE` | Review agent-dashboard patterns |
| `frosted-agent-flow` | `SALVAGE` | Review workflow visualization patterns |
| `ai-studio-revamp` | `SALVAGE` | Review layouts and visual assets |
| `lupo-craft` | `SALVAGE` | Review editor and craft patterns |
| `lupo-engine` | `SALVAGE` | Review architecture and utilities |
| `vivid-uiux-prompt-library` | `CONSOLIDATE` | Move durable schemas and generator logic into `aiuiux-playbooks` |

## AI, prompts, and workflow family

| Repository | Status | Direction |
|---|---|---|
| `daily-dose-agent` | `ACTIVE PRODUCT` | Keep; extract newsletter synthesis pipeline pattern |
| `code-autopsy` | `ACTIVE PRODUCT` | Keep; audit schema already preserved in `lupo-ai-os` |
| `checklists-and-prompts` | `CONSOLIDATE` | Compare against `aiuiux-playbooks`, preserve unique metadata, then propose retirement |
| `nightowl-prompts` | `CONSOLIDATE` | Preserve taxonomy, command palette, search/filtering, and local-first storage |
| `prompts-071525` | `RETIREMENT CANDIDATE` | Inspect unique prompt data and UI before recommending archive |
| `ai-os` | `READY FOR DECISION` | Operating model preserved; check branches/deployments, then recommend archive as superseded |
| `ai-insights` | `SALVAGED / CONSOLIDATE` | Fan-out/fan-in Claude pipeline recovered and normalized; check branches/integrations |
| `taste` | `INCUBATING` | Implement a real agent-taste schema or preserve the concept in playbooks |
| `social-post` | `CLEANUP CANDIDATE` | Zero-size repository; verify history and integrations |
| `design-intelligence` | `REVIEW / THIN EXPERIMENT` | Confirm unique scoring or research logic |
| `fable-automation-ideas` | `INCUBATING` | Keep as roadmap material or merge into OS backlog |
| `site-contextlup` | `ACTIVE / BOUNDARY REVIEW` | Clarify product purpose |
| `stealth-the-lab` | `ACTIVE / BOUNDARY REVIEW` | Clarify product purpose and naming |

## Plants family

`photosynthesis-site`, `plant-species-app`, `plant-universe-experiment`, `plants-intro-hero`, and `v0-plants-interactive-gallery` overlap. Preserve unique plant data, illustrations, hero/gallery interactions, and responsive patterns before selecting a primary destination.

## Publishing and knowledge surfaces

Active publishing or knowledge repositories: `brand-sessions`, `docs`, `the-field-notebook`, `sessions-and-lessons`, `localwolfpackai`, and `claude-chrome-vault`.

Review for durable content or clearer boundaries: `content-googleai`, `france-travel-june-2026`, `mm-playbook-01`, and `fable-automation-ideas`.

## Remaining application and experiment review set

`3d-hero`, `ai-campaign-gen`, `canvas-mvp`, `clearview-gemini-nov24`, `film-arc-generator`, `ideaflow-googleaistudio`, `interactive-avatar`, `lh-voice-2-insight`, `margin`, `nextjs-clean-website-sanity-template`, `oatmeal`, `ricks-park`, `tequila-espresso`, `v0-l0vit-1`, `v0-project-overview-page-design`, and `v0-voice-agent-v1`.

## Complete inventory by lifecycle

### Archived (26)

`margielupo-1`, `nextui-component-library`, `lh-voice-2-insight`, `plants-intro-hero`, `ai-campaign-gen`, `frosted-agent-flow`, `prompts-071525`, `checklists-and-prompts`, `vivid-uiux-prompt-library`, `nightowl-prompts`, `lupo-craft`, `glass-agent-portal`, `canvas-mvp`, `film-arc-generator`, `ai-studio-revamp`, `code-autopsy`, `clearview-gemini-nov24`, `3d-hero`, `ideaflow-googleaistudio`, `content-googleai`, `design-intelligence`, `lupo-engine`, `v0-seo-action-plan`, `v0-project-overview-page-design`, `design-system-hub-ui`, `oatmeal`.

### Active (43)

`localwolfpackai`, `visualize-workflow`, `plant-universe-experiment`, `v0-l0vit-1`, `docs`, `meesh-fullsite`, `margie-social-studio`, `plant-species-app`, `photosynthesis-site`, `aiuiux-playbooks`, `interactive-avatar`, `margin`, `untitled-ui`, `lupo-ai-os`, `daily-dose-agent`, `tequila-espresso`, `visual-canvas`, `claude-config`, `taste`, `ai-insights`, `lupo-portfolio`, `guyfox-seo`, `stealth-the-lab`, `v0-voice-agent-v1`, `geist-pixel-studio`, `bumperdoc-santee`, `mm-playbook-01`, `v0-plants-interactive-gallery`, `tradition-x`, `sessions-and-lessons`, `v0-darkloops`, `margielupo-com`, `margielupo-docs`, `brand-sessions`, `site-contextlup`, `france-travel-june-2026`, `claude-chrome-vault`, `nextjs-clean-website-sanity-template`, `fable-automation-ideas`, `ricks-park`, `the-field-notebook`, `ai-os`, `social-post`.

## Salvage records

- `docs/repo-salvage/2026-07-31-agent-workflow-findings.md`
- `docs/repo-salvage/2026-08-01-prompt-and-visualization-findings.md`
- `docs/repo-salvage/2026-08-02-os-and-incubator-overlap.md`
- `docs/repo-salvage/2026-08-05-margie-repository-family.md`
- `docs/repo-salvage/2026-08-06-margie-content-workflow-manifest.md`
- `docs/operating-model/project-lifecycle-and-structure.md`
- `docs/workflows/fan-out-fan-in-agent-pipeline.md`

## Naming system

Prefer durable purpose-based names. Optional prefixes:

- `site-` websites
- `app-` interactive products
- `kit-` reusable libraries and templates
- `lab-` experiments
- `agent-` agent implementations

Avoid dates, `untitled`, and generator names such as `v0-` once a project has a durable identity.

## Provenance and lifecycle rule

Every salvaged item must record source repository, original path, destination, reason for preservation, and whether it was copied, adapted, or only documented. No repository is renamed, archived, deleted, or removed automatically.