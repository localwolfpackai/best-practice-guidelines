# Repository Salvage and Cleanup Queue

This queue converts repository sprawl into a controlled sequence of review, salvage, consolidation, and user-approved lifecycle decisions.

## Batch 01: component and design-system overlap

### `design-system-hub-ui`

**Classification:** salvage, then lifecycle review  
**High-value material:** catalog navigation, design foundations, writing-style documentation, and inspection-panel concepts.  
**Destination:** `untitled-ui`  
**Proposed future name if retained:** `lab-design-system-workbench`

### `nextui-component-library`

**Classification:** thin generated shell under review  
**Next action:** inspect repository tree and deployment linkage. If no unique work exists, prepare a retirement recommendation.  
**Proposed future name if retained:** `lab-v0-component-sync`

### `untitled-ui`

**Classification:** core destination  
**Direction:** continue as the main component library and visual catalog.

## Batch 02: design knowledge and prompt overlap

### `aiuiux-playbooks`

**Classification:** active, retain independently  
**Direction:** destination for normalized design knowledge, prompt kits, findings schemas, and QA checklists.

### `nightowl-prompts`

**Classification:** consolidate candidate  
**Preserve:** prompt taxonomy, categories/tags/favorites/collections, fast search, command-palette interaction, and local-first persistence model.  
**Destination:** `aiuiux-playbooks`; non-duplicative catalog interactions may be adapted into `untitled-ui`.  
**Proposed future name if retained:** `app-nightowl-prompts`.

### `prompts-071525`

**Classification:** retirement candidate after final code inspection  
**Reason:** dated name and README indicating a v0-synchronized ElitePrompts clone rather than a maintained source of truth.  
**Preserve before recommendation:** unique prompt records, import/export formats, filters, or original catalog UI.  
**Proposed future name if retained:** `lab-elite-prompts`.

### `vivid-uiux-prompt-library`

**Classification:** consolidate candidate  
**Inspect and preserve:** `src/schema.ts`, `src/types.ts`, `src/utils/generatePrompt.ts`, useful analytics models, and genuinely helpful non-developer setup documentation.  
**Destination:** `aiuiux-playbooks`.

### `design-intelligence`

**Classification:** thin experiment under review  
**Next action:** inspect for unique design scoring, extraction, research, or recommendation logic. If it is only a generated Gemini AI Studio shell, preserve prompts/config and recommend archive.  
**Proposed future name if retained:** `lab-design-intelligence`.

## Batch 03: agent and workflow overlap

| Repository | Classification | Result |
|---|---|---|
| `claude-config` | `CORE SUPPORT` | Keep separate; boundary and backup policy documented |
| `daily-dose-agent` | `ACTIVE PRODUCT` | Keep; newsletter synthesis workflow queued for extraction |
| `code-autopsy` | `ACTIVE PRODUCT` | Keep; structured filename-grounded audit schema preserved in `lupo-ai-os` |
| `checklists-and-prompts` | `CONSOLIDATE CANDIDATE` | Compare prompts and metadata against `aiuiux-playbooks` before retirement decision |

## Batch 04: workflow visualization

### `visualize-workflow`

**Classification:** keep or extract before lifecycle review  
**High-value material:** `src/components/AiToolsVisualizer.tsx`, four-mode workflow data model, SVG path animation, particle flow, hover prediction overlay, confidence scoring, parallax treatment, dark mode, and 8-point spacing discipline.  
**Destination:** visual component to `untitled-ui`; workflow schema and operating notes to `lupo-ai-os`.  
**Required improvements during extraction:** keyboard operation, reduced-motion handling, semantic labels, and responsive verification.  
**Proposed future name if retained:** `lab-workflow-visualizer`.

## Batch 05: OS overlap and thin incubators

### `ai-os`

**Classification:** consolidate, then recommend archive as superseded.  
**Destination:** `lupo-ai-os`.

Preserve before any lifecycle recommendation:

1. `README.md` function-and-state workspace taxonomy.
2. `07-ops/NAMING_CONVENTIONS.md` rules not already present in governance docs.
3. `00-command-center/PROJECT_STATUS.md` as a reusable status-board pattern.
4. `07-ops/repo-templates/project-starter/` after comparison with current recipes.
5. Distinct branding or visual assets from `01-brand-studio/site/`.

**Decision gate:** archive recommendation only after the above file-level comparison and provenance-backed extraction are complete.

### `taste`

**Classification:** incubating concept with insufficient implementation.  
**Preserve:** philosophy of supplying agents with opinionated aesthetic and editorial context.  
**Destination:** either a real `kit-agent-taste` corpus with schema, or a `taste-context` collection inside `aiuiux-playbooks`.  
**Cleanup recommendation:** do not keep a shell indefinitely; require a schema and initial corpus before treating it as active.

### `ai-insights`

**Classification:** thin incubator review.  
**Next action:** inspect all files and compare against `aiuiux-playbooks`, `daily-dose-agent`, and `lupo-ai-os`. Preserve unique prompts or models, then recommend consolidation if no runnable boundary exists.  
**Proposed future name if retained:** `lab-ai-insights`.

### `social-post`

**Classification:** empty cleanup candidate.  
**Next action:** confirm branches, history, deployment hooks, and integrations. If all are empty, present a user-approved archive or deletion recommendation. No salvage is currently indicated.

Detailed provenance: `docs/repo-salvage/2026-08-02-os-and-incubator-overlap.md`

## Next priority order

1. Perform the file-level `ai-os` → `lupo-ai-os` comparison and preserve non-duplicative operating architecture.
2. Inspect `ai-insights` and branch history for `social-post`.
3. Extract the `visualize-workflow` component with provenance.
4. Compare `nightowl-prompts` taxonomy against `aiuiux-playbooks` schemas.
5. Begin the Plants project-family comparison.

## Proposed rename queue

| Current | Proposed | Reason |
|---|---|---|
| `untitled-ui` | `lupos-ui` or `kit-lupos-ui` | Replace temporary naming with owned design-system identity |
| `checklists-and-prompts` | `kit-uiux-prompts` | Clarify reusable reference purpose if retained |
| `daily-dose-agent` | `agent-daily-dose` | Align with purpose-based naming |
| `code-autopsy` | `app-code-autopsy` | Clarify that it is a runnable product |
| `design-system-hub-ui` | `lab-design-system-workbench` | Mark as experimental source material if retained |
| `nightowl-prompts` | `app-nightowl-prompts` | Clarify product type if retained independently |
| `prompts-071525` | `lab-elite-prompts` | Remove date and identify the actual experiment |
| `design-intelligence` | `lab-design-intelligence` | Mark the AI Studio project as experimental |
| `visualize-workflow` | `lab-workflow-visualizer` | Describe its strongest reusable function |
| `taste` | `kit-agent-taste` | Clarify reusable agent-context purpose if implemented |
| `ai-insights` | `lab-ai-insights` | Mark as experimental until a product boundary exists |

## Decision gate

A repository is ready for a user decision only after:

- unique assets and code have been inspected
- reusable material has been copied or intentionally left in place
- provenance has been documented
- dependencies and deployment links have been checked
- a recommended destination and name have been recorded

No repository is renamed, archived, or removed by this workflow.