#!/usr/bin/env utop

let pandoc_params = "--css ../../assets/style.css -s --to html5 --metadata pagetitle='basename' "

let vert md = begin
  if md <> "gen.ml" && md <> "html" then
    ignore( Sys.command ("pandoc " ^ pandoc_params ^ md ^ " -o html/" ^ md ^ ".html ") )
end ;;

let contents = Array.to_list (Sys.readdir ".") in
List.map vert contents ;;
