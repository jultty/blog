#!/usr/bin/env zsh
# dependencies: zsh, xmlstarlet, xmllint

date="$(date +'%a, %d %b %Y %H:%M:%S %z')"
data='assets/js/data.js'

function subnode {
  local -r tag="${1}"
  local -r value="${2}"
  local path="${3:-rss/channel/new}"
  local -r file="${4:-tmp.rss}"

  if [[ -n $value ]]; then
    /usr/bin/xmlstarlet ed -L --subnode "$path" -t elem -n "$tag" -v "$value" "$file"
  else
    /usr/bin/xmlstarlet ed -L --subnode "$path" -t elem -n "$tag" "$file"
  fi
}

function insert {
  local -r title="$1"
  local -r slug="${2}.html"
  local -r file="${3}"
  local -r url_root='https://blog.jutty.dev/posts'
  local -r author='juno@jutty.dev (Juno Takano)'

  if grep -q "$url_root/$slug" "$file"; then
    return 0
  fi

  xmlstarlet ed --update rss/channel/lastBuildDate --value "$date" "$file" > tmp.rss

  subnode new '' rss/channel
  subnode title "$title"
  subnode pubDate "$date"
  subnode link "$url_root/$slug"
  subnode guid "$url_root/$slug"
  subnode author "$author"

  sed -i 's/<new>/<item>/g' tmp.rss
  sed -i 's/<\/new>/<\/item>/g' tmp.rss

  if xmllint --noout tmp.rss; then
    mv -v tmp.rss "$file"
  else
    echo 'Generated an invalid feed, not overwriting'
    rm -v tmp.rss
    return 1
  fi

}

function assemble_index {
  local -r lang="$1"

  cat "$data" |
    grep -v function |
    sed 's/ *return //' |
    sed -E ':a;N;$!ba; s/(.*)\}(.*)/\1\2/' |
    jq ".$lang" |
    grep 'title\|slug' |
    grep '.'
}

index_en=$(assemble_index en)
index_pt=$(assemble_index pt)

function insert_from {
  local -r index="$1"
  local -r file="$2"
  local -r total=$(echo $index | wc -l)
  local title
  local slug

  current=2
  while [[ $current -le $total ]]; do
    lines=$(echo $index | tail -$((current)) | head -2)
    title=$(echo $lines | grep title | cut -d'"' -f 4 | xargs)
    slug=$(echo $lines | grep slug | cut -d'"' -f 4 | xargs)
    insert "$title" "$slug" "$file"
    ((current+=2))
  done
}

insert_from "$index_pt" pt.rss
insert_from "$index_en" en.rss
