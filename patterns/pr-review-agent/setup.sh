#!/usr/bin/env bash
# Lupo AI OS — PR Review Agent installer
# Drops the workflow + agent + example rubric into a target repo

set -euo pipefail

# ---- args ----
TARGET="${1:-}"

if [[ -z "$TARGET" ]]; then
  cat <<'USAGE'
Usage: bash setup.sh /path/to/target/repo

Installs the PR review agent into the target repo:
  .github/workflows/pr-review.yml
  .github/scripts/pr-review-agent.py
  CLAUDE.md (only if no CLAUDE.md or AGENTS.md exists)

After install, set repo secrets and open a PR to test.
USAGE
  exit 1
fi

if [[ ! -d "$TARGET" ]]; then
  echo "error: target directory not found: $TARGET" >&2
  exit 1
fi

if [[ ! -d "$TARGET/.git" ]]; then
  echo "error: target is not a git repo: $TARGET" >&2
  exit 1
fi

# ---- paths (resolve relative to this script's location) ----
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing PR review agent into: $TARGET"
echo

# ---- workflow file ----
mkdir -p "$TARGET/.github/workflows"
mkdir -p "$TARGET/.github/scripts"

cp "$SCRIPT_DIR/.github/workflows/pr-review.yml" "$TARGET/.github/workflows/pr-review.yml"
cp "$SCRIPT_DIR/agent.py" "$TARGET/.github/scripts/pr-review-agent.py"

# Update the workflow's run path to point at the new script location
# macOS BSD sed compatible (no -i '' issues)
sed -i.bak 's|run: python agent.py|run: python .github/scripts/pr-review-agent.py|' "$TARGET/.github/workflows/pr-review.yml"
rm -f "$TARGET/.github/workflows/pr-review.yml.bak"

echo "  installed .github/workflows/pr-review.yml"
echo "  installed .github/scripts/pr-review-agent.py"

# ---- example CLAUDE.md (only if neither CLAUDE.md nor AGENTS.md exists) ----
if [[ ! -f "$TARGET/CLAUDE.md" && ! -f "$TARGET/AGENTS.md" ]]; then
  cp "$SCRIPT_DIR/example-claude-rules.md" "$TARGET/CLAUDE.md"
  echo "  installed CLAUDE.md (rubric — edit before pushing)"
else
  echo "  skipped CLAUDE.md (existing CLAUDE.md or AGENTS.md found — agent will use it)"
fi

echo
echo "Next steps:"
echo
echo "  1. Edit $TARGET/CLAUDE.md to define your review rubric"
echo
echo "  2. Set repo secrets (run inside $TARGET):"
echo "       gh secret set COMPOSIO_API_KEY"
echo "       gh secret set OPENAI_API_KEY"
echo
echo "  3. Pre-authorize the Composio GitHub connection for user_id=user_123"
echo "     (or edit the user_id in .github/scripts/pr-review-agent.py)"
echo
echo "  4. Commit + push the new files"
echo
echo "  5. Open a PR — the agent will review it within ~2 min"
echo
echo "Docs: https://github.com/localwolfpackai/lupo-ai-os/tree/main/patterns/pr-review-agent"
