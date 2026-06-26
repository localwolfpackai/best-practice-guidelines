# Bootstrap a new Claude Code project

The way I start every Lupo Studios project. Next.js + Tailwind v4 + Lupo AI OS rules + Claude Code wired in from the first commit. 15 minutes start to first deploy.

## What you'll end up with

- Next.js 15 (App Router) with TypeScript
- Tailwind CSS v4 (CSS-first, no config file)
- shadcn/ui pre-initialized
- `CLAUDE.md` at the root with the rubric for any agent reviewer
- `~/.claude/rules/` linked in (so voice + reply-shape + naming apply automatically)
- PR review agent installed
- First commit on `main`, pushed to GitHub, deployed to Vercel

## Prerequisites (verify before starting)

```bash
# Check what you have
node --version              # need 20+
gh --version                # need GitHub CLI
vercel --version            # need Vercel CLI
ls ~/.claude/rules/         # need Lupo AI OS rules installed
```

If any are missing:

```bash
brew install node gh vercel-cli
gh auth login
vercel login
# rules: see agents/claude-code/rules/README.md in this repo
```

## Step 1: Create the project (3 min)

```bash
cd ~/Projects/01-experiments    # or 03-products if it's serious
npx create-next-app@latest my-project \
  --typescript \
  --tailwind \
  --app \
  --src-dir \
  --import-alias "@/*" \
  --no-eslint \
  --use-npm

cd my-project
```

(Skip ESLint — Biome is the default in `stack-preferences.md`. Add it in Step 3.)

## Step 2: Drop in the CLAUDE.md rubric (1 min)

```bash
cp ~/Projects/09-ai-os/03-products/lupo-ai-os/patterns/pr-review-agent/example-claude-rules.md CLAUDE.md
```

Open `CLAUDE.md`, replace the stack-specific bits with the actual stack for *this* project (Sanity? Supabase? Server actions? etc.).

## Step 3: Install shadcn/ui (2 min)

```bash
npx shadcn@latest init -y \
  --base-color slate \
  --css-variables
```

When prompted, accept all defaults. shadcn writes `components.json` and configures Tailwind.

## Step 4: Add Biome (1 min)

```bash
npm install --save-dev --save-exact @biomejs/biome
npx biome init
```

Edit `biome.json` if you want stricter rules. Default is fine for most projects.

## Step 5: Initialize git and first commit (1 min)

```bash
git init
git add -A
git commit -m "$(cat <<'EOF'
chore: bootstrap from lupo-ai-os recipe

- Next.js 15 (App Router, TypeScript, Tailwind v4)
- shadcn/ui initialized with slate base color
- Biome for linting and formatting
- CLAUDE.md rubric for AI reviewers
EOF
)"
```

## Step 6: Push to GitHub (2 min)

```bash
gh repo create my-project --public --source=. --remote=origin --push
gh repo edit --add-topic nextjs --add-topic typescript --add-topic tailwind-v4
```

## Step 7: Install the PR review agent (2 min)

```bash
bash ~/Projects/09-ai-os/03-products/lupo-ai-os/patterns/pr-review-agent/setup.sh .

gh secret set COMPOSIO_API_KEY
gh secret set OPENAI_API_KEY

git add -A
git commit -m "ci: add CLAUDE.md-aware PR review agent"
git push
```

## Step 8: Deploy to Vercel (3 min)

```bash
vercel link --yes
vercel --prod
```

First deploy takes ~90 seconds. The output prints the production URL.

## Step 9: Verify the agent works

```bash
# Create a test PR
git checkout -b test-pr-review
echo "// test change" >> src/app/page.tsx
git commit -am "test: trigger pr review"
git push -u origin test-pr-review
gh pr create --title "Test PR review agent" --body "Should auto-review"
```

Within ~2 minutes, the agent should post a review comment on the PR. If it doesn't, check the Actions tab.

Once verified:

```bash
gh pr close test-pr-review --delete-branch
```

## What's next

The project is live, deployable, and has a reviewer. From here:

- Add the LLM guardrails pattern (when ported — see `patterns/llm-guardrails/`)
- Build the actual app
- Wire up analytics, monitoring, error tracking per `stack-preferences.md`

## Why these choices

- **Next.js App Router** — server components by default, server actions for mutations, file-based routing
- **Tailwind v4** — CSS-first means no config file to maintain, design tokens live in `global.css`
- **shadcn/ui** — composable, not a black box. Components live in your repo and you can edit them.
- **Biome over ESLint + Prettier** — single tool, faster, less config drift
- **`src/` directory** — keeps app code separate from config files, easier to glob in scripts
- **No `--turbopack`** — stable now but still introduces edge cases on some projects; opt in later per project
- **Public repo by default** — most of my projects are open. Make it private at creation time if it shouldn't be.

These choices match `agents/claude-code/rules/stack-preferences.md` in the repo. If you disagree with any of them, edit your local rules first — the recipe reflects defaults.
