# Margie Repository Family Review

Date: 2026-08-05

## Scope

Reviewed the four repositories that currently overlap around Margie Lupo Real Estate:

- `margielupo-com`
- `margielupo-docs`
- `margie-social-studio`
- `margielupo-1` (archived)

No repositories were renamed, archived, deleted, or modified during this review.

## Recommended operating model

| Repository | Role | Recommendation |
|---|---|---|
| `margielupo-com` | Production website | Keep as the only deployable public-site source of truth |
| `margielupo-docs` | Client workspace, strategy, SEO, brand knowledge, deliverables | Keep separate; treat as the operational authority hub |
| `margie-social-studio` | Social-content product prototype | Keep isolated from production; salvage its content pipeline, scheduler, preview, and analytics patterns into a future Margie OS application |
| `margielupo-1` | Archived Lovable/Vite predecessor | Preserve history; review only for unique AI chat, valuation, market dashboard, neighborhood explorer, and knowledge-base assets before recommending continued archive status |

## Why this split is safer

The live site already has a clear Next.js + MDX publishing boundary. The docs workspace already identifies itself as the strategy and authority hub. Combining either with the social prototype would increase deployment risk and blur ownership.

A future `margie-os` application should therefore be a fifth, independent repository rather than a rewrite of the production website. It can read or sync content later, but it should not become a production dependency during the MVP.

## Reusable material to preserve

### From `margie-social-studio`

Source: `README.md`

- multi-platform content generation model
- content library lifecycle
- scheduler and calendar interface
- platform-specific previews
- analytics dashboard patterns
- saved-content, scheduling, analytics, and theme hooks
- Brentwood-specific market data utilities

Recommended destination: future `margie-os`, with generic UI primitives sourced from `untitled-ui` where practical.

### From `margielupo-1`

Source: `README.md`

- AI chat assistant concept and real-estate knowledge-base framing
- home valuation flow
- market pulse dashboard
- neighborhood explorer
- featured-listing presentation
- Supabase integration patterns, only if still relevant and secure

Recommended destination: preserve as research references first. Do not copy production claims, credentials, or obsolete Lovable synchronization assumptions.

### From `margielupo-com`

Source: `README.md`

- MDX blog publishing model in `content/blog/`
- `npm run new-post` scaffolding workflow
- metadata, sitemap, robots, and shared asset structure
- existing production design primitives

Recommended destination: remain in place. Margie OS should integrate with this workflow later through a controlled export or pull-request process.

### From `margielupo-docs`

Source: `README.md`

- canonical brand and voice knowledge base
- social-channel authority record
- design-token documentation
- project map and backup policy
- separation of deployable site, strategy documents, deliverables, large media, archive, and inbox

Recommended destination: remain authoritative. Margie OS may surface selected structured views, but should not silently duplicate or replace this knowledge base.

## Proposed naming and cleanup decisions

| Current repository | Proposed action | Reason |
|---|---|---|
| `margielupo-com` | Keep name for now | It is already tied to the live production site |
| `margielupo-docs` | Optional future rename to `margie-workspace` | Current name understates its authority-hub role; rename only after checking local paths and automation references |
| `margie-social-studio` | Keep until salvage is complete; later consider `lab-margie-social-studio` | It is a useful prototype, but not the production social system |
| `margielupo-1` | Keep archived; no rename needed | Historical predecessor; preserve commit history and Lovable provenance |
| future `margie-os` | Create as an independent product | Prevents interference with the live website and creates a reusable showcase platform |

## Immediate next build target

Create a new independent `margie-os` repository with mocked data only. First milestone:

1. dashboard
2. content pipeline / kanban
3. article detail view
4. media status
5. visible separation between drafts, review, ready, and published

Explicitly exclude live publishing, Google Drive writes, production website changes, authentication, and AI generation from the first milestone.

## Decision gates before any lifecycle action

- inspect non-default branches
- verify Lovable, Vercel, and other deployment links
- identify unique files beyond README descriptions
- record file-level provenance for anything copied
- confirm no local scripts or shared folders depend on repository names
- obtain user approval before rename, archive, or deletion
