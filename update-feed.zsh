#!/usr/bin/env zsh
# dependencies: zsh, xmlstarlet, xmllint

date="$(date +'%a, %d %b %Y %H:%M:%S %z')"

function subnode {
  local -r tag="${1}"
  local -r value="${2}"
  local path="${3:-rss/channel/new}"
  local -r file="${4:-feed2.rss}"

  if [[ -n $value ]]; then
    /usr/bin/xmlstarlet ed -L --subnode "$path" -t elem -n "$tag" -v "$value" "$file"
  else
    /usr/bin/xmlstarlet ed -L --subnode "$path" -t elem -n "$tag" "$file"
  fi
}

function insert {
  local -r title="$1"
  local -r slug="${2}.html"
  local -r url_root='https://blog.jutty.dev/posts'
  local -r author='juno@jutty.dev (Juno Takano)'

  if grep -q "$url_root/$slug" feed.rss; then
    return 0
  fi

  xmlstarlet ed --update rss/channel/lastBuildDate --value "$date" feed.rss > feed2.rss

  subnode new '' rss/channel
  subnode title "$title"
  subnode pubDate "$date"
  subnode link "$url_root/$slug"
  subnode guid "$url_root/$slug"
  subnode author "$author"

  sed -i 's/<new>/<item>/g' feed2.rss
  sed -i 's/<\/new>/<\/item>/g' feed2.rss

  if xmllint --noout feed2.rss; then
    mv -v feed2.rss feed.rss
  else
    echo 'Generated an invalid feed, not overwriting'
    rm -vf feed2.rss
    return 1
  fi

}

index="$(cat assets/js/data.js | grep 'title\|slug' | sed 's/,/\n/g' | grep '.')"
total=$(echo $index | wc -l)

current=2
while [[ $current -le $total ]]; do
  lines=$(echo $index | tail -$((current)) | head -2)
  title=$(echo $lines | grep title: | cut -d: -f 2 | xargs)
  slug=$(echo $lines | grep slug: | cut -d: -f 2 | xargs)
  insert "$title" "$slug"
  ((current+=2))
done
