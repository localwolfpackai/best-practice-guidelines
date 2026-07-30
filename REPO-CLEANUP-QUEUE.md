# Repository Salvage and Cleanup Queue

This queue converts repository sprawl into a controlled sequence of review, salvage, consolidation, and user-approved lifecycle decisions.

## Batch 01: component and design-system overlap

### `design-system-hub-ui`

**Classification:** salvage, then lifecycle review  
**Why it matters:** The application already models a design-system workspace with a sidebar, main content area, resizable bottom panel, and dedicated sections for buttons, colors, typography, iconography, and writing style.

**Provenance reviewed:**

- `src/App.tsx`
- `README.md`
- `package.json`

**High-value material:**

- Catalog navigation model
- Foundations sections for colors, typography, and iconography
- Writing-style documentation as a first-class design-system section
- Resizable inspection panel concept

**Destination:** `untitled-ui`

**Recommended implementation:** Rebuild the concepts using the existing React Aria and Tailwind 4 architecture rather than copying the Radix-heavy implementation directly.

**Proposed future name if retained:** `lab-design-system-workbench`

### `nextui-component-library`

**Classification:** thin generated shell under review  
**Why it matters:** The README identifies it as an automatically synchronized v0/Vercel project, but the inspected root did not expose a normal package manifest.

**Provenance reviewed:**

- `README.md`
- root `package.json` lookup

**Current finding:** No reusable component implementation has been confirmed yet.

**Next action:** Inspect repository tree and deployment linkage. If it contains no unique work, present it for user-approved retirement.

**Proposed future name if retained:** `lab-v0-component-sync`

### `untitled-ui`

**Classification:** core destination  
**Direction:** Continue as the main component library. Add a visual catalog that incorporates the strongest workspace concepts from `design-system-hub-ui`.

**Recommended next build:**

1. Category navigation for foundations, base components, application components, and marketing sections.
2. Responsive desktop/mobile preview controls.
3. Component maturity, accessibility, and documentation status.
4. A design-language section for writing style and voice.

## Batch 02: design knowledge overlap

### `aiuiux-playbooks`

**Classification:** active, retain independently  
**High-value material confirmed:** structured findings schema, controlled vocabulary, prompt kits, export utilities, multi-filter search, QA checklists, tests, and CI.

**Issue found:** README clone instructions reference `aiuiuxplaybooks-09-21` rather than the current repository name.

**Next action:** Correct stale setup instructions and use this repository as the destination for normalized design knowledge.

### `vivid-uiux-prompt-library`

**Classification:** salvage  
**Destination:** `aiuiux-playbooks` for design-specific prompt kits; `lupo-ai-os` for general agent operating prompts.

### `design-intelligence`

**Classification:** overlap review  
**Next action:** Compare its unique research or scoring logic against the playbooks data model before consolidation.

## Batch 03: agent and workflow overlap

Priority review order:

1. `claude-config`
2. `checklists-and-prompts`
3. `daily-dose-agent`
4. `code-autopsy`
5. `nightowl-prompts`
6. `prompts-071525`
7. `visualize-workflow`

**Destination rule:**

- Reusable rules, hooks, subagents, and operating instructions go to `lupo-ai-os`.
- Product-specific runtime code remains in its product repository.
- Every copied item receives a provenance note.

## Proposed repository labels

GitHub repository topics should use a small controlled vocabulary:

- Lifecycle: `active`, `incubating`, `reference`, `client`, `legacy`
- Domain: `design-system`, `ai-agent`, `automation`, `content`, `portfolio`, `plants`, `client-work`
- Stack: `nextjs`, `react`, `vite`, `tailwind`, `typescript`, `swiftui`
- Brand: `lupo-studios`, `humanlup`, `lupos`

Recommended README badges:

- lifecycle status
- primary stack
- build or verification status
- destination or superseded-by link where applicable

## Decision gate

A repository is ready for a user decision only after:

- unique assets and code have been inspected
- reusable material has been copied or intentionally left in place
- provenance has been documented
- dependencies and deployment links have been checked
- a recommended destination and name have been recorded

No repository is renamed, archived, or removed by this workflow.