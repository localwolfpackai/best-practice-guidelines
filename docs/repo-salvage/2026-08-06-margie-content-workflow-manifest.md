# Margie Content Workflow Salvage Manifest

Date: 2026-08-06

## Decision

Keep the production website (`margielupo-com`) and strategy authority hub (`margielupo-docs`) isolated. Treat `margie-social-studio` and archived `margielupo-1` as source material for a future independent `margie-os`, not as foundations to merge wholesale.

No repository was renamed, archived, deleted, or modified during this review.

## Source boundaries

| Repository | Current role | Salvage posture |
|---|---|---|
| `margielupo-com` | Production website | Do not modify during OS prototyping |
| `margielupo-docs` | Strategy, SEO, brand, and deliverables authority | Reference, do not duplicate |
| `margie-social-studio` | Working social-content prototype | Salvage workflow models and selected interaction patterns |
| `margielupo-1` | Archived public-site predecessor | Salvage only unique product concepts and validated assets |
| future `margie-os` | Internal editorial operating system | Independent destination; mocked data first |

## Confirmed reusable source material

### 1. Scheduling domain model

**Source:** `margie-social-studio/src/hooks/useScheduledPosts.ts`

Preserve the domain concepts, not the implementation:

- scheduled content record with title, body, channel, scheduled timestamp, publication state, and creation timestamp
- create, update, remove, and upcoming-content queries
- chronological sorting of upcoming unpublished records

Do not copy directly without repair. The current hook uses browser `localStorage`, timestamp IDs, unguarded JSON parsing, and component-local state. For Margie OS, define a typed content entity with stable IDs, schema validation, explicit status values, and a repository interface that can begin with mocked data and later support Drive or a database.

### 2. Calendar review interaction

**Source:** `margie-social-studio/src/components/SchedulerCalendar.tsx`

Preserve:

- date selection with visible scheduled-content markers
- side-by-side date picker and selected-day queue on larger screens
- compact channel identity, scheduled time, excerpt, and removal action
- empty state for dates without scheduled content

Repair before reuse:

- decouple brand-specific colors from channel meaning
- replace deletion-first behavior with unschedule plus undo
- add keyboard and screen-reader descriptions for marked dates
- respect reduced motion
- avoid a fixed-height internal scroll area on small screens
- use a shared content entity rather than a social-only record

### 3. Editorial workflow modules

**Source:** `margie-social-studio/README.md` and documented source structure

Candidate modules for Margie OS:

- content library
- scheduler/calendar
- platform-specific previews
- analytics summary
- saved-content and scheduling hooks
- Brentwood market-data utilities
- content-generation form structure

These are product capabilities, not proof that the existing React 18 + shadcn implementation should become the new base. Margie OS should adopt the active design system deliberately and avoid copying a second primitive library into the product.

### 4. Archived product concepts

**Source:** `margielupo-1/README.md`

Concepts worth validating before final lifecycle decisions:

- AI-assisted real-estate knowledge interface
- home-valuation intake flow
- market-pulse dashboard
- neighborhood explorer
- listings and editorial integration
- structured local knowledge/data layer

These concepts belong in separate future modules or the public website, not the first Margie OS milestone. The archived repository's Vite, shadcn, Supabase, Lovable, and public-site architecture should not be merged wholesale.

## Proposed normalized content entity

```ts
export type ContentStatus =
  | "inbox"
  | "research"
  | "drafting"
  | "review"
  | "seo"
  | "images"
  | "ready"
  | "scheduled"
  | "published";

export type ContentChannel = "website" | "instagram" | "linkedin" | "email";

export interface EditorialItem {
  id: string;
  title: string;
  summary?: string;
  body?: string;
  status: ContentStatus;
  channels: ContentChannel[];
  author: "margie" | "anthony" | "ai-assisted";
  neighborhood?: string;
  tags: string[];
  sourceDocumentUrl?: string;
  heroAssetId?: string;
  scheduledFor?: string;
  publishedAt?: string;
  createdAt: string;
  updatedAt: string;
}
```

This model unifies articles and downstream social assets without forcing every item to be a social post.

## Recommended first Margie OS showcase

Build one visible workflow only:

1. dashboard summary
2. editorial kanban
3. article detail panel
4. calendar view derived from the same mocked content records
5. responsive desktop and mobile states

Explicitly exclude Google Drive, authentication, AI generation, live publishing, analytics integrations, and production-site changes from the first milestone.

## Provenance ledger

| Source repository | Original path | Destination | Preserve | Disposition |
|---|---|---|---|---|
| `margie-social-studio` | `src/hooks/useScheduledPosts.ts` | future `margie-os` domain layer | scheduling entity and upcoming query semantics | Reimplement safely |
| `margie-social-studio` | `src/components/SchedulerCalendar.tsx` | future `margie-os` calendar showcase | date markers, selected-day queue, channel/time summaries | Redesign using active UI system |
| `margie-social-studio` | `README.md` | this manifest and product roadmap | module inventory and technical context | Documentation preserved |
| `margielupo-1` | `README.md` | future module backlog | AI knowledge, valuation, market, and neighborhood concepts | Validate before any code salvage |

## Lifecycle position

- `margie-social-studio`: keep available until remaining library, preview, analytics, and Brentwood utility files are inspected and represented in a provenance ledger.
- `margielupo-1`: keep archived. Do not delete. Inspect unique assets and actual implementation paths before declaring it fully superseded.
- `margielupo-com`: production-safe, no salvage writes.
- `margielupo-docs`: authority-safe, no structural changes from this loop.

## Next targets

1. Inspect the content library and platform-preview implementation in `margie-social-studio`.
2. Locate actual component and data paths for the valuation, market pulse, neighborhood, and AI knowledge features in `margielupo-1`.
3. Check non-default branches and external deployment/integration links.
4. Create the independent `margie-os` repository only when the first milestone is ready to be scaffolded.