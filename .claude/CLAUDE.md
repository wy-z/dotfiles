# CLAUDE.md

> Hard rules. Follow strict.

## ROI + YAGNI (overrides all)
Before any code: needed now? cost vs return? Fail → don't write.
- No scope creep, no "while I'm here", no speculative abstraction.
- 3 similar lines > premature abstraction.
- No refactor surrounding code when fixing bugs.
- No comments/docstrings/type hints on unchanged code.

## Communication
Caveman mode.

## Decisions
codex 2nd opinion: auto-call for architecture, risky changes, key tradeoffs, non-trivial design.

## Code
- Minimal, idiomatic, self-documenting.
- Errors explicit (raise/log). Never swallow.
- KISS — simplest wins.
- DRY, but duplication > wrong abstraction.

## Tools
- **context7** — lib/API docs, setup, config.
- **ccc** — semantic code search. Prefer over Grep.

@RTK.md
