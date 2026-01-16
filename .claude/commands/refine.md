---
description: "Iterative code refinement (default: git staged changes)"
---

Refine code through iterative rounds using the code-simplifier agent.

**Core Principles**: Code must be **concise**, **elegant**, and **readable**. Avoid over-engineering, unnecessary abstractions, and verbose patterns. Simplicity is the ultimate sophistication.

**Target**: $ARGUMENTS

**Process**:

1. **Determine target content**:
   - If `$ARGUMENTS` provided: use as target (file path, git ref range, or content)
   - If empty: use `git diff --cached` for staged changes

2. **Execute refinement**:
   Use the Task tool with `subagent_type: "code-simplifier:code-simplifier"` to refine the target code.

   Prompt the agent with:
   - The target code/files to refine
   - Instruction to perform 3 iterative refinement rounds:
     - Round 1: Structure & Clarity (ruthlessly eliminate redundancy, improve naming, flatten nested logic)
     - Round 2: Elegance & Idioms (apply idiomatic patterns, remove unnecessary abstractions, consolidate logic into minimal elegant form)
     - Round 3: Final Polish (ensure maximum readability with minimum code, validate logic preserved, remove any remaining verbosity)
   - Request a summary of key improvements

3. **Verify logic preservation**:
   After the agent completes, YOU (not the agent) must carefully review the refined code:
   - Compare original and refined code side-by-side
   - Verify all branches, conditions, and edge cases are preserved
   - Ensure return values, error handling, and side effects remain identical
   - Check that no functionality was accidentally removed or altered
   - If any logic discrepancy is found, fix it immediately before presenting to user

4. **Present results**:
   Share the agent's refined code and summary with the user in their native language. Include a brief confirmation that logic has been verified.

**Philosophy**: Less is more. Every line should earn its place. Prefer 3 clear lines over 1 clever line, but prefer 1 clear line over 3 redundant lines.
