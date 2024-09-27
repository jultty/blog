+++
title = "Release tmux 3.5 · tmux/tmux"
date = 2024-09-27
[extra]
url = "https://github.com/tmux/tmux/releases/tag/3.5"
+++

Interesting [changes](https://raw.githubusercontent.com/tmux/tmux/3.5/CHANGES) include:

- "Display hyperlinks in copy mode and add `copy_cursor_hyperlink` format to get
  the hyperlink under the cursor."
- "Add a prefix timeout option."
- "Add mirrored versions of the `main-horizontal` and `main-vertical` layouts where
  the main pane is bottom or right instead of top or left."
- "Add `--enable-jemalloc` to build with jemalloc memory allocator (since glibc
  malloc is so poor)."
- "Add `N` to search backwards in tree modes."
- "Use `default-shell` for command prompt, `#()` and popups."
- "Add a `command-error` hook when a command fails."
