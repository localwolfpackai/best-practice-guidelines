# Agent and Workflow Salvage Findings — 2026-07-31

This record preserves reusable material discovered during the repository consolidation pass.

## `claude-config`

**Classification:** CORE SUPPORT / KEEP

**Purpose:** Versioned source of truth for Claude Code behavior, rules, skills, hooks, scripts, and continuity documentation.

**Why it stays separate:** It is live machine-adjacent configuration, not a general prompt library. Folding it into `lupo-ai-os` would blur the boundary between portable operating knowledge and deployed Claude configuration.

**Reusable pattern:** Explicit allowlist backups instead of `git add -A`, with runtime state and secrets excluded.

**Source:** `localwolfpackai/claude-config/README.md`

## `daily-dose-agent`

**Classification:** ACTIVE PRODUCT / KEEP

**Purpose:** Newsletter ingestion and synthesis pipeline that generates a branded HTML digest.

**Reusable patterns:**

- Content pipeline: ingest → clean → synthesize → structured sections → HTML output
- Explicit editorial schema: lead story, signals, prompt, tools, workflow, resources, closing thought
- Brand constants separated from synthesis behavior
- Responsive, dependency-light email template

**Potential destination for extracted pattern:** `lupo-ai-os/workflows/content-synthesis/`

**Source:** `localwolfpackai/daily-dose-agent/README.md`

## `code-autopsy`

**Classification:** ACTIVE PRODUCT / KEEP; WORKFLOW SALVAGE COMPLETE

**Purpose:** AI-assisted technical review and showcase generator for uploaded source files.

**High-value reusable workflow:**

1. Require claims to cite concrete filenames.
2. Separate project intent, technical complexity, human intervention, AI assistance, implementation struggle, and verdict.
3. Use a strict structured-output schema instead of free-form prose.
4. Truncate each input file to a bounded size before model submission.
5. Generate visual direction from the technical findings as a separate output field.

**Reusable audit schema:**

- `brief.target`
- `brief.technicalComplexity`
- `brief.timeline`
- `implementation.humanIntervention`
- `implementation.aiAssistance`
- `implementation.workflow[]`
- `risks.narrative`
- `risks.culprits[]`
- `verdict.rating`
- `verdict.honestTake`
- `visualPrompt`

**Source:** `localwolfpackai/code-autopsy/services/geminiService.ts`

**Original implementation notes:** Gemini structured JSON response, per-file input cap, filename-grounded evidence, optional generated hero image.

## `checklists-and-prompts`

**Classification:** CONSOLIDATE CANDIDATE

**Purpose:** Browsable UI/UX prompt application with categories, search, copy actions, difficulty, and time estimates.

**Overlap:** Its content model and browsing experience overlap strongly with `aiuiux-playbooks`.

**Preserve before lifecycle decision:**

- Any prompts not already present in `aiuiux-playbooks`
- Difficulty and estimated-time metadata
- Plain-English explanations for non-developers
- One-click copy and category browsing UX patterns

**Recommended destination:** Content into `aiuiux-playbooks`; generic catalog UI patterns into `untitled-ui` only if they improve the existing playground.

**Source:** `localwolfpackai/checklists-and-prompts/README.md`

## Decisions from this pass

| Repository | Decision | Salvage status |
|---|---|---|
| `claude-config` | Keep separate and active | Boundary documented |
| `daily-dose-agent` | Keep as product | Workflow extraction queued |
| `code-autopsy` | Keep as product | Audit schema preserved here |
| `checklists-and-prompts` | Consolidate candidate | Content comparison required |

No repository was renamed, archived, or deleted.