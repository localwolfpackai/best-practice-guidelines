# Python

> Project structure, code style, type hints, and modern tooling for Python applications.

---

## Project Structure

- Use src-layout with `src/your_package_name/`
- Place tests in `tests/` directory parallel to `src/`
- Keep configuration in `config/` or as environment variables
- Store requirements in `pyproject.toml` (preferred) or `requirements.txt`
- Place static files in `static/` directory
- Use `templates/` for Jinja2 templates

## Code Style

- Follow [Black](https://black.readthedocs.io/) code formatting
- Use [isort](https://pycqa.github.io/isort/) for import sorting
- Follow PEP 8 naming conventions:
  - `snake_case` for functions and variables
  - `PascalCase` for classes
  - `UPPER_CASE` for constants
- Maximum line length of 88 characters (Black default)
- Use absolute imports over relative imports

## Type Hints

- Use type hints for all function parameters and return types
- Import types from the `typing` module
- Use `Optional[Type]` for nullable values
- Use `TypeVar` for generic types
- Define custom types in a `types.py` module
- Use `Protocol` for duck typing

```python
from typing import Optional

def get_user(user_id: int) -> Optional[dict]:
    """Fetch a user by ID. Returns None if not found."""
    ...
```

## Modern Tooling

- **Package management:** [uv](https://github.com/astral-sh/uv) for fast dependency resolution and virtual environments
- **Linting:** [Ruff](https://docs.astral.sh/ruff/) replaces flake8, isort, and many other tools in one pass
- **Web frameworks:** [FastAPI](https://fastapi.tiangolo.com/) for APIs (async, auto-generated docs, Pydantic validation) or Flask for simpler apps
- **Validation:** [Pydantic](https://docs.pydantic.dev/) for data modeling and input validation
- **Task runners:** [Taskfile](https://taskfile.dev/) or Makefiles for common dev commands

## Flask Structure

- Use the Flask factory pattern (`create_app()`)
- Organize routes using Blueprints
- Use Flask-SQLAlchemy for database integration
- Implement custom error handlers for 404, 500, etc.
- Use Flask-Login for session-based authentication
- Separate views, models, and services into distinct modules

## API Design

- Use proper HTTP methods: GET for reads, POST for creates, PUT/PATCH for updates, DELETE for deletes
- Return consistent response shapes:
  ```python
  {"data": ..., "error": None}       # success
  {"data": None, "error": "message"} # failure
  ```
- Use meaningful HTTP status codes (201 for created, 404 for not found, 422 for validation errors)
- Implement rate limiting for public endpoints
- Version APIs in the URL path (`/api/v1/`) or via headers

## Database

- Use SQLAlchemy ORM or an async alternative like [SQLModel](https://sqlmodel.tiangolo.com/)
- Implement database migrations with Alembic
- Enable connection pooling in production
- Define models in separate modules grouped by domain
- Add indexes to columns used in WHERE, JOIN, and ORDER BY clauses

## Authentication

- Use Flask-Login for session management or JWT for stateless APIs
- Hash passwords with bcrypt
- Implement CSRF protection on all form endpoints
- Use role-based access control for authorization
- Store secrets in environment variables, never in code

## Testing

- Use [pytest](https://pytest.org/) as the test runner
- Write tests for all routes and edge cases
- Use `pytest-cov` for coverage reporting
- Create reusable fixtures for database connections, auth tokens, and test data
- Mock external services with `pytest-mock` or `responses`

## Security

- Use HTTPS in production
- Implement CORS with explicit allowed origins
- Sanitize all user inputs — never trust raw request data
- Configure secure session cookies (`HttpOnly`, `SameSite`, `Secure`)
- Follow [OWASP guidelines](https://owasp.org/www-project-top-ten/) for the top 10 vulnerabilities

## Performance

- Use caching (Flask-Caching, Redis, or `functools.lru_cache`) for expensive operations
- Optimize database queries — use `EXPLAIN` to identify slow queries
- Implement pagination for list endpoints
- Use background task queues (Celery, RQ, or ARQ) for heavy operations
- Profile with `cProfile` or `py-spy` to find bottlenecks

## Error Handling

- Create custom exception classes for domain-specific errors
- Use try-except blocks at clear boundaries (API calls, I/O, database)
- Return structured error responses with actionable messages
- Log errors with context (request ID, user ID, stack trace)

## Documentation

- Use Google-style docstrings for all public functions
- Keep `README.md` current with setup instructions and architecture overview
- Generate API docs automatically (Swagger/OpenAPI with FastAPI, or Flask-RESTX)
- Document environment variables and their expected values

## Development Workflow

- Use virtual environments (`venv` or `uv venv`) — never install globally
- Set up pre-commit hooks for formatting and linting
- Follow semantic versioning for releases
- Pin dependency versions in production

---

*Related: [Clean Code](clean-code.md) | [Database](database.md) | [Gitflow](gitflow.md)*
