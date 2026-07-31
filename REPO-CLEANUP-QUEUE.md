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

## Batch 02: design knowledge overlap

### `aiuiux-playbooks`

**Classification:** active, retain independently  
**Direction:** destination for normalized design knowledge, prompt kits, findings schemas, and QA checklists.

### `vivid-uiux-prompt-library`

**Classification:** salvage  
**Destination:** `aiuiux-playbooks` for design prompts; `lupo-ai-os` for general operating prompts.

### `design-intelligence`

**Classification:** overlap review  
**Next action:** compare research and scoring logic with the playbooks data model.

## Batch 03: agent and workflow overlap

### Completed review

| Repository | Classification | Result |
|---|---|---|
| `claude-config` | `CORE SUPPORT` | Keep separate; boundary and backup policy documented |
| `daily-dose-agent` | `ACTIVE PRODUCT` | Keep; newsletter synthesis workflow queued for extraction |
| `code-autopsy` | `ACTIVE PRODUCT` | Keep; structured filename-grounded audit schema preserved in `lupo-ai-os` |
| `checklists-and-prompts` | `CONSOLIDATE CANDIDATE` | Compare prompts and metadata against `aiuiux-playbooks` before retirement decision |

Detailed provenance: `docs/repo-salvage/2026-07-31-agent-workflow-findings.md`

### `checklists-and-prompts` decision gate

Preserve before recommending archive or deletion:

1. Prompts not already represented in `aiuiux-playbooks`.
2. Difficulty and estimated-time metadata.
3. Plain-English explanations aimed at non-developers.
4. Any useful catalog browsing and copy interaction patterns.

**Proposed future name if retained:** `kit-uiux-prompts`

### `daily-dose-agent` extraction target

Create a provider-neutral workflow reference covering:

- newsletter ingestion and cleanup
- signal ranking and synthesis
- structured editorial sections
- brand constants separated from generation logic
- responsive HTML output and source attribution

**Possible future name:** `agent-daily-dose`

### `code-autopsy` status

No consolidation recommended. It has a clear product boundary, tested UI, structured AI output, and a distinct showcase format.

**Possible clearer name:** `app-code-autopsy`

### Remaining priority order

1. `nightowl-prompts`
2. `prompts-071525`
3. `visualize-workflow`
4. `design-intelligence`
5. `vivid-uiux-prompt-library`

## Proposed repository labels

GitHub repository topics should use a small controlled vocabulary:

- Lifecycle: `active`, `incubating`, `reference`, `client`, `legacy`
- Domain: `design-system`, `ai-agent`, `automation`, `content`, `portfolio`, `plants`, `client-work`
- Stack: `nextjs`, `react`, `vite`, `tailwind`, `typescript`, `python`, `swiftui`
- Brand: `lupo-studios`, `humanlup`, `lupos`

Recommended README badges:

- lifecycle status
- primary stack
- build or verification status
- destination or superseded-by link where applicable

## Proposed rename queue

| Current | Proposed | Reason |
|---|---|---|
| `untitled-ui` | `lupos-ui` or `kit-lupos-ui` | Replace temporary naming with owned design-system identity |
| `checklists-and-prompts` | `kit-uiux-prompts` | Clarify reusable reference purpose if retained |
| `daily-dose-agent` | `agent-daily-dose` | Align with purpose-based naming |
| `code-autopsy` | `app-code-autopsy` | Clarify that it is a runnable product |
| `design-system-hub-ui` | `lab-design-system-workbench` | Mark as experimental source material if retained |

## Decision gate

A repository is ready for a user decision only after:

- unique assets and code have been inspected
- reusable material has been copied or intentionally left in place
- provenance has been documented
- dependencies and deployment links have been checked
- a recommended destination and name have been recorded

No repository is renamed, archived, or removed by this workflow.