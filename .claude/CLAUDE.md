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

### YAGNI - You Aren't Gonna Need It (DON'T)
- **DON'T** anticipate or expand requirements without user consent
- **DON'T** make "while I'm here" improvements
- **DON'T** design for hypothetical future requirements
- **DON'T** abstract prematurely - 3 similar lines > unnecessary abstraction
- **DON'T** refactor surrounding code when fixing bugs
- **DON'T** add comments, docstrings, or type hints to unchanged code
