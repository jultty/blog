#!/usr/bin/env utop

let pandoc_params = "--css ../../assets/style.css -s --to html5 " ^
  "--metadata pagetitle='basename' --highlight-style zenburn "

let vert md = begin
  let cmd = ("pandoc " ^ pandoc_params ^ md ^ " -o html/" ^ md ^ ".html ") in
  ignore( Sys.command cmd )
end ;;

let contents = Sys.readdir "."
  |> Array.to_list
  |> List.filter (fun e -> e <> "gen.ml" && e <> "html")
  |> List.map vert
