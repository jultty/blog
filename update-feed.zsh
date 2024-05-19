#!/usr/bin/env zsh
# dependencies: zsh, xmlstarlet, xmllint, jq

alias xml="xmlstarlet"
date="$(date +'%a, %d %b %Y %H:%M:%S %z')"

function insert {
  local -r title="$1"
  local -r slug="${2}.html"
  local -r url_root='https://blog.jutty.dev/posts'
  local -r author='juno@jutty.dev (Juno Takano)'

  if grep -q "$url_root/$slug" feed.rss; then
    return 0
  fi

  xml ed --update rss/channel/lastBuildDate --value "$date" feed.rss > feed2.rss

  xml ed -L --subnode rss/channel     -t elem -n new feed2.rss
  xml ed -L --subnode rss/channel/new -t elem -n title -v "$title" feed2.rss
  xml ed -L --subnode rss/channel/new -t elem -n pubDate -v "$date" feed2.rss
  xml ed -L --subnode rss/channel/new -t elem -n link -v "$url_root/$slug" feed2.rss
  xml ed -L --subnode rss/channel/new -t elem -n guid -v "$url_root/$slug" feed2.rss
  xml ed -L --subnode rss/channel/new -t elem -n author -v "$author" feed2.rss

  sed -i 's/<new>/<item>/g' feed2.rss
  sed -i 's/<\/new>/<\/item>/g' feed2.rss

  if xmllint --noout feed2.rss; then
    mv -v feed2.rss feed.rss
  else
    echo 'Generated an invalid feed, not overwriting'
    return 1
  fi

}

index="$(cat assets/js/data.js | grep 'title\|slug' | sed 's/,/\n/g' | grep '.')"
total=$(echo $index | wc -l)

current=2
while [[ $current -le $total ]]; do
  echo processing $current
  lines=$(echo $index | tail -$((current)) | head -2)
  title=$(echo $lines | grep title: | cut -d: -f 2 | xargs)
  slug=$(echo $lines | grep slug: | cut -d: -f 2 | xargs)
  echo title: $title
  echo slug: $slug
  insert "$title" "$slug"
  ((current+=2))
done

echo -e "\nfeed.rss:"
cat feed.rss | xq -x
