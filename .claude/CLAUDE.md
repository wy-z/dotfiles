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

## Software design (APoSD)
- Complexity = dependencies + obscurity. Before any change: which did I add?
- Deep modules — narrow interface, deep implementation. Shallow modules are debt.
- Push complexity down — the module absorbs it so callers stay simple.
- Design errors out of existence > scattering try/catch.
- Comment the why and the non-obvious, never the what.

## OOP (readability tool, not goal)
- Object when state + behavior bundle clarifies caller; class earns place only as deep module.
- Function + plain data first — no class/inheritance/pattern till that proves insufficient.
- Composition > inheritance. Behavior with data, not anemic object + procedural sprawl.
- OOP serves readability; readability never bends to OOP.

## Always on (from session start)
- Caveman mode — drop articles, pronouns, filler. Technical accuracy intact. See caveman skill.

## Decisions
codex 2nd opinion: auto-call for architecture, risky changes, key tradeoffs, non-trivial design.

## Code
- Minimal, idiomatic, self-documenting.
- Errors explicit (raise/log). Never swallow.
- KISS — simplest wins.
- DRY, but duplication > wrong abstraction.

## Workflow
- Before commit: run /refine once.
- Before commit: loop review together with codex (Claude + codex both review) until zero P0/P1 bugs. Review follows ROI + YAGNI + Occam + APoSD.

## Tools
- **context7** — lib/API docs, setup, config.
- **ccc** — semantic code search. Prefer over Grep.

@RTK.md

<!-- OMC:IMPORT:START -->
@CLAUDE-omc.md
<!-- OMC:IMPORT:END -->
