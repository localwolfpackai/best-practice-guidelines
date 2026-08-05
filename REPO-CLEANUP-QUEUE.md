# Repository Salvage and Cleanup Queue

This queue converts repository sprawl into a controlled sequence of review, salvage, consolidation, and user-approved lifecycle decisions.

## Batch 01: component and design-system overlap

| Repository | Classification | Direction |
|---|---|---|
| `untitled-ui` | `CORE` | Main component library and visual catalog |
| `design-system-hub-ui` | `SALVAGE` | Extract catalog navigation, token presentation, and inspection-panel concepts into `untitled-ui` |
| `nextui-component-library` | `REVIEW` | Inspect tree and deployment linkage; recommend retirement if it is only a generated shell |

## Batch 02: design knowledge and prompt overlap

| Repository | Classification | Direction |
|---|---|---|
| `aiuiux-playbooks` | `ACTIVE DESTINATION` | Normalized design knowledge, prompt kits, findings schemas, and QA checklists |
| `nightowl-prompts` | `CONSOLIDATE` | Preserve taxonomy, search, favorites, collections, command palette, and local-first persistence |
| `prompts-071525` | `RETIREMENT CANDIDATE` | Inspect unique prompt records, import/export formats, filters, and original UI before recommending archive |
| `vivid-uiux-prompt-library` | `CONSOLIDATE` | Preserve schema, types, prompt generation logic, useful analytics models, and non-developer setup guidance |
| `design-intelligence` | `THIN EXPERIMENT` | Inspect for unique scoring, extraction, research, or recommendation logic |

## Batch 03: agent and workflow overlap

| Repository | Classification | Result |
|---|---|---|
| `claude-config` | `CORE SUPPORT` | Keep separate; deployed Claude Code configuration source of truth |
| `daily-dose-agent` | `ACTIVE PRODUCT` | Keep; newsletter synthesis workflow remains queued for extraction |
| `code-autopsy` | `ACTIVE PRODUCT` | Keep; filename-grounded audit schema preserved in `lupo-ai-os` |
| `checklists-and-prompts` | `CONSOLIDATE` | Compare prompts and metadata against `aiuiux-playbooks` before retirement decision |

## Batch 04: workflow visualization

### `visualize-workflow`

**Classification:** keep or extract before lifecycle review  
**Preserve:** `src/components/AiToolsVisualizer.tsx`, four-mode workflow data, SVG path animation, particle flow, prediction overlay, confidence scoring, parallax treatment, dark mode, and 8-point spacing discipline.  
**Destination:** visual component to `untitled-ui`; workflow schema and operating notes to `lupo-ai-os`.  
**Required improvements:** keyboard operation, reduced-motion handling, semantic labels, and responsive verification.  
**Proposed future name:** `lab-workflow-visualizer`.

## Batch 05: OS overlap and thin incubators

### `ai-os`

**Classification:** reusable work preserved; ready for a user-approved lifecycle decision.  
**Preserved in:** `docs/operating-model/project-lifecycle-and-structure.md`.  
**Recommendation:** archive as superseded after checking deployments, non-default branches, and remaining brand assets. Preserve commit history.

### `taste`

**Classification:** incubating concept with insufficient implementation.  
**Direction:** create a real `kit-agent-taste` schema and starter corpus or preserve the concept inside `aiuiux-playbooks`. Do not keep an empty shell indefinitely.

### `ai-insights`

**Classification:** reusable work preserved; consolidation candidate.

Recovered from commit history:

- multi-stage Claude orchestration
- initial framing node
- parallel specialist fan-out
- context-packet resolution and submission
- fan-in merge with a token budget

Preserved and normalized in:

- `docs/workflows/fan-out-fan-in-agent-pipeline.md`

Provenance:

- source commit: `999a1a33d4b9bc500a3639b8872b22fb48874fd2`
- original path: `claude-code/responses/2026-04-21_orchestrator-pipeline-template.sh`

Safety improvements during salvage:

- removed a machine-specific absolute path
- replaced deletion of shared state with an isolated temporary run directory
- added node contracts, failure guidance, cleanup traps, and portability rules

**Next gate:** inspect non-default branches and integrations. If no additional unique work exists, recommend archiving `ai-insights` as superseded by `lupo-ai-os`. Do not delete it.

### `social-post`

