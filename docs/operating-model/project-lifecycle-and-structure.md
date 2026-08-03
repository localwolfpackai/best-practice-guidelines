# Project Lifecycle and Structure

This operating pattern was salvaged and normalized from `localwolfpackai/ai-os`.

## Organize by function and state, not by tool

Use stable business and delivery functions so work does not fragment across whichever AI application created it.

| Zone | Purpose |
|---|---|
| Command center | Priorities, active-project index, dashboards, and decisions |
| Brand studio | Identity, visual language, sites, and design systems |
| Content engine | Posts, videos, showcases, and publishing-ready material |
| Products | Validated ventures and serious shipping work |
| Labs | Experiments, prototypes, and promising unfinished ideas |
| Agents | Prompts, workflows, agent configuration, and evaluations |
| Knowledge | Research, notes, transcripts, and references |
| Operations | Templates, scripts, GitHub playbooks, and automation glue |
| Assets | Shared images, video, generated media, and exports |
| Archive | Retired or inactive work preserved for reference |

## Lifecycle

1. Capture unvalidated work in Labs.
2. Move validated work into Products.
3. Feed launch material into the Content Engine.
4. Move reusable prompts and automation into Agents or Operations.
5. Preserve retired material in Archive rather than leaving it mixed with active work.

## Status vocabulary

- `idea`: valuable, but no committed build effort yet
- `active`: being worked on during the current week or month
- `shipping`: near release, in polish, or executing launch work
- `paused`: intentionally inactive but still valuable
- `archived`: retired and preserved only for reference

Decision rule: if the next meaningful move cannot be stated in one sentence, the project should not be marked `active`.

## Naming

Prefer lowercase, hyphenated, purpose-based names that remain legible in Finder, terminals, GitHub, and AI tools.

Use dated names only when timing is central to the work. Avoid vague labels such as `misc`, `new`, `random`, or version chains such as `final-final`.

Recommended repository prefixes when they add clarity:

- `site-` for websites
- `app-` for interactive products
- `kit-` for reusable libraries and templates
- `lab-` for experiments
- `agent-` for agent implementations

Track lifecycle state in a catalog or status file instead of repeatedly renaming folders.

## Project starter

Use this compact structure for work likely to become durable:

```text
project-name/
  README.md
  notes/
  design/
  app/
  content/
  assets/
  agent/
  ops/
```

- `notes`: problem, goals, roadmap, and positioning
- `design`: references, tokens, mockups, and UI decisions
- `app`: implementation
- `content`: launch copy, demos, posts, and scripts
- `assets`: project-specific media and exports
- `agent`: prompts, workflows, evaluations, and automation ideas
- `ops`: setup, deployment, scripts, and repository notes

Starter checklist:

1. Write a one-paragraph README.
2. Record one clear problem statement.
3. Establish visual direction before overbuilding.
4. Decide whether the work belongs in Products or Labs.
5. Add the project to the active-project index only when its next move is clear.

## Provenance

| Source repository | Original path | Preserved material |
|---|---|---|
| `localwolfpackai/ai-os` | `README.md` | Function-first workspace taxonomy and lifecycle flow |
| `localwolfpackai/ai-os` | `00-command-center/PROJECT_STATUS.md` | Shared project-state definitions and active-status decision rule |
| `localwolfpackai/ai-os` | `07-ops/NAMING_CONVENTIONS.md` | Cross-surface naming guidance |
| `localwolfpackai/ai-os` | `07-ops/repo-templates/project-starter/README.md` | Reusable project starter structure and checklist |

Preserved on 2026-08-03 before any recommendation to archive or rename the source repository.