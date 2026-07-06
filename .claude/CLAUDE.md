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

## Modularity (build-block / compose)
- Extract when boundary stable — bias toward pulling it out as a module. Premature only if boundary still shifting (that's the YAGNI line).
- "Independent enough" = high cohesion + low coupling + single responsibility. Else leave inline.
- Extracted unit = reusable primitive (deep module), grown bottom-up so others compose on it.

## OOP (lean in, dodge traps)
- Prefer objects first — bundle state + behavior, callers stay simple.
- More OOP = more encapsulation, not more classes. Each object earns place as deep module: narrow interface, deep impl.
- Chase wins: hide internals, enforce invariants (constructor sets, methods keep), polymorphism for swappable impl, model domain as objects, invalid states unrepresentable.
- Dodge traps: classitis (shallow classes), deep inheritance, anemic bag + procedural sprawl, getter/setter ceremony, god object, speculative pattern/interface.
- Composition > inheritance — inherit only true is-a. Mutate via invariant-holding methods, never leak mutable internals.
- OOP serves readability — plain function wins when reads clearer.

## Decisions
codex 2nd opinion: auto-call for architecture, risky changes, key tradeoffs, non-trivial design.

## Code
- Minimal, idiomatic, self-documenting.
- Errors explicit (raise/log). Never swallow.
- KISS — simplest wins.
- DRY, but duplication > wrong abstraction.

## Workflow
- Before commit: run /refine once.
- Before commit: loop review together with codex (Claude + codex both review) until zero P0/P1 bugs. Review code logic and business logic together — both, same pass. Follows ROI + YAGNI + Occam + APoSD.
- After both: run /refine again on-demand if diff large.

## Tools
- **context7** — lib/API docs, setup, config.
- **ccc** — semantic code search. Prefer over Grep.

@skills/karpathy-guidelines/SKILL.md

@RTK.md
