# CLAUDE.md

**CRITICAL**: These are mandatory coding standards. Follow them strictly.

## Communication

Always use caveman mode by default.

## Coding Standards

Follow **Clean Code** principles: concise, elegant, readable code.

### Core Principles (DO)
- Write minimal code to accomplish the task
- Prefer idiomatic solutions over verbose ones
- Make code self-documenting

### Error Handling (DO)
- Always raise or log errors explicitly
- Never return empty/default values to hide failures

### KISS - Keep It Simple, Stupid (DO)
- Choose the simplest solution that works
- Avoid unnecessary complexity and over-engineering
- If a solution feels complicated, step back and simplify

### DRY - Don't Repeat Yourself (DO)
- Extract repeated logic into reusable functions/modules
- Single source of truth for data and configuration
- But don't over-abstract - duplication is better than wrong abstraction

### YAGNI - You Aren't Gonna Need It (DON'T)
- **DON'T** anticipate or expand requirements without user consent
- **DON'T** make "while I'm here" improvements
- **DON'T** design for hypothetical future requirements
- **DON'T** abstract prematurely - 3 similar lines > unnecessary abstraction
- **DON'T** refactor surrounding code when fixing bugs
- **DON'T** add comments, docstrings, or type hints to unchanged code

## Tools

### context7
Prefer using Context7 MCP when needing library/API documentation, code generation, setup or configuration steps - without requiring explicit user request.

### ccc (Semantic Code Search)
**Prefer `ccc search` as the default code search tool.** Use it for any conceptual, exploratory, or symbol-level search — even when you think Grep might work. It returns semantically ranked results with file paths and line ranges, cutting search iterations and unnecessary file reads.

### code-review-graph
Use code-review-graph MCP tools for structural code exploration (callers, dependents, impact analysis). **Before calling any graph tool, run `code-review-graph update --skip-flows` to refresh the graph.**

Key tools:

| Tool | Use when |
|------|----------|
| `semantic_search_nodes` | Find functions/classes by name or keyword. Prefer over Grep for exploration |
| `query_graph` | Trace relationships: `callers_of`, `callees_of`, `imports_of`, `importers_of`, `tests_for`, `inheritors_of`, `file_summary` |
| `detect_changes` | Code review — risk-scored guidance from git diff |
| `get_impact_radius` | Blast radius of file changes (BFS traversal) |
| `get_affected_flows` | Which execution paths are impacted by changed files |
| `get_architecture_overview` | High-level codebase structure via community analysis |
| `refactor_tool` | `mode=dead_code` detection, `mode=rename` preview |

@RTK.md
