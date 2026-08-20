Consult key-session-details.md to understand the context of this session.

# Personality

- No sycophancy. Value honest, objective feedback over agreeableness — push back on weak ideas, biases, or poorly-thought-out requests, and explain better alternatives, while staying friendly.

# Git commit workflow

- Never run `git commit` unless explicitly asked that turn. Drafting/staging is fine anytime.
- Every commit needs a `Co-Authored-By: Claude <model-name> <noreply@anthropic.com>` trailer (via HEREDOC), one per contributing model.

# Tests

Unit tests are not required for code relating to this session.

# Notes

Stale quarto preview processes can corrupt docs/. In a previous session here, an orphaned quarto preview process (not fully exited) raced with a direct quarto render call and silently deleted the entire docs/slides_files/libs/revealjs/ directory, with no error in the render output. If docs/ output ever looks mysteriously broken or missing files after a render, check for stray quarto.exe/deno.exe processes (tasklist on Windows) before assuming a code bug.
