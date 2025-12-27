---
description: "Three-way AI code review (default: git staged changes)"
---

Perform a three-way comprehensive code review.

**Review Target**: $ARGUMENTS

Process:
1. Determine the review content:
   - If `$ARGUMENTS` is provided and non-empty, use it as the review target (could be a file path, git ref range like `HEAD~3..HEAD`, or specific content description)
   - If `$ARGUMENTS` is empty or not provided, default to git staged changes using `git diff --cached`

2. YOU (Claude) directly analyze the review content and provide your review covering:
   - Code quality and best practices
   - Potential bugs and security issues
   - Performance considerations
   - Readability and maintainability
   - Test coverage recommendations

3. Use clink to get independent reviews from two other models:
   - `clink` with `cli_name: "gemini"` and `role: "codereviewer"`
   - `clink` with `cli_name: "codex"` and `role: "codereviewer"`

   Pass the review content (diff or file content) as the prompt context for each clink call.

4. **Three-way cross-validation synthesis** - Compare and synthesize all THREE perspectives (your own + gemini + codex) to provide:
   - Unanimously agreed strengths (issues confirmed by all three reviewers carry highest confidence)
   - Unanimously agreed issues (problems identified by all three are critical to address)
   - Points of disagreement among the three reviews (highlight where reviewers diverge and analyze why)
   - Cross-validation insights (what each reviewer caught that others missed)
   - Final improvement recommendations (prioritized by cross-validation confidence)

**IMPORTANT**: Provide the final synthesis summary in the user's native language (inferred from conversation context).
