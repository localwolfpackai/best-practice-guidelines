# Prompt Engineering

> Structured prompt design using the SPS Framework — for building effective, repeatable AI interactions.

---

## SPS Framework

The SPS (Structured Prompt System) Framework breaks every prompt into five distinct sections. This structure produces consistent, high-quality outputs regardless of the task.

### 1. Context Setting

Define the environment before giving instructions:

- **Role** — the persona the model should adopt (e.g., "Senior DevOps Engineer", "Creative Director")
- **Goal** — the why and the end goal, stated clearly (e.g., "To generate a clean, modular Python script for...")
- **Participants** — who the audience is
- **Setting** — the scenario or environment

### 2. Data for Grounding

Anchor the model in real data:

- **Inputs** — placeholders for variables (e.g., `[INSERT_CRM_DATA]`, `[PASTE_CODE_HERE]`)
- **Sources** — explicitly state where data should come from (e.g., "Use only the provided JSON", "Reference the uploaded PDF")

### 3. Instructions

The logic layer — what the model should actually do:

- **Sub-tasks** — break the request into sequential steps (Step 1, Step 2, Step 3)
- **Chain of Thought** — instruct the model to plan before executing if the task is complex
- **Tone & Style** — define the voice (e.g., "Professional, concise, no fluff")

### 4. Model Containment (Guardrails)

Prevent unwanted outputs:

- **Constraints** — what the model must NOT do (e.g., "Do not use placeholders", "Do not hallucinate external URLs")
- **Safety** — specific bias or data protection rules relevant to the task

### 5. Output Format

Define exactly what comes back:

- **Structure** — the exact format (JSON, Markdown, table, boolean)
- **One-Shot Example** — provide one example of ideal input and output to guide the model

## Guiding Principles

- **Clear and specific** — use precise, unambiguous language the model can interpret without confusion
- **Relevant** — tie prompts to real data, workflows, and goals for meaningful, context-aware responses
- **Effective** — write prompts that produce consistent, useful results
- **Structured** — organize with a clear format to improve clarity and make iteration easier
- **Trusted** — design with ethics, data integrity, and safety in mind
- **Sustainable** — minimize token usage and computational load when possible

## Prompt Design Patterns

Design patterns are reusable blueprints for common prompt structures. Adapt them to your specific task — they're starting points, not rigid rules.

### Role + Task Pattern

```text
You are a [role] with expertise in [domain].
Your task is to [specific action] based on [input].
Output as [format].
```

### Step-by-Step Pattern

```text
Analyze the following [input type]:
1. First, identify [aspect A]
2. Then evaluate [aspect B]
3. Finally, recommend [action]

Think through each step before providing your answer.
```

### Constraint-Heavy Pattern

```text
Given [context], generate [output].

Rules:
- Do NOT include [unwanted thing]
- Always include [required thing]
- Format as [specific format]
- Maximum length: [limit]
```

### Few-Shot Pattern

```text
Convert the following inputs to the specified format.

Example:
Input: "2024-01-15"
Output: "January 15, 2024"

Now convert:
Input: "[user_input]"
```

## Common Mistakes

- **Too vague** — "Write something about databases" gives the model no constraints
- **Too many instructions at once** — break complex tasks into sequential prompts
- **No output format** — the model guesses, and the guess varies every time
- **Missing examples** — one good example is worth ten lines of instruction
- **Ignoring guardrails** — without constraints, the model fills gaps with assumptions

---

*Related: [Clean Code](clean-code.md) | [Templating Standards](templating-standards.md)*
