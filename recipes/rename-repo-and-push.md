# Rename and push v0.2

You're on branch `v0.2-ai-os-pivot`. `main` is untouched. Follow these steps in order — read each before running.

## 1. Review the diff

```bash
cd ~/Projects/09-ai-os/03-products/lupo-ai-os
git status
git diff --stat main
```

Open the new files. Read `README.md`. If anything sounds off (voice, claims, structure), edit before you push.

## 2. Decide on the new name

Options I considered:

| Name | Pros | Cons |
|---|---|---|
| `lupo-ai-os` | Personal brand, distinctive | Locks to your name |
| `wolfpack-ai-os` | Plays off your handle (`localwolfpackai`) | Slightly less searchable |
| `humanlup-ai-os` | Connects to the business | Confuses the audience (this is broader than HumanLup) |
| `still-human-os` | Plays off your sign-off | Cute but obscure |

My pick: **`lupo-ai-os`**. Most recognizable, ties to your handle and your name.

Whatever you pick, replace `lupo-ai-os` in the commands below.

## 3. Commit the pivot on the branch

```bash
git add -A
git commit -m "$(cat <<'EOF'
v0.2: pivot from prose guidelines to working AI OS

- Restructure as patterns/, recipes/, guides/
- Add patterns/pr-review-agent/ — turnkey CLAUDE.md-aware reviewer
- Preserve 9 existing guides in guides/
- New story-driven README + CHANGELOG
- Rules, hooks, and subagents port queued for v0.3

The original prose guides remain available under guides/.
Old slug (best-practice-guidelines) redirects to new name via GitHub.
EOF
)"
```

## 4. Merge to main locally

```bash
git checkout main
git merge v0.2-ai-os-pivot --no-ff -m "Merge v0.2: AI OS pivot"
```

## 5. Rename the repo on GitHub

```bash
gh repo rename lupo-ai-os --repo localwolfpackai/best-practice-guidelines
```

GitHub auto-redirects the old URL. Any existing links from your LinkedIn, site, or anywhere else will still resolve.

## 6. Update your local remote

```bash
git remote set-url origin git@github.com:localwolfpackai/lupo-ai-os.git
git remote -v   # verify
```

## 7. Push

```bash
git push origin main
git push origin v0.2-ai-os-pivot   # optional — keep the pivot branch for history
```

## 8. Update the repo description and topics

```bash
gh repo edit localwolfpackai/lupo-ai-os \
  --description "A working AI operating system for Claude Code. Rules, hooks, subagents, patterns — the actual setup I use to ship." \
  --add-topic claude-code \
  --add-topic claude \
  --add-topic ai-agents \
  --add-topic claude-agent-sdk \
  --add-topic mcp \
  --add-topic ai-os
```

## 9. Pin to your profile

```bash
gh repo edit localwolfpackai/lupo-ai-os --enable-issues=true --enable-wiki=false
```

Then manually pin it from your GitHub profile page (Pinned repositories → edit pins).

## 10. Announce

The launch post writes itself once you've shipped. Suggested places, in order:

1. **X** (`@humanlup`) — quote-tweet the repo URL with one line: "It took me 18 months and President's Club at Yext to figure out what to put in this repo. Open-sourced today." Add the structure tree as a screenshot.
2. **LinkedIn** — longer-form. Frame as: "I built an OS for working with Claude. Here's what's in it."
3. **GitHub Discussions** — open a thread for feedback. Pin it.
4. **Lupo Studios site** — add a featured project card linking to the repo.

## Rollback (if you change your mind)

```bash
# rename back
gh repo rename best-practice-guidelines --repo localwolfpackai/lupo-ai-os

# reset main
git checkout main
git reset --hard origin/main   # CAREFUL — drops the merge

# branch survives so you can iterate
git checkout v0.2-ai-os-pivot
```

You'd lose the pivot commit on `main` locally but the branch keeps the work intact.