**Classification:** empty cleanup candidate.  
**Next action:** confirm branches, history, deployment hooks, and integrations. If empty, present user-approved archive or deletion options.

## Batch 06: Margie real-estate repository family

### Operating boundary

| Repository | Classification | Direction |
|---|---|---|
| `margielupo-com` | `CLIENT / PRODUCTION` | Keep as the only deployable public-site source of truth; do not use as the experimental OS workspace |
| `margielupo-docs` | `CLIENT / AUTHORITY HUB` | Keep strategy, SEO, brand knowledge, deliverables, and backup policy authoritative here |
| `margie-social-studio` | `SALVAGE / PRODUCT PROTOTYPE` | Preserve content library, scheduler, previews, analytics, hooks, and Brentwood data for future `margie-os` |
| `margielupo-1` | `ARCHIVED / SALVAGE` | Review AI chat, valuation, market pulse, neighborhood explorer, knowledge-base, and Supabase patterns before confirming continued archive status |
| future `margie-os` | `PROPOSED DESTINATION` | New independent editorial operating system with mocked data first; no production dependency during MVP |

**Preserved analysis:** `docs/repo-salvage/2026-08-05-margie-repository-family.md`.

**Safe next actions:**

1. inspect non-default branches and deployment integrations for all four existing repositories
2. inventory file-level reusable material in `margie-social-studio` and `margielupo-1`
3. define a provenance manifest before copying code or assets
4. create `margie-os` only as an independent repository
5. keep Google Drive, AI generation, authentication, and live publishing out of the first milestone

**Lifecycle position:** no current Margie repository is ready for deletion. `margielupo-1` should remain archived until unique assets are verified. `margie-social-studio` should remain available until its useful patterns are preserved.

## Plants project family

Repositories: `photosynthesis-site`, `plant-species-app`, `plant-universe-experiment`, `plants-intro-hero`, and `v0-plants-interactive-gallery`.

Before selecting a primary destination, compare:

- distinctive illustrations and image assets
- plant data schemas and species content
- hero and gallery interactions
- responsive behavior and accessibility
- deployment state and external integrations

No member should be retired until unique assets and interactions are preserved with provenance.

## Next priority order

1. Inventory file-level reusable patterns in `margie-social-studio` and `margielupo-1`; keep the production and docs repositories untouched.
2. Confirm `ai-insights` and `ai-os` branch and integration state; prepare archive recommendations if clean.
3. Inspect branch history and integrations for `social-post`.
4. Extract the accessible `visualize-workflow` component with provenance.
5. Compare `nightowl-prompts` taxonomy against `aiuiux-playbooks` schemas.
6. Begin the Plants project-family comparison.

## Proposed rename queue

| Current | Proposed | Reason |
|---|---|---|
| `untitled-ui` | `lupos-ui` or `kit-lupos-ui` | Replace temporary naming with an owned design-system identity |
| `checklists-and-prompts` | `kit-uiux-prompts` | Clarify reusable reference purpose if retained |
| `daily-dose-agent` | `agent-daily-dose` | Align with purpose-based naming |
| `code-autopsy` | `app-code-autopsy` | Clarify that it is a runnable product |
| `design-system-hub-ui` | `lab-design-system-workbench` | Mark experimental source material clearly |
| `nightowl-prompts` | `app-nightowl-prompts` | Clarify product type if retained independently |
| `prompts-071525` | `lab-elite-prompts` | Remove the date and identify the experiment |
| `design-intelligence` | `lab-design-intelligence` | Mark the AI Studio project as experimental |
| `visualize-workflow` | `lab-workflow-visualizer` | Describe its strongest reusable function |
| `taste` | `kit-agent-taste` | Clarify reusable agent-context purpose if implemented |
| `ai-insights` | `lab-ai-insights` | Use only if retained; current recommendation is consolidation after final checks |
| `margielupo-docs` | `margie-workspace` | Optional only; better reflects authority-hub role, but requires local-path and automation checks |
| `margie-social-studio` | `lab-margie-social-studio` | Optional after salvage; makes prototype status explicit |

## Decision gate

A repository is ready for a user decision only after:

- unique assets and code have been inspected
- reusable material has been copied or intentionally left in place
- provenance has been documented
- dependencies, branches, and deployment links have been checked
- a recommended destination and name have been recorded

No repository is renamed, archived, deleted, or removed automatically.
