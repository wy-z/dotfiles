---
description: "Iterative code refinement (default: git staged changes)"
---

Iterative code refinement through the code-simplifier agent. Less is more.

**Target**: $ARGUMENTS (file path, git ref range, or empty for `git diff --cached`)

**Process**:

1. **Get target**:
   - If `$ARGUMENTS` is a file path: use that file
   - If `$ARGUMENTS` is a git range: get changed files from `git diff <range> --name-only`
   - If empty: get staged files from `git diff --cached --name-only`

2. **Execute refinement**: Call Task tool:
   ```
   Task(
     subagent_type="code-simplifier:code-simplifier",
     prompt="Refine the following files through 3 rounds:
       Round 1 - Structure & Clarity: eliminate redundancy, improve naming, flatten nested logic
       Round 2 - Elegance & Idioms: apply idiomatic patterns, remove unnecessary abstractions
       Round 3 - Final Polish: maximum readability with minimum code

       For each significant change, provide before/after code snippets.

       Files to refine: <list file paths here>"
   )
   ```
   The agent has file access - pass absolute file paths in the prompt.

3. **Verify logic**: Review each before/after snippet from the agent:
   - ✅ Logic preserved → accept change
   - ❌ Logic broken → fix before proceeding

4. **Present results** (in user's native language):
   - Key improvements (bullets)
   - Lines changed statistics
   - "Logic verified" confirmation

**Principles**: Concise, elegant, readable. No over-engineering. Every line earns its place.
