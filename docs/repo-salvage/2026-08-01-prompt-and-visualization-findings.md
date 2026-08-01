# Prompt and Visualization Salvage Findings

Reviewed repositories: `nightowl-prompts`, `prompts-071525`, `vivid-uiux-prompt-library`, `design-intelligence`, and `visualize-workflow`.

## Summary

| Repository | Classification | Recommendation |
|---|---|---|
| `nightowl-prompts` | Consolidate candidate | Preserve its prompt-library information architecture and keyboard-first browsing patterns, then fold durable ideas into `aiuiux-playbooks` |
| `prompts-071525` | Retirement candidate after inspection | Appears to be a dated v0 synchronization shell for an ElitePrompts clone; preserve only unique prompt data or UI before recommending archive |
| `vivid-uiux-prompt-library` | Consolidate candidate | Extract prompt schema/generation logic and any useful analytics concepts into `aiuiux-playbooks`; do not preserve speculative social/gamification claims without working implementation |
| `design-intelligence` | Thin experiment | Treat as a Gemini AI Studio prototype until unique scoring, research, or synthesis logic is confirmed |
| `visualize-workflow` | Keep or extract | Preserve the SVG workflow visualization, flow-prediction interaction, demo-mode model, and animation treatment as a reusable component or standalone lab |

## Salvage targets

### From `nightowl-prompts`

Source evidence: `README.md` describes categories, tags, favorites, collections, search/filtering, a command palette, local persistence, responsive layouts, and semantic Tailwind tokens.

Preserve:

- prompt metadata model: category, tags, favorite state, and collection membership
- keyboard-first command palette and fast search interaction
- local-first persistence model for private prompt libraries
- information architecture for browsing a large prompt catalog

Destination:

- data/schema and prompt taxonomy → `aiuiux-playbooks`
- generic command-palette/catalog interaction patterns → `untitled-ui` only if not already represented

Do not preserve automatically:

- generic marketing copy
- placeholder contribution/contact sections
- duplicate primitives already present in `untitled-ui`

### From `prompts-071525`

Source evidence: `README.md` identifies it as a v0-synced ElitePrompts clone with a dated repository name and no durable project documentation beyond deployment linkage.

Preserve only after code inspection:

- unique prompt records
- unique catalog layout or filtering behavior
- any export/import format not represented elsewhere

Recommended lifecycle after preservation: archive candidate. Proposed descriptive name only if retained: `lab-elite-prompts`.

### From `vivid-uiux-prompt-library`

Source evidence: `README.md` claims a TypeScript prompt schema, prompt-generation utility, OpenAI/Gemini integrations, analytics, SQLite, and a React frontend.

Preserve after implementation verification:

- `src/schema.ts`
- `src/types.ts`
- `src/utils/generatePrompt.ts`
- useful prompt-quality or analytics data models
- non-duplicative setup documentation for non-developers

Destination: `aiuiux-playbooks` as normalized prompt-generation and evaluation modules.

Caution: the README contains broad product and “viral” claims. Treat those as unverified until code and tests confirm them.

### From `design-intelligence`

Source evidence: the README only documents running a Gemini AI Studio app and setting `GEMINI_API_KEY`.

Next inspection target:

- identify whether it contains unique design scoring, extraction, research, or recommendation logic
- if it is only a generated AI Studio shell, preserve prompts/configuration and recommend archive

Proposed name if meaningful logic exists: `lab-design-intelligence`.

### From `visualize-workflow`

Source evidence: `README.md` documents four interactive workflow modes, a core SVG visualization, animated particles, hover-triggered flow predictions, confidence scores, parallax, dark mode, and an 8-point spacing system.

Preserve:

- `src/components/AiToolsVisualizer.tsx`
- demo-mode data structure for AI Models, Language Models, Development, and Data Pipeline
- SVG path and animated-particle techniques
- flow-prediction overlay with confidence scoring
- reduced-motion and keyboard-accessibility improvements when extracted

Destinations:

- reusable visualization component and preview → `untitled-ui`
- workflow-model schema and explanatory documentation → `lupo-ai-os`

Recommended repository direction:

- retain independently as `lab-workflow-visualizer` if it remains a useful visual experiment, or
- archive only after the component and schema are copied with provenance.

## Provenance requirements

Every extracted item must record:

1. source repository
2. original file path
3. destination repository and path
4. whether it was copied, adapted, or rewritten
5. validation performed after extraction

No archive, rename, or deletion action is approved by this document.