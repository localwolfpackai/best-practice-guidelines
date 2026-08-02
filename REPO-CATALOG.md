# Repository Catalog

Central inventory for the `localwolfpackai` GitHub estate.

## Status vocabulary

- `CORE`: long-term destination repository
- `ACTIVE`: current project with a clear purpose
- `INCUBATING`: experiment still being evaluated
- `CLIENT`: client-specific work
- `SALVAGE`: review for reusable code, design, prompts, or assets
- `CONSOLIDATE`: preserve unique value, then merge into a stronger destination
- `REVIEW`: not yet deeply inspected
- `CLEANUP CANDIDATE`: empty or superseded repository awaiting final checks and user decision

## Core destinations

| Repository | Purpose | Status |
|---|---|---|
| `untitled-ui` | Design system, component library, and visual showcase | `CORE` |
| `lupo-ai-os` | Agent workflows, operating documentation, repo governance, and salvage provenance | `CORE` |
| `claude-config` | Versioned live Claude Code configuration, rules, skills, hooks, and backup policy | `CORE SUPPORT` |
| `aiuiux-playbooks` | Structured design findings, prompt kits, and QA playbooks | `ACTIVE` |
| `lupo-portfolio` | Portfolio and proof of work | `ACTIVE` |
| `sessions-and-lessons` | Durable learning record | `ACTIVE` |

## Client work

`bumperdoc-santee`, `margielupo-com`, `margielupo-docs`, `margie-social-studio`, `guyfox-seo`, `meesh-fullsite`, and `tradition-x` remain separate. Reusable patterns may be copied out with source attribution.

## Design and UI repositories

| Repository | Status | Direction |
|---|---|---|
| `design-system-hub-ui` | `SALVAGE` | Extract catalog navigation, token presentation, and preview concepts into `untitled-ui` |
| `nextui-component-library` | `REVIEW` | Thin v0 synchronization shell; verify whether it contains unique implementation |
| `visual-canvas` | `INCUBATING` | Review for preview and canvas patterns |
| `geist-pixel-studio` | `INCUBATING` | Review typography and pixel-system assets |
| `vivid-uiux-prompt-library` | `CONSOLIDATE` | Verify schema and generator code, then move durable prompt patterns into `aiuiux-playbooks` |
| `visualize-workflow` | `SALVAGE / KEEP` | Preserve SVG workflow visualization and interaction model; extract to `untitled-ui` before any lifecycle decision |
| `v0-darkloops` | `SALVAGE` | Review reusable visual loops and components |
| `glass-agent-portal` | `SALVAGE` | Review agent-dashboard patterns |
| `frosted-agent-flow` | `SALVAGE` | Review workflow visualization patterns |
| `ai-studio-revamp` | `SALVAGE` | Review layouts and visual assets |
| `lupo-craft` | `SALVAGE` | Review editor and craft patterns |
| `lupo-engine` | `SALVAGE` | Review architecture and utilities |

## AI systems and workflow repositories

| Repository | Status | Direction |
|---|---|---|
| `claude-config` | `CORE SUPPORT` | Keep separate; it is the deployed Claude Code configuration source of truth |
| `daily-dose-agent` | `ACTIVE` | Keep as a product; extract its newsletter synthesis pipeline pattern into `lupo-ai-os` |
| `code-autopsy` | `ACTIVE` | Keep as a product; structured filename-grounded audit schema has been preserved in `lupo-ai-os` |
| `checklists-and-prompts` | `CONSOLIDATE` | Compare content against `aiuiux-playbooks`, preserve unique metadata and prompts, then propose retirement |
| `nightowl-prompts` | `CONSOLIDATE` | Preserve prompt taxonomy, command-palette browsing, search/filtering, and local-first storage patterns |
| `prompts-071525` | `RETIREMENT CANDIDATE` | Inspect code for unique prompt data or UI; otherwise recommend archive as a dated v0 sync shell |
| `ai-os` | `CONSOLIDATE` | Preserve workspace taxonomy, naming rules, status board, templates, and distinct brand assets in `lupo-ai-os`; then recommend archive as superseded |
| `taste` | `INCUBATING` | Define a real agent-taste schema and corpus or preserve the concept in `aiuiux-playbooks` |
| `ai-insights` | `REVIEW / THIN INCUBATOR` | Inspect 2 KB repository for unique prompts or data models; otherwise consolidate |
| `social-post` | `CLEANUP CANDIDATE` | Zero-size repository; confirm branch history and integrations before recommending archive or deletion |
| `design-intelligence` | `REVIEW / THIN EXPERIMENT` | Confirm whether unique design scoring or research logic exists beyond the Gemini AI Studio shell |
| `fable-automation-ideas` | `INCUBATING` | Keep as an idea backlog or merge into the OS roadmap |
| `site-contextlup` | `ACTIVE` | Clarify product boundary and role |
| `stealth-the-lab` | `ACTIVE` | Clarify product boundary and naming |

## Salvage records

- `docs/repo-salvage/2026-07-31-agent-workflow-findings.md` — boundaries and reusable patterns from `claude-config`, `daily-dose-agent`, `code-autopsy`, and `checklists-and-prompts`.
- `docs/repo-salvage/2026-08-01-prompt-and-visualization-findings.md` — prompt-library overlap and the reusable workflow-visualization pattern.
- `docs/repo-salvage/2026-08-02-os-and-incubator-overlap.md` — OS consolidation plan and review of `taste`, `ai-insights`, and `social-post`.

## Content and publishing

`brand-sessions`, `docs`, `the-field-notebook`, `sessions-and-lessons`, and the `localwolfpackai` profile repository are active publishing surfaces. `content-googleai` and `france-travel-june-2026` require review for durable records.

## Plants projects

`photosynthesis-site`, `plant-species-app`, `plant-universe-experiment`, `plants-intro-hero`, and `v0-plants-interactive-gallery` form one related project family. Preserve distinctive art and interactions before selecting a primary application.

## Remaining review set

`3d-hero`, `ai-campaign-gen`, `canvas-mvp`, `clearview-gemini-nov24`, `film-arc-generator`, `ideaflow-googleaistudio`, `interactive-avatar`, `lh-voice-2-insight`, `margin`, `mm-playbook-01`, `nextjs-clean-website-sanity-template`, `oatmeal`, `ricks-park`, `tequila-espresso`, `v0-l0vit-1`, `v0-project-overview-page-design`, and `v0-voice-agent-v1`.

## Naming system

Use durable purpose-based names. Preferred optional prefixes:

- `site-` for websites
- `app-` for interactive products
- `kit-` for reusable libraries and templates
- `lab-` for experiments
- `agent-` for agent implementations

Avoid dates, `untitled`, and generator names such as `v0-` once a project has a real identity.

## Provenance rule

Every salvaged item must record its source repository, original file path, destination, and reason for preservation. No repository lifecycle change happens automatically.