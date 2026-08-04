# Fan-out / Fan-in Agent Pipeline Pattern

A reusable orchestration pattern for work that benefits from one framing pass, multiple independent specialist passes, and a final synthesis step.

## When to use it

Use this shape when:

- independent reviewers can examine the same problem in parallel
- each branch should receive shared upstream context
- the final answer needs reconciliation rather than simple concatenation
- intermediate results need explicit status and provenance
- the synthesis step must operate within a defined context budget

Avoid it when the work is strictly sequential, branches mutate the same files, or the coordination overhead is larger than the task.

## Reference flow

```text
input
  |
  v
frame / normalize
  |
  +-------------------+
  |                   |
  v                   v
specialist A      specialist B
  |                   |
  +---------+---------+
            |
            v
       merge / judge
            |
            v
         final output
```

## Required contracts

Each node should define:

- `id`: stable machine-readable name
- `purpose`: one sentence describing the node's responsibility
- `inputs`: upstream artifacts it is allowed to use
- `output_schema`: the shape expected by downstream nodes
- `status`: `PASS`, `FAIL`, or `SKIP`
- `summary`: compact result for routing and inspection
- `body`: full node output
- `max_tokens`: optional context budget for resolution or merge

## Safe execution rules

1. Use a temporary run directory created for the current execution. Do not remove a shared `.context-packet` directory by default.
2. Resolve tool paths from configuration or the environment. Never hard-code another user's absolute filesystem path.
3. Give every parallel branch a unique temporary file and clean it with a shell trap.
4. Capture failures per branch. Do not submit `PASS` after a command exits unsuccessfully.
5. Wait for all required branches before synthesis.
6. Store summaries separately from full bodies so the merge step can stay within budget.
7. Make the merge prompt responsible for conflicts, uncertainty, and evidence gaps.
8. Keep the orchestration graph declarative so branches can be added without rewriting control flow.

## Portable shell skeleton

```bash
#!/usr/bin/env bash
set -Eeuo pipefail

INPUT="${1:-}"
: "${CONTEXT_PACKET_CLI:?Set CONTEXT_PACKET_CLI to the context-packet executable}"
: "${AGENT_CLI:=claude}"

RUN_DIR="$(mktemp -d "${TMPDIR:-/tmp}/agent-pipeline.XXXXXX")"
trap 'rm -rf "$RUN_DIR"' EXIT

run_agent() {
  local prompt="$1"
  local output_file="$2"
  "$AGENT_CLI" -p "$prompt" >"$output_file"
}

# 1. Frame
FRAME_OUTPUT="$RUN_DIR/frame.txt"
run_agent "FRAME_SYSTEM_PROMPT\n\nInput: $INPUT" "$FRAME_OUTPUT"
"$CONTEXT_PACKET_CLI" submit frame \
  --status PASS \
  --summary "Normalized the request and constraints" \
  --body "$(cat "$FRAME_OUTPUT")"

# 2. Fan out
A_PROMPT="$("$CONTEXT_PACKET_CLI" resolve specialist-a | jq -r '.prompt')"
B_PROMPT="$("$CONTEXT_PACKET_CLI" resolve specialist-b | jq -r '.prompt')"

run_agent "SPECIALIST_A_PROMPT\n\n$A_PROMPT" "$RUN_DIR/a.txt" &
PID_A=$!
run_agent "SPECIALIST_B_PROMPT\n\n$B_PROMPT" "$RUN_DIR/b.txt" &
PID_B=$!

wait "$PID_A"
"$CONTEXT_PACKET_CLI" submit specialist-a --status PASS \
  --summary "Specialist A completed" --body "$(cat "$RUN_DIR/a.txt")"

wait "$PID_B"
"$CONTEXT_PACKET_CLI" submit specialist-b --status PASS \
  --summary "Specialist B completed" --body "$(cat "$RUN_DIR/b.txt")"

# 3. Fan in
MERGE_PROMPT="$("$CONTEXT_PACKET_CLI" resolve merge --max-tokens 6000 | jq -r '.prompt')"
run_agent "MERGE_SYSTEM_PROMPT\n\n$MERGE_PROMPT" "$RUN_DIR/final.txt"
cat "$RUN_DIR/final.txt"
```

The skeleton is illustrative. Production use should add per-node retry policy, structured JSON outputs, timeout handling, and explicit failure submission.

## Provenance

| Field | Value |
|---|---|
| Source repository | `localwolfpackai/ai-insights` |
| Source commit | `999a1a33d4b9bc500a3639b8872b22fb48874fd2` |
| Original path | `claude-code/responses/2026-04-21_orchestrator-pipeline-template.sh` |
| Destination | `lupo-ai-os/docs/workflows/fan-out-fan-in-agent-pipeline.md` |
| Preserved value | Sequential framing, parallel specialist fan-out, fan-in synthesis, node submission, context resolution, and merge token budgeting |
| Normalization | Removed a machine-specific absolute path, replaced shared-directory deletion with isolated temporary state, added failure and portability guidance, and documented node contracts |

## Lifecycle recommendation for the source

`ai-insights` does not currently have a distinct runnable product boundary. Its README describes a broad learning hub, while its strongest unique implementation was the orchestration template preserved here. After confirming no additional branches or integrations contain unique work, recommend consolidating the repository into `lupo-ai-os` and archiving it as superseded. Do not delete it; its commit history remains the primary provenance record.
