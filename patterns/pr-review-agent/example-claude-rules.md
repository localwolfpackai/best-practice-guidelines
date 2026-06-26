# Project Rules

> This file is read by the PR review agent as the review rubric.
> Be specific. Be opinionated. Vague rules produce vague reviews.

## Stack

- TypeScript + React + Next.js (App Router)
- Tailwind CSS v4 (CSS-first, no config file)
- shadcn/ui components, Lucide icons
- Zod for runtime validation
- Vitest for tests

## Code Style

- No `any` in TypeScript — use `unknown` and narrow
- No unannotated return types on exported functions
- One component per file, max 300 lines
- Server Components by default — only `"use client"` when needed for interactivity
- `cn()` for conditional classnames, never string concatenation

## Naming

- kebab-case filenames (`my-component.tsx`, not `MyComponent.tsx`)
- PascalCase exports
- Test files mirror source: `button.tsx` → `button.test.tsx`

## What to flag

- **Security**: any unsanitized HTML, SQL string concatenation, exposed secrets, shell injection
- **Bugs**: logic errors, off-by-one, race conditions, unhandled rejected promises
- **Performance**: N+1 queries, fetching in client components when server can do it, missing memoization on expensive renders
- **Accessibility**: missing alt text, missing aria labels, keyboard trap, color contrast under WCAG AA
- **Rule violations** of anything in this file

## What NOT to flag

- Style preferences ("I'd phrase this differently")
- Minor wording in error messages
- Formatting (Prettier handles it)
- Missing tests on trivial render-only components
- Missing comments unless the code is genuinely opaque
- Anything CI already catches (TypeScript errors, lint, type checks)

## Tone

- Be specific. Include line numbers and a suggested fix.
- Be honest. If the PR looks good, say "No issues found" — don't invent things.
- No emojis. No "great work!" preamble. Get to the issue.

---

Edit this file to match your project. The more concrete the rules, the better the reviews.
