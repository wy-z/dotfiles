---
description: "Three-way AI code review (default: git staged changes)"
---

Three-way code review with cross-validation from multiple AI perspectives.

**Target**: $ARGUMENTS (file path, git ref range like `HEAD~3..HEAD`, or empty for `git diff --cached`)

**Process**:

1. **Get review content**:
   - If `$ARGUMENTS` is a file path: read the file
   - If `$ARGUMENTS` is a git range: run `git diff <range>`
   - If empty: run `git diff --cached`

2. **Your review**: Analyze for quality, bugs, security, performance, readability, and test coverage

3. **External reviews** (run in parallel using Task agents):
   - Launch two Task agents simultaneously
   - Each agent calls clink, analyzes the response, and returns only key findings
   - Agent prompt: "Call clink(cli_name='<gemini|codex>', role='codereviewer', prompt='Review this code: <content>', absolute_file_paths=[...]). Summarize response as: (1) bugs/errors, (2) security issues, (3) top 3 other suggestions. Be concise."

4. **Synthesize all three**: Compare your review + gemini + codex:
   - Unanimous agreements (highest confidence)
   - Points of disagreement (analyze why)
   - Unique insights each reviewer caught
   - Prioritized recommendations

5. **YAGNI filter**: Apply strict filtering to all recommendations:
   - **Keep**: Bug fixes, security issues, correctness problems
   - **Keep**: Issues that will cause immediate problems
   - **Discard**: "While you're here" improvements
   - **Discard**: Speculative refactoring or premature abstractions
   - **Discard**: Style suggestions unrelated to the change's intent
   - **Discard**: Future-proofing or extensibility suggestions
   - **Question**: If a suggestion requires justification beyond "best practice", discard it

**Output**: Final filtered synthesis in user's native language. Only actionable, necessary items remain.
