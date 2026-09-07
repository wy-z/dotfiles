# CLAUDE.md

> Hard rules. Follow strict.

## Design
**ROI + YAGNI + Occam + least ownership — overrides every rule below.** Code is liability, not asset: less you own → smaller error surface, lower upkeep. Before any code: needed now? cost vs return? Fail → don't write. Fewest entities wins; add complexity only when evidence forces it.
**Prefer live open source over writing it yourself.** The trade is "code I maintain" → "code I don't control": worth it when the problem is not your business's problem and the project is genuinely evolving — else the dep is just new complexity.
**Complexity = dependencies + obscurity.** Before any change: which did I add?

- No scope creep, no "while I'm here", no speculative abstraction.
- 3 similar lines > premature abstraction. DRY, but duplication > wrong abstraction.
- No refactor of surrounding code when fixing bugs. No comments/docstrings/type hints on unchanged code.
- One root cause > many patches.
- No dep/layer/flag to replace code that already works — only when current proven insufficient.
- Reject low ROI + big complexity. Lower complexity always better — when forced, take least.
- Implementation too complex → decompose first (separation of concerns), not push through. Split passes only if "independent enough" below.
- Deep modules — narrow interface, deep implementation. Shallow modules are debt.
- Push complexity down — the module absorbs it so callers stay simple.
- Extract when boundary stable; premature only while boundary still shifting. Extracted unit = reusable primitive others compose on.
- "Independent enough" = high cohesion + low coupling + single responsibility. Else leave inline.
- Prefer objects first — bundle state + behavior. More OOP = more encapsulation, not more classes.
- Hide internals, enforce invariants (constructor sets, methods keep), make invalid states unrepresentable, polymorphism for swappable impl.
- Logic that reads a model's data lives on the model — derived fields, formatting, comparison; validation once at birth (constructor/parse), downstream trusts the type. Same model-logic repeated at use sites = feature envy, move it in — don't add another copy.
- Plain function wins when it reads clearer.
- Errors explicit (raise/log), never swallowed. Design errors out of existence > scattering try/catch.
- Comment the why and the non-obvious, never the what.
- Code minimal, idiomatic, self-documenting.

## Review
Subtraction first — ask "can this go?" before "is this right?".
- Every new entity (fn/class/flag/param/dep/layer/file/test) proves need now → else propose delete, not polish.
- Fix by removing > fix by adding guard/wrapper/comment/abstraction.
- Cut on sight: dead code, unused param, single-caller wrapper, check for impossible state, comment restating code, config nobody sets.
- Report = P0/P1 bugs + deletion list (what to remove, LOC saved). Net diff should shrink.
- Never suggest unasked feature/hardening/abstraction — that is addition wearing review clothes.

## Workflow
- Task → verifiable goal first: "add validation" → write tests for invalid input, make pass. "fix bug" → failing test that repros, make pass. Multi-step → state plan, one verify check per step.
- Bug fixed → two sweeps: 1) same mistake elsewhere — search the pattern, not the line; 2) can API/type/structure make it unrepresentable? Report both; fix beyond the bug only when agreed.
- State assumptions explicit. Readings differ enough to change the work → ask; else write the assumption down and proceed. Simpler path exists → say so, push back. Confused → stop, name what is unclear.
- codex 2nd opinion: auto-call for architecture, risky changes, key tradeoffs, non-trivial design.
- Fable quota scarce → main thread orchestrates, subagents (Opus via CLAUDE_CODE_SUBAGENT_MODEL) execute. Delegate anything self-contained: codebase search/explore, spec'd implementation step, test writing, review pass, doc fetch. Main thread keeps design decisions, integration, final judgment. Fork only when subagent needs full context.
- Before commit, in order: 1) subtraction pass over whole diff per ## Review — report deletion list + net LOC delta first; 2) /refine once; 3) review loop with codex (both review, code logic + business logic, per ## Design + ## Review) until zero P0/P1. Diff still large after loop → /refine again.
- Trivial diff (typo/docs/one-liner) → skip /refine + codex loop, Claude self-review only.
- Consecutive multi-commit run: codex slow — skip per-commit codex review, run once after last commit. Claude still reviews every commit.
- Before PR: tidy history — squash fixup/WIP/noise commits (any non-interactive means); each commit = one coherent change, history reads as logical steps.
- Docs into the repo → English by default; reply language unaffected.
- Commits: conventional (feat/fix/docs/refactor/...), imperative subject.

## Tools
- **context7** — lib/API docs, setup, config.
- **rtk** — call by hand only for: `rtk proxy <cmd>` (raw unfiltered output — rtk's filter can hide entries), `rtk gain [--history]`, `rtk discover`.
