+++
title = "Scripts em OCaml"
date = 2024-02-23
aliases = ["posts/scripts-em-ocaml.html"]
+++

Este blog gera suas postagens com o Pandoc, mas quem faz o trabalho lógico de identificar os arquivos e montar os comandos é um pequeno script em OCaml.

Descobri essa linguagem quando comecei a investigar como poderia substituir o Bash como uma linguagem para scripts. Eu acho que o Bash é excelente para cumprir essa função, apesar de bastante inseguro e propenso a erros. O que me incomodava mesmo era ver que todo aquele tempo escrevendo scripts com Bash poderia ser tempo aprendendo uma linguagem cujo conhecimento se transferisse para muitas outras aplicações.

O script se resume a:

```ocaml
let pandoc_params = 
  "--css ../../assets/style.css -s --to html5 --metadata pagetitle='basename' "

let vert md = begin
  if md <> "gen.ml" && md <> "html" then
    ignore( Sys.command (
      "pandoc " ^ pandoc_params ^ md ^ " -o html/" ^ md ^ ".html "
    ) )
end ;;

let contents = Array.to_list (Sys.readdir ".") in
List.map vert contents ;;
```

Primeiro, armazeno em `pandoc_params` os parâmetros comuns que serão passados ao Pandoc para gerar os arquivos HTML a partir dos arquivos em Markdown.

Em seguida, defino a função `vert`, que, caso o arquivo não se chame "gen.ml" (o próprio script) nem "html" (o diretório onde os arquivos gerados ficam), o comando do Pandoc é chamado com os nomes dos arquivos de entrada e saída.

Essa função então é aplicada com `List.map vert contents` a cada arquivo do diretório atual.

## Referências
- [Walk a directory/Non-recursively - Rosetta Code](https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#OCaml)
- [Pandoc Markdown CSS Theme](https://jez.io/pandoc-markdown-css-theme/)
