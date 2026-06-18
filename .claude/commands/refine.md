---
description: "Iterative code refinement (default: git staged changes)"
---

Refine code through iterative rounds for cleaner, more elegant, and readable code.

**Target**: $ARGUMENTS

**Constraints**:
- Preserve original logic exactly - no functional changes
- Focus on: simplicity, elegance, readability
- Occam: fewest entities wins; collapse layers/flags/abstractions unless evidence forces them
- Each round builds on previous improvements

**Process**:

1. **Determine target content**:
   - If `$ARGUMENTS` provided: use as target (file path, git ref range, or content)
   - If empty: use `git diff --cached` for staged changes

2. **Round 1 - Architecture** (framework-focused review, paired with codex):
   - Co-review the structural skeleton: module boundaries, interface width, layering, coupling, and control flow
   - Get a second opinion from codex on the architecture — flag shallow modules, leaky abstractions, and redundant layers
   - APoSD lens: deepen modules (narrow interface, deep implementation), push complexity down, collapse layers Occam cannot justify
   - Apply only structural refinements both reviewers agree on — logic stays identical
   - Output the restructured code

3. **Round 2 - Simplify**: Run `/simplify` on the target to eliminate redundancy, reuse opportunities, and YAGNI violations first.

4. **Round 3 - Structure & Clarity**:
   - Simplify nested logic and reduce complexity
   - Improve naming for variables, functions, parameters
   - Remove redundant code and dead paths
   - Output the refined code

5. **Round 4 - Elegance & Idioms**:
   - Apply language-specific idioms and best practices
   - Leverage modern syntax and patterns
   - Consolidate repetitive patterns
   - Output the further refined code

6. **Round 5 - Final Polish**:
   - Final readability and style improvements
   - Validate all changes preserve original logic
   - Output the final refined code

7. **Summary** (in user's native language, inferred from conversation):
   - List key improvements from each round
   - Before/after comparison highlights
   - Confidence that logic is preserved
