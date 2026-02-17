# CSS Design Tokens

> A reference stylesheet defining design tokens and base styles through CSS custom properties — covering typography, color, spacing, layout, forms, and component primitives.

---

## Font Loading

Load fonts in the document `<head>` with `<link>` tags for best performance. The `@import` below works as a single-file fallback but is slower.

```css
@import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&family=Sora:wght@300;400;500;700&display=swap");
```

## Design Tokens

All values defined as custom properties on `:root` for global access and easy theming.

### Typography

```css
:root {
  --font-body: "Inter", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
  --font-heading: "Sora", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
  --font-utility: "Inter", system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
  --font-mono: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;

  --fs-body: 1rem;
  --fs-body-lg: 1.125rem;
  --fs-body-sm: 0.875rem;
  --fs-caption: 0.75rem;

  --lh-body: 1.4;

  --ls-1: -0.18px;
  --ls-2: 0.32px;
  --ls-3: -0.66px;
  --ls-5: 0.6px;
}
```

### Neutrals

```css
:root {
  --c-white: #ffffff;
  --c-black: #000000;

  --c-carbon: #0f0f0f;
  --c-text: #333333;
  --c-text-muted: #222222;

  --c-n900: #4c4c4c;
  --c-n800: #606060;
  --c-n700: #757575;
  --c-n600: #898989;
  --c-n500: #9d9d9d;
  --c-n400: #b2b2b2;
  --c-n300: #c6c6c6;
  --c-n200: #dbdbdb;
  --c-n100: #efefef;

  --c-border: #cccccc;
  --c-border-soft: #e2e2e2;

  --c-surface: #ffffff;
  --c-surface-muted: #f3f3f3;
  --c-surface-soft: #fafafa;
  --c-surface-disabled: #eeeeee;
  --c-surface-panel: #dddddd;
  --c-surface-panel-2: #c8c8c8;
}
```

### Accent and Status Colors

```css
:root {
  --c-accent: #3898ec;
  --c-link-current: #0082f3;
  --c-electric-blue: #0c76fe;

  --c-hypercitrus: #dcf58f;
  --c-laser-pink: #e37de1;
  --c-soft-sand: #e3cfa9;
  --c-midnight-blue: #24246e;
  --c-pomegranate: #65211a;

  --c-success: #4caf50;
  --c-warning: #f59e0b;
  --c-error: #d84036;
  --c-error-soft: #ffdede;
  --c-error-strong: #ea384c;
}
```

### Transparency, Shadows, and Radii

```css
:root {
  --c-transparent: transparent;
  --c-overlay-dark: #000000e6;
  --c-overlay-carbon: #0f0f0fb3;

  --shadow-badge: 0 0 0 1px #0000001a, 0 1px 3px #0000001a;
  --shadow-focus: 0 0 3px 1px var(--c-accent);

  --r-xs: 0.125rem;
  --r-sm: 0.25rem;
  --r-md: 0.5rem;
  --r-lg: 1rem;
  --r-full: 9999px;
}
```

## Base Styles

Reset and normalize defaults, then apply design tokens.

```css
html {
  height: 100%;
  -webkit-text-size-adjust: 100%;
  font-family: sans-serif;
}

body {
  min-height: 100%;
  margin: 0;
  font-family: var(--font-body);
  font-size: var(--fs-body);
  line-height: var(--lh-body);
  color: var(--c-carbon);
  background-color: var(--c-surface);
}

* { box-sizing: border-box; }

a { background-color: var(--c-transparent); }
a:active, a:hover { outline: 0; }

img {
  border: 0;
  max-width: 100%;
  display: inline-block;
  vertical-align: middle;
}
```

## Typography

```css
h1, h2, h3, h4, h5, h6 {
  font-family: var(--font-heading);
  font-weight: 700;
  margin-bottom: 10px;
}

h1 { margin-top: 20px; font-size: 38px; line-height: 44px; }
h2 { margin-top: 20px; font-size: 32px; line-height: 36px; }
h3 { margin-top: 20px; font-size: 24px; line-height: 30px; }
h4 { margin-top: 10px; font-size: 18px; line-height: 24px; }
h5 { margin-top: 10px; font-size: 14px; line-height: 20px; }
h6 { margin-top: 10px; font-size: 12px; line-height: 18px; }

p { margin: 0 0 10px; }

blockquote {
  margin: 0 0 10px;
  padding: 10px 20px;
  border-left: 5px solid var(--c-border-soft);
  font-size: 18px;
  line-height: 22px;
}

ul, ol { margin: 0 0 10px; padding-left: 40px; }
```

## Buttons and Forms

```css
button, input, optgroup, select, textarea {
  color: inherit;
  font: inherit;
  margin: 0;
}

.button {
  display: inline-block;
  padding: 9px 15px;
  text-decoration: none;
  border: 0;
  border-radius: 0;
  cursor: pointer;
  line-height: inherit;
  color: var(--c-white);
  background-color: var(--c-accent);
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: 700;
}

.input, .select {
  display: block;
  width: 100%;
  height: 38px;
  margin-bottom: 10px;
  padding: 8px 12px;
  color: var(--c-text);
  background-color: var(--c-surface);
  border: 1px solid var(--c-border);
  font-size: 14px;
  line-height: 1.42857;
}

.input:focus, .select:focus {
  outline: 0;
  border-color: var(--c-accent);
}

.input[disabled], .select[disabled] {
  cursor: not-allowed;
  background-color: var(--c-surface-disabled);
}
```

## Layout

A simple 12-column grid system with responsive breakpoints.

```css
.container {
  max-width: 940px;
  margin-left: auto;
  margin-right: auto;
}

.col {
  float: left;
  width: 100%;
  min-height: 1px;
  padding-left: 10px;
  padding-right: 10px;
  position: relative;
}

.col-1  { width: 8.33333%; }
.col-2  { width: 16.6667%; }
.col-3  { width: 25%; }
.col-4  { width: 33.3333%; }
.col-6  { width: 50%; }
.col-8  { width: 66.6667%; }
.col-12 { width: 100%; }

@media screen and (max-width: 991px) {
  .container { max-width: 728px; }
}

@media screen and (max-width: 767px) {
  .col { width: 100%; left: auto; right: auto; }
}

@media screen and (max-width: 479px) {
  .container { max-width: none; }
}
```

## Component Primitives

Base styles for common interactive components: sliders, dropdowns, navigation, tabs, and lightboxes.

```css
/* Navigation */
.nav {
  background: var(--c-surface-panel);
  position: relative;
  z-index: 1000;
}

.nav-link {
  color: var(--c-text-muted);
  text-decoration: none;
  display: inline-block;
  padding: 20px;
}

/* Tabs */
.tab-link {
  cursor: pointer;
  color: var(--c-text-muted);
  background-color: var(--c-surface-panel);
  padding: 9px 30px;
  text-decoration: none;
  display: inline-block;
}

.tab-link.-current {
  background-color: var(--c-surface-panel-2);
}

/* Lightbox */
.lightbox-backdrop {
  background: var(--c-overlay-dark);
  color: var(--c-white);
}
```

---

*Related: [Tailwind CSS](tailwind.md) | [Creative Standards](creative-standards.md)*
