# Tailwind CSS

> Utility-first styling patterns, responsive design, component conventions, and performance for Tailwind CSS projects.

---

## Project Setup

- Extend the default theme in `tailwind.config.ts` rather than overriding it
- Configure `content` paths to match your file structure for proper tree-shaking
- Define custom spacing, breakpoints, and colors in the `extend` block
- Use the Tailwind CSS IntelliSense VS Code extension for autocomplete

```typescript
// tailwind.config.ts
export default {
  content: ['./src/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {
      colors: {
        brand: {
          DEFAULT: '#2563eb',
          dark: '#1d4ed8',
        },
      },
      fontFamily: {
        heading: ['Poppins', 'system-ui', 'sans-serif'],
        body: ['Merriweather', 'Georgia', 'serif'],
      },
    },
  },
};
```

## Component Styling

- Use utility classes directly in markup — avoid premature `@apply` extraction
- Extract to `@apply` only when a pattern repeats across 3+ files and can't be a component
- Group utilities in a consistent order: layout, spacing, sizing, typography, color, effects
- Use `clsx` or `cn()` for conditional class composition:

```tsx
import { clsx } from 'clsx';

<button className={clsx(
  'px-4 py-2 rounded-md font-medium transition-colors',
  variant === 'primary' && 'bg-blue-600 text-white hover:bg-blue-700',
  variant === 'ghost' && 'bg-transparent text-gray-700 hover:bg-gray-100',
  disabled && 'opacity-50 cursor-not-allowed'
)} />
```

## Layout

- Use `flex` for one-dimensional layouts, `grid` for two-dimensional
- Use `gap-*` instead of margin hacks for spacing between children
- Use `container` with `mx-auto` for centered max-width layouts
- Use `max-w-prose` for readable text column widths (~65 characters)

```html
<!-- Responsive grid: 1 col mobile, 2 col tablet, 3 col desktop -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  ...
</div>
```

## Typography

- Define a type scale in the config rather than using arbitrary values
- Use `text-balance` on headings for better line wrapping
- Use `leading-relaxed` or `leading-loose` for body text readability
- Apply `tracking-tight` on large headings, `tracking-wide` on small labels

## Colors

- Use semantic color names in the config (`brand`, `surface`, `muted`) not raw hex in markup
- Maintain AA contrast ratios minimum — test with browser devtools or contrast checkers
- Use opacity modifiers for subtle variations: `bg-black/5`, `text-white/80`
- Define status colors explicitly: `success`, `warning`, `error`

## Components

- Use [shadcn/ui](https://ui.shadcn.com/) or [Radix](https://www.radix-ui.com/) for accessible primitives
- Keep component variants consistent — use a variants object or CVA (Class Variance Authority)
- Add `transition-colors` or `transition-all` to interactive elements for smooth state changes
- Always include `focus-visible:ring-2 focus-visible:ring-offset-2` on interactive elements

## Responsive Design

- Design mobile-first — write base styles for mobile, add breakpoint modifiers for larger screens
- Standard breakpoints: `sm` (640px), `md` (768px), `lg` (1024px), `xl` (1280px)
- Test at actual device widths, not just breakpoint boundaries
- Use `container queries` (`@container`) for component-level responsiveness when available

```html
<!-- Mobile: stack, Tablet+: side by side -->
<div class="flex flex-col md:flex-row md:items-center gap-4">
  <div class="flex-1">Content</div>
  <div class="w-full md:w-64">Sidebar</div>
</div>
```

## Dark Mode

- Use the `dark:` variant with `class` strategy for user-controlled theming
- Define both light and dark values for all semantic colors in the config
- Test contrast ratios in both modes
- Use `prefers-color-scheme` media query as the default, class toggle as override

## Performance

- Tailwind purges unused styles in production automatically — keep `content` paths accurate
- Avoid custom CSS files that duplicate what utilities already provide
- Use `@layer` directives if adding custom CSS to control specificity
- Monitor production bundle size — a well-configured Tailwind build is typically under 10KB gzipped

## Accessibility

- Never rely on color alone to convey meaning — add text labels or icons
- Use `sr-only` for screen-reader-only text
- Add `focus-visible` styles to all interactive elements
- Use semantic HTML elements (`button`, `a`, `nav`) — Tailwind styles the visuals, not the semantics

---

*Related: [CSS Design Tokens](css-design-tokens.md) | [Next.js](nextjs.md) | [Creative Standards](creative-standards.md)*
