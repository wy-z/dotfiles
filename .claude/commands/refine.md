---
description: "Iterative code refinement (default: git staged changes)"
---

Refine code through 3 iterative rounds for cleaner, more elegant, and readable code.

**Target**: $ARGUMENTS

**Constraints**:
- Preserve original logic exactly - no functional changes
- Focus on: simplicity, elegance, readability
- Each round builds on previous improvements

**Process**:

1. **Determine target content**:
   - If `$ARGUMENTS` provided: use as target (file path, git ref range, or content)
   - If empty: use `git diff --cached` for staged changes

2. **Round 1 - Structure & Clarity**:
   - Simplify nested logic and reduce complexity
   - Improve naming for variables, functions, parameters
   - Remove redundant code and dead paths
   - Output the refined code

3. **Round 2 - Elegance & Idioms**:
   - Apply language-specific idioms and best practices
   - Leverage modern syntax and patterns
   - Consolidate repetitive patterns
   - Output the further refined code

4. **Round 3 - Final Polish**:
   - Final readability and style improvements
   - Validate all changes preserve original logic
   - Output the final refined code

5. **Summary** (in user's native language, inferred from conversation):
   - List key improvements from each round
   - Before/after comparison highlights
   - Confidence that logic is preserved
