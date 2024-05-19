#!/usr/bin/env utop

let args = "--css ../../assets/style.css -s --to html5 " ^
  "--highlight-style zenburn " ^ "--lua-filter filters/title.lua "


let vert md = begin
  let filename_split = String.split_on_char '.' md in
  Sys.command (
    "pandoc " ^ args  ^ " md/" ^ md ^ " -o " ^ List.nth filename_split 0
  )
end ;;

let contents = Sys.readdir "./md/"
  |> Array.to_list
  |> List.map vert
