#!/usr/bin/env utop

let args = "--css ../../assets/style.css -s --to html5 " ^
  "--highlight-style zenburn " ^ "--lua-filter filters/title.lua "

let vert md = begin
  Sys.command (
    "pandoc " ^ args  ^ " markdown/" ^ md ^ " -o html/" ^ md ^ ".html "
  )
end ;;

let contents = Sys.readdir "./markdown/"
  |> Array.to_list
  |> List.map vert
