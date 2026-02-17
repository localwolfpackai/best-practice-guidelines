# Creative Standards

> Semantic HTML, accessibility, performance, design tokens, and component patterns for building high-quality web interfaces.

---

## Core Principles

- **User-centric design** — every decision prioritizes the end-user experience across abilities and devices
- **Semantic integrity** — HTML conveys meaning, not just visual presentation
- **Accessibility first** — WCAG compliance is baseline, not an afterthought
- **Performance excellence** — fast loading, smooth interactions, efficient rendering
- **Maintainability** — clean, consistent code that scales with the project

## Semantic HTML

### Element Selection

- Use semantic HTML5 elements for their intended purpose: `<nav>`, `<main>`, `<article>`, `<section>`, `<figure>`, `<aside>`
- Reserve `<div>` and `<span>` for generic grouping or styling hooks — never as substitutes for semantic elements
- Use `<button>` for actions, `<a>` for navigation — never the reverse

```html
<!-- Avoid: generic divs for navigation -->
<div>
  <div>Home</div>
  <div>About</div>
</div>

<!-- Prefer: semantic nav with proper list structure -->
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>
```

### Document Outline

- One `<h1>` per page — it represents the page's primary topic
- Heading levels must be sequential: `h1` -> `h2` -> `h3` (never skip from `h1` to `h3`)
- Use headings to create a scannable outline, not for visual sizing — use CSS for that

### DOM Structure

- Minimize nesting depth — deeply nested elements are harder to maintain and slower to render
- Use CSS Grid and Flexbox to achieve layouts without wrapper divs
- Every `<img>` needs an `alt` attribute — descriptive for content images, empty (`alt=""`) for decorative ones

## Design Tokens

Use CSS custom properties to enforce visual consistency across a project.

### What to Tokenize

- **Colors:** brand, surface, text, border, status (success, warning, error)
- **Typography:** font families, size scale, line heights, letter spacing
- **Spacing:** a consistent scale (4px base: 4, 8, 12, 16, 24, 32, 48, 64)
- **Radii:** border-radius values (sm, md, lg, full)
- **Shadows:** elevation levels
- **Transitions:** duration and easing curves

```css
:root {
  --color-text: #0f0f0f;
  --color-surface: #ffffff;
  --color-accent: #2563eb;
  --color-error: #d84036;

  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;

  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 1rem;
}
```

### Rules

- Never use raw hex values in component styles — always reference a token
- Name tokens semantically (`--color-surface`) not by appearance (`--color-white`)
- Keep the token set small — a limited palette enforces consistency

## Accessibility

### Color Contrast

- All text must meet WCAG AA minimum: 4.5:1 for normal text, 3:1 for large text (18px+ bold or 24px+ regular)
- Test contrast with browser devtools or dedicated tools — don't eyeball it
- Never rely on color alone to convey meaning — pair with text labels, icons, or patterns

### Keyboard Navigation

- All interactive elements must be reachable and operable via keyboard
- Use visible `:focus-visible` styles — never remove focus outlines without a replacement
- Implement logical tab order — follows the visual reading flow
- Trap focus inside modals and dialogs; release on close

### ARIA

- Use ARIA attributes to fill semantic gaps — not to replace proper HTML
- Common patterns:
  - `aria-label` or `aria-labelledby` for elements without visible text labels
  - `aria-expanded` and `aria-controls` for disclosure widgets
  - `aria-live="polite"` for dynamic content updates (toast notifications, form validation)
  - `role="alert"` for error messages that need immediate attention
- Test with a screen reader (VoiceOver, NVDA) — ARIA that sounds wrong is worse than no ARIA

### Reduced Motion

- Respect `prefers-reduced-motion` — disable or simplify animations for users who request it

```css
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

## Performance

### Images

- Use modern formats: WebP or AVIF with fallbacks
- Implement responsive images with `srcset` and `sizes`
- Lazy load images below the fold: `loading="lazy"`
- Always include explicit `width` and `height` attributes to prevent layout shift

### Critical Rendering Path

- Inline critical CSS for above-the-fold content
- Defer non-critical JavaScript with `defer` or `async`
- Minimize render-blocking resources in the `<head>`
- Use `font-display: swap` to prevent invisible text during font loading

### Modern APIs

- Use Intersection Observer for scroll-triggered behaviors instead of scroll event listeners
- Use View Transitions API for smooth page transitions
- Use `requestAnimationFrame` for visual updates, not `setTimeout`

## Component Patterns

### Modals and Dialogs

- Use the native `<dialog>` element when browser support allows
- Trap focus inside the modal while open
- Close on Escape key press
- Return focus to the trigger element on close
- Add `aria-modal="true"` and a descriptive `aria-label`

### Responsive Layouts

- Design mobile-first, then enhance for larger breakpoints
- Use CSS Grid for page-level layout, Flexbox for component-level alignment
- Avoid fixed widths — use `max-width`, `min-width`, and relative units
- Test at real device widths: 320px, 375px, 768px, 1024px, 1440px

### Animation

- Animate `transform` and `opacity` only — they don't trigger layout recalculation
- Keep durations short: 150-300ms for micro-interactions, 300-500ms for transitions
- Use consistent easing: `ease-out` for entrances, `ease-in` for exits
- Always support `prefers-reduced-motion`

## Quick-Reference Checklist

- [ ] Semantic HTML tags used correctly (`nav`, `main`, `article`, `section`)
- [ ] Single `h1` per page, sequential heading levels
- [ ] CSS custom properties for all colors, spacing, and typography
- [ ] Color contrast meets WCAG AA (4.5:1 normal text, 3:1 large text)
- [ ] `alt` text on all content images
- [ ] All interactive elements keyboard accessible with visible focus styles
- [ ] ARIA attributes used correctly where semantic HTML is insufficient
- [ ] `prefers-reduced-motion` respected
- [ ] Images optimized and lazy loaded below the fold
- [ ] No render-blocking resources in the critical path
- [ ] Modals trap focus and close on Escape
- [ ] Responsive layout tested at mobile, tablet, and desktop widths

---

*Related: [CSS Design Tokens](css-design-tokens.md) | [Tailwind CSS](tailwind.md) | [Next.js](nextjs.md) | [Clean Code](clean-code.md)*
