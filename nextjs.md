# Next.js

> App Router patterns, server components, data fetching, performance, and production best practices for Next.js applications.

---

## Project Structure

- Use the App Router (`app/`) directory structure
- Place route-specific components alongside their route in `app/`
- Place shared components in `components/`
- Place utilities, helpers, and lib code in `lib/`
- Use lowercase with dashes for directories: `components/auth-wizard`

```text
app/
  layout.tsx          # Root layout
  page.tsx            # Home page
  (auth)/
    login/page.tsx
    register/page.tsx
  dashboard/
    layout.tsx        # Dashboard-specific layout
    page.tsx
components/
  ui/                 # Shared UI primitives
  forms/              # Form components
lib/
  db.ts               # Database client
  auth.ts             # Auth utilities
  utils.ts            # General helpers
```

## Server vs Client Components

- Use Server Components by default — they reduce client bundle size and can fetch data directly
- Mark client components explicitly with `'use client'` at the top of the file
- Keep `'use client'` boundaries as low in the tree as possible — wrap only the interactive parts
- Wrap client components in `<Suspense>` with a meaningful fallback

```tsx
// Server Component (default) — fetches data, no client JS
export default async function UserProfile({ id }: { id: string }) {
  const user = await getUser(id);
  return <ProfileCard user={user} />;
}
```

```tsx
'use client';
// Client Component — only for interactivity
export function LikeButton({ postId }: { postId: string }) {
  const [liked, setLiked] = useState(false);
  return <button onClick={() => setLiked(!liked)}>Like</button>;
}
```

## Data Fetching

- Fetch data in Server Components using `async/await` — no `useEffect` needed
- Use `fetch()` with Next.js caching options or server actions for mutations
- Handle loading states with `loading.tsx` files in the route segment
- Handle errors with `error.tsx` files — they automatically wrap the segment in an error boundary

## Routing

- Use file-based routing conventions: `page.tsx`, `layout.tsx`, `loading.tsx`, `error.tsx`, `not-found.tsx`
- Use route groups `(groupName)` to organize routes without affecting the URL
- Use dynamic routes `[slug]` for parameterized pages
- Use parallel routes `@slot` when sections of a page load independently

## Middleware

- Use `middleware.ts` at the project root for request-level logic (auth checks, redirects, geolocation)
- Keep middleware fast — it runs on every matching request
- Use the `matcher` config to scope middleware to specific paths

```typescript
// middleware.ts
import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const token = request.cookies.get('auth-token');
  if (!token && request.nextUrl.pathname.startsWith('/dashboard')) {
    return NextResponse.redirect(new URL('/login', request.url));
  }
  return NextResponse.next();
}

export const config = {
  matcher: ['/dashboard/:path*'],
};
```

## Metadata and SEO

- Export a `metadata` object or `generateMetadata()` function from `layout.tsx` or `page.tsx`
- Set unique titles and descriptions for each page
- Use the `opengraph-image` and `twitter-image` file conventions for social previews
- Add a `robots.txt` and `sitemap.xml` via the App Router file conventions

```typescript
export const metadata = {
  title: 'Dashboard | My App',
  description: 'View your project metrics and recent activity.',
  openGraph: {
    title: 'Dashboard | My App',
    description: 'View your project metrics and recent activity.',
  },
};
```

## Error Boundaries

- Create `error.tsx` files at each route segment that needs custom error handling
- `error.tsx` must be a Client Component (`'use client'`)
- Provide a retry mechanism and a clear error message
- Use `global-error.tsx` in the root `app/` directory for uncaught errors

```tsx
'use client';

export default function Error({ error, reset }: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <div role="alert">
      <h2>Something went wrong</h2>
      <p>{error.message}</p>
      <button onClick={reset}>Try again</button>
    </div>
  );
}
```

## Forms and Validation

- Use [react-hook-form](https://react-hook-form.com/) with [Zod](https://zod.dev/) for client-side validation
- Use Server Actions for form submissions when possible
- Always validate on the server — client validation is a UX convenience, not a security measure
- Show loading states during submission, error states on failure

## State Management

- Minimize client-side state — prefer server state and URL search params
- Use React Context sparingly and only for truly global client state (theme, auth)
- For complex client state, use [Zustand](https://zustand-demo.pmnd.rs/) over Redux
- Use `useSearchParams` and `useRouter` for URL-driven state

## Performance

- Optimize images with `next/image` — it handles lazy loading, sizing, and format conversion
- Use `next/font` for font loading — eliminates layout shift
- Minimize `'use client'` surface area to reduce JavaScript sent to the browser
- Use `dynamic()` imports for heavy components that aren't needed on initial load
- Enable React Server Components for data-heavy pages to eliminate client-side fetch waterfalls

## Caching

- Understand the four caching layers: Request Memoization, Data Cache, Full Route Cache, Router Cache
- Use `revalidatePath()` or `revalidateTag()` to invalidate cached data after mutations
- Set `export const revalidate = 3600` for time-based ISR on static pages
- Use `cache: 'no-store'` on fetches that must always be fresh

---

*Related: [Tailwind CSS](tailwind.md) | [Clean Code](clean-code.md) | [Creative Standards](creative-standards.md)*
