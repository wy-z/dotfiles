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

@RTK.md
# graphify
- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, invoke the Skill tool with `skill: "graphify"` before doing anything else.
