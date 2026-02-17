# Database

> Schema design, indexing, query optimization, and security practices for relational databases — with specifics for Prisma and Supabase.

---

## Schema Design

- Name tables as plural nouns in `snake_case`: `users`, `order_items`, `project_members`
- Name columns descriptively: `created_at` not `date`, `is_active` not `status`
- Every table gets an `id` (UUID or auto-increment), `created_at`, and `updated_at`
- Use appropriate column types — `text` for variable-length strings, `varchar(n)` only when you need a hard limit, `timestamptz` for dates with timezones
- Define `NOT NULL` constraints on every column that should always have a value
- Use enums or lookup tables for fixed sets of values (e.g., `status: 'draft' | 'published' | 'archived'`)

## Normalization

- Normalize to 3NF by default — eliminate duplicate data across tables
- Denormalize intentionally for read-heavy queries, and document why
- Use junction tables for many-to-many relationships: `users` <-> `user_roles` <-> `roles`
- Define foreign keys with explicit `ON DELETE` behavior (`CASCADE`, `SET NULL`, or `RESTRICT`)

## Indexing

- Add indexes to columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses
- Use composite indexes for queries that filter on multiple columns — column order matters (most selective first)
- Add unique indexes to enforce business rules (e.g., one email per user)
- Avoid indexing columns with low cardinality (e.g., boolean flags on small tables)
- Monitor slow queries with `EXPLAIN ANALYZE` and add indexes based on actual query plans

```sql
-- Composite index for filtering by org and sorting by date
CREATE INDEX idx_projects_org_created
ON projects (organization_id, created_at DESC);

-- Unique constraint enforced via index
CREATE UNIQUE INDEX idx_users_email
ON users (email);
```

## Query Optimization

- Select only the columns you need — avoid `SELECT *` in production code
- Use `LIMIT` and cursor-based pagination instead of `OFFSET` for large datasets
- Avoid N+1 queries — use `JOIN` or batch loading (Prisma: `include`, Supabase: `select('*, comments(*)')`)
- Use transactions for operations that must succeed or fail together
- Batch inserts and updates when working with multiple rows

```sql
-- Cursor-based pagination (faster than OFFSET for large tables)
SELECT * FROM posts
WHERE created_at < '2024-01-15T00:00:00Z'
ORDER BY created_at DESC
LIMIT 20;
```

## Prisma

### Schema Definition

```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String
  posts     Post[]
  createdAt DateTime @default(now()) @map("created_at")
  updatedAt DateTime @updatedAt @map("updated_at")

  @@map("users")
}

model Post {
  id        String   @id @default(cuid())
  title     String
  content   String?
  published Boolean  @default(false)
  author    User     @relation(fields: [authorId], references: [id], onDelete: Cascade)
  authorId  String   @map("author_id")
  createdAt DateTime @default(now()) @map("created_at")

  @@index([authorId])
  @@map("posts")
}
```

### Migrations

- Run `prisma migrate dev` during development to generate and apply migrations
- Run `prisma migrate deploy` in CI/CD — never run `dev` in production
- Review generated SQL before applying — Prisma migrations are just SQL files
- Use `prisma db seed` for test data with a seed script in `prisma/seed.ts`

### Query Patterns

```typescript
// Avoid N+1 — include related data in one query
const users = await prisma.user.findMany({
  include: { posts: { where: { published: true } } },
  take: 20,
});

// Transaction for atomic operations
await prisma.$transaction([
  prisma.post.update({ where: { id }, data: { published: true } }),
  prisma.auditLog.create({ data: { action: 'publish', postId: id } }),
]);
```

## Supabase

### Row Level Security (RLS)

- Enable RLS on every table — without it, all data is publicly accessible
- Write policies that check `auth.uid()` against the row's owner
- Test policies by querying as different user roles

```sql
-- Users can only read their own data
CREATE POLICY "Users read own data"
ON profiles FOR SELECT
USING (auth.uid() = user_id);

-- Users can update their own profile
CREATE POLICY "Users update own profile"
ON profiles FOR UPDATE
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);
```

### Client Setup

```typescript
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// Query with filtering and pagination
const { data, error } = await supabase
  .from('posts')
  .select('id, title, author:users(name)')
  .eq('published', true)
  .order('created_at', { ascending: false })
  .range(0, 19);
```

### Real-time Subscriptions

```typescript
const channel = supabase
  .channel('posts-changes')
  .on('postgres_changes',
    { event: 'INSERT', schema: 'public', table: 'posts' },
    (payload) => console.log('New post:', payload.new)
  )
  .subscribe();
```

## Connection Management

- Use connection pooling in production — direct connections per request don't scale
- Prisma: configure the `connection_limit` parameter in the connection string
- Supabase: use the pooler connection string (port 6543) for serverless environments
- Close connections properly — leaked connections exhaust the pool

## Security

- Never expose database credentials in client-side code
- Use parameterized queries — never interpolate user input into SQL strings
- Grant minimum necessary permissions to application database users
- Encrypt sensitive columns (PII, tokens) at the application level
- Enable SSL for all database connections in production
- Schedule regular automated backups and test restoration periodically

## Migrations Best Practices

- Migrations are forward-only — never edit an already-applied migration
- Make migrations small and focused — one schema change per migration
- Test migrations against a copy of production data before deploying
- Include both `up` and `down` migration scripts for rollback capability
- Store migration files in version control alongside application code

---

*Related: [Python](python.md) | [Next.js](nextjs.md) | [Clean Code](clean-code.md)*
