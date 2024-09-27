+++
title = "Release tmux 3.5 · tmux/tmux"
date = 2024-09-27
[extra]
url = "https://github.com/tmux/tmux/releases/tag/3.5"
+++

[Mudanças](https://raw.githubusercontent.com/tmux/tmux/3.5/CHANGES) interessantes incluem:

- "Mostra hyperlinks no modo de cópia e adiciona o formato 
  `copy_cursor_hyperlink` para obter o hyperlink sob o cursor."
- "Adiciona uma opção de timeout para o prefixo."
- "Adiciona versões espelhadas dos layouts `main-horizontal` e `main-vertical` 
  onde o painel principal fica em baixo ou à direita ao invés de no topo ou esquerda."
- "Adiciona `--enable-jemalloc` para build com alocador de memória jemalloc 
  (já que o malloc da glibc é tão pobre)."
- "Adiciona `N` para busca reversa nos modos tree."
- "Usa `default-shell` para a prompt de comando, `#()` e popups."
- "Adiciona um hook `command-error` quando um comando falha."
