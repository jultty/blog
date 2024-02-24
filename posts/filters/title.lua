-- source: https://stackoverflow.com/a/76048743

local title

function Header(e)
  if title then return end
  title = pandoc.utils.stringify(e) .. " • jutty.dev"
end

function Meta(e)
  if not e.pagetitle then
    e.pagetitle = title
    return e
  end
end
