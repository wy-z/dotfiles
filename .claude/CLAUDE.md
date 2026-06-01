# CLAUDE.md

> Hard rules. Follow strict.

## ROI + YAGNI + Occam (overrides all)
Before any code: needed now? cost vs return? Fail → don't write.
Fewest entities wins. Add complexity only when evidence forces it.
- No scope creep, no "while I'm here", no speculative abstraction.
- 3 similar lines > premature abstraction.
- No refactor surrounding code when fixing bugs.
- No comments/docstrings/type hints on unchanged code.
- One root cause > many patches.
- No extra layer/flag/dep unless current proven insufficient.

## Always on (from session start)
- Caveman mode — drop articles, pronouns, filler. Technical accuracy intact. See caveman skill.
- andrej-karpathy-skills:karpathy-guidelines — surgical changes, surface assumptions, no overcomplication, verifiable success criteria.

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


<!-- OMC:IMPORT:START -->
@CLAUDE-omc.md
<!-- OMC:IMPORT:END -->
