# Clean Code

> Principles for writing code that is readable, maintainable, and easy to reason about — regardless of language or framework.

---

## Constants Over Magic Numbers

- Replace hard-coded values with named constants
- Use descriptive constant names that explain the value's purpose
- Keep constants at the top of the file or in a dedicated constants file

## Meaningful Names

- Variables, functions, and classes should reveal their purpose
- Names should explain why something exists and how it's used
- Avoid abbreviations unless they're universally understood (e.g., `url`, `id`, `config`)

## Smart Comments

- Use comments to explain **why** something is done a certain way, not just what it does
- Document APIs, complex algorithms, design patterns, design decisions, unique features, and non-obvious side effects
- Use standardized prefixes for quick scanning:
  ```
  // DESIGN:    Visual/UX decisions
  // PERF:      Performance optimization
  // A11Y:      Accessibility consideration
  // HACK:      Temporary workaround (include TODO to fix)
  // TODO:      Future improvement needed
  // NOTE:      Important context for understanding
  // SECURITY:  Security-related decision
  ```

## Single Responsibility

- Each function should do exactly one thing
- Functions should be small and focused
- If a function needs a comment to explain what it does, it should probably be split

## DRY (Don't Repeat Yourself)

- Extract repeated code into reusable functions
- Share common logic by extracting it into named functions or modules with a single, clear responsibility
- Maintain single sources of truth

## Clean Structure

- Keep related code together
- Organize code in a logical hierarchy
- Use consistent file and folder naming conventions

## Encapsulation

- Hide implementation details
- Expose clear interfaces
- Move nested conditionals into well-named functions

## Code Quality Maintenance

- Refactor continuously
- Fix technical debt early
- Leave code cleaner than you found it

## Testing

- Write tests before fixing bugs
- Keep tests readable and maintainable
- Test edge cases and error conditions

## Version Control

- Write clear commit messages that explain the **why**
- Make small, focused commits
- Use meaningful branch names (e.g., `feature/add-auth-flow`, not `feature/stuff`)

---

*Related: [Gitflow](gitflow.md) | [Python](python.md) | [Next.js](nextjs.md)*
