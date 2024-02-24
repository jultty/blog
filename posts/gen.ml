#!/usr/bin/env utop

let args css = "--css " ^ css ^ " -s --to html5 --highlight-style zenburn "

let vert md = begin
  Sys.command (
    "pandoc " ^ args "../../assets/style.css" ^ md ^ " -o html/" ^ md ^ ".html "
  )
end ;;

let contents = Sys.readdir "."
  |> Array.to_list
  |> List.filter (fun e -> e <> "gen.ml" && e <> "html")
  |> List.map vert
