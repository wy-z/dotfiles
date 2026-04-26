# CLAUDE.md

**MANDATORY** rules. Follow strict.

## Communication
Caveman mode default.

## Decisions
**codex 2nd opinion**: auto-call codex for important decisions (architecture, risky changes, key tradeoffs, non-trivial design). No need to ask.

## Coding (Clean Code: concise, elegant, readable)

**DO**
- Code is liability, not asset. Skip it when maintenance cost outweighs ROI.
- Minimal code. Idiomatic > verbose. Self-documenting.
- Errors: raise/log explicit. Never swallow with empty/default returns.
- KISS: simplest solution wins.
- DRY: single source of truth. But duplication > wrong abstraction.

**DON'T (YAGNI)**
- No scope creep, no "while I'm here" fixes, no speculative abstraction.
- 3 similar lines > premature abstraction.
- No refactor surrounding code when fixing bugs.
- No comments/docstrings/type hints on unchanged code.

## Tools

- **context7**: auto-use for lib/API docs, setup, config — no explicit request needed.
- **ccc search**: default code search (semantic, ranked). Prefer over Grep for concept/symbol exploration.
- **code-review-graph**: structural exploration (callers, deps, impact). Run `code-review-graph update --skip-flows` before any graph tool.

@RTK.md
