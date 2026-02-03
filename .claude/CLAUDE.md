# CLAUDE.md

**CRITICAL**: These are mandatory coding standards. Follow them strictly.

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

## MCP Tools

### Context7
Prefer using Context7 MCP when needing library/API documentation, code generation, setup or configuration steps - without requiring explicit user request.
