# Templating Standards

> Naming conventions, folder structures, versioning strategies, and document templates for consistent project organization.

---

## Naming Conventions

### Files

- Use descriptive, lowercase names with dashes (kebab-case): `user-profile.tsx`, `auth-context.ts`
- Include the type or purpose in the name: `api-helpers.ts` over `helpers.ts`, `auth-context.tsx` over `context.tsx`
- Prefix hooks with `use-`: `use-auth.ts`, `use-fetch.ts`
- Prefix test files to match their source: `user-profile.test.tsx`

### Folders

- Group by feature when possible: `features/auth/`, `features/dashboard/`
- Use numbered prefixes for sequential phases in non-code projects:
  ```text
  00-planning/
  01-research/
  02-design/
  03-development/
  04-testing/
  05-deliverables/
  ```

### Assets

- Format: `[category]-[subject]-[variant]-[size].[ext]`
- Examples: `hero-homepage-dark-1920.jpg`, `icon-check-green-24.svg`, `logo-brand-full.svg`
- Always include dimensions or size indicators for raster images

### Variables and Tokens

- CSS custom properties: `--[category]-[subcategory]-[property]`
  - `--color-primary-accent`, `--spacing-md`, `--font-heading`
- Tailwind config keys: semantic names over raw values
  - `brand`, `surface`, `muted` — not `blue-600`, `gray-50`

## Folder Structures

### Frontend Project

```text
project-root/
  src/
    assets/          # Images, fonts, icons
    components/      # Reusable UI components
    hooks/           # Custom React hooks
    pages/           # Page-level components
    styles/          # Global styles, tokens
    lib/             # Utilities and helpers
  public/            # Static assets
  tests/             # Test files
  docs/              # Project documentation
  scripts/           # Automation scripts
```

### Documentation Repository

```text
docs-root/
  README.md          # Entry point
  _templates/        # Master templates for new docs
  standards/         # Standards and guidelines
  guides/            # How-to guides
  architecture/      # System architecture docs
  assets/            # Images and diagrams for docs
```

### AI / Data Project

```text
project-root/
  data/              # Raw and processed datasets
  models/            # Trained models, checkpoints
  notebooks/         # Exploratory analysis
  src/               # Core application logic
  api/               # API endpoints
  config/            # Configuration files
  tests/             # Tests
  docs/              # Documentation
```

## Versioning

### Semantic Versioning

Use `MAJOR.MINOR.PATCH` for code and documents:

- `1.0.0` — initial release
- `1.1.0` — minor additions or revisions
- `2.0.0` — major overhaul, breaking changes
- Suffix with stage: `_Draft`, `_Review`, `_Final`

### Document Versioning

- Include version, date, and author in the document header
- Maintain a revision history table for significant documents:

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0.0 | 2024-01-15 | AL | Initial draft |
| 1.1.0 | 2024-02-01 | AL | Added security section |

### File Versioning

- For files outside version control, use suffixes: `_v1`, `_v1.1`, `_Final`
- For files in git, let commits handle versioning — no version numbers in filenames

## Document Templates

### Technical Specification

```markdown
# [Feature Name] — Technical Spec

**Version:** 1.0.0
**Author:** [Name]
**Date:** [Date]
**Status:** Draft | Review | Final

## Overview
What this feature does and why it matters.

## Requirements
- Functional requirements (what it does)
- Non-functional requirements (performance, security, a11y)

## Technical Approach
Architecture, data models, API endpoints, dependencies.

## Open Questions
Unresolved decisions or unknowns.

## Revision History
| Version | Date | Changes |
|---------|------|---------|
```

### Blog Post / Article

```markdown
# [Title]

**Author:** [Name]
**Date:** [Date]
**Tags:** [tag1], [tag2]

## Introduction
Hook the reader. State what they'll learn.

## [Main Sections]
Use H2/H3 for subheadings. Break text with bullets, code blocks, images.

## Conclusion
Summary and call to action.

## Further Reading
- [Link 1]
- [Link 2]
```

### Session Recap

```markdown
# Session Recap — [Date] — [Topic]

## Objective
What the session aimed to accomplish.

## Key Decisions
- Decision 1 and rationale
- Decision 2 and rationale

## Actions Taken
What was implemented, changed, or configured.

## Open Items
Unresolved questions or follow-ups for next session.
```

## General Principles

- **Consistency over cleverness** — pick a convention and follow it everywhere
- **Discoverability** — someone new to the project should find what they need in under 30 seconds
- **Scalability** — structures should work for 10 files or 1,000
- **Automation potential** — design naming and structure with scripting and tooling in mind
- **Version everything** — templates themselves should be versioned and updated as standards evolve

---

*Related: [Clean Code](clean-code.md) | [Gitflow](gitflow.md) | [Creative Standards](creative-standards.md)*
