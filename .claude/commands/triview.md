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

3. **External reviews** (run in parallel): Call `mcp__pal__clink` twice:
   ```
   clink(cli_name="gemini", role="codereviewer", prompt="Review this code: <content>", absolute_file_paths=[...])
   clink(cli_name="codex", role="codereviewer", prompt="Review this code: <content>", absolute_file_paths=[...])
   ```
   For file targets, pass paths via `absolute_file_paths`. For diff content, include in `prompt`.

4. **Synthesize all three**: Compare your review + gemini + codex:
   - Unanimous agreements (highest confidence)
   - Points of disagreement (analyze why)
   - Unique insights each reviewer caught
   - Prioritized recommendations

**Output**: Final synthesis in user's native language.
