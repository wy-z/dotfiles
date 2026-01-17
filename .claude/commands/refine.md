---
description: "Iterative code refinement (default: git staged changes)"
---

Refine code through iterative rounds using the code-simplifier agent.

**Core Principles**: Code must be **concise**, **elegant**, and **readable**. Avoid over-engineering, unnecessary abstractions, and verbose patterns. Simplicity is the ultimate sophistication.

**Target**: $ARGUMENTS

**Process**:

## Step 1: Determine target
- If `$ARGUMENTS` provided: use as target (file path, git ref range, or content)
- If empty: use `git diff --cached` for staged changes

## Step 2: Execute refinement
Use the Task tool with `subagent_type: "code-simplifier:code-simplifier"`.

Prompt the agent with:
- The target code/files to refine
- Instruction to perform 3 iterative refinement rounds:
  - Round 1: Structure & Clarity (eliminate redundancy, improve naming, flatten nested logic)
  - Round 2: Elegance & Idioms (apply idiomatic patterns, remove unnecessary abstractions)
  - Round 3: Final Polish (maximum readability with minimum code)
- Request before/after code snippets for each significant change

## Step 3: Verify logic preservation
Based on the agent's before/after snippets, YOU must:
1. Verify each change preserves the original logic
2. Output a verification table:

| Change | Before | After | Logic Preserved? |
|--------|--------|-------|------------------|
| (description) | (original code) | (new code) | ✅ or ❌ + reason |

3. If any ❌, fix immediately before proceeding

## Step 4: Present results
Output in user's native language:
1. Key improvements (bullet points)
2. Lines changed statistics
3. Confirmation: "Logic verified"

**Philosophy**: Less is more. Every line should earn its place.
