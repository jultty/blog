#!/usr/bin/env sh

set -eu

url_root=https://blog.jutty.dev
git_root=$(git rev-parse --show-toplevel)
cache=$git_root/scripts/octo-index.cache
request_pause=7 # 1 second above rate limit of 10/minute

touch "$cache"
zola --root "$git_root" build
feed="$git_root/public/atom.xml"

alias print="printf '%s\n'"

filter() {
    kind="$1"
    from_date="${2:-}"

    if [ -n "$from_date" ]; then

        from_date_ts=$(date -d "$from_date" +%s)

        xq -j "$feed" |
            jq -r "[.feed.entry | .[]
                | select(.id | test(\"^https://blog.jutty.dev/$kind\"))]
                | map({id, published})
                | map(.published = (.published | strptime(\"%Y-%m-%dT%H:%M:%S%z\")))
                | map(.published = (.published | mktime))
                | map(select(.published > $from_date_ts))
                .[].id
        "

    else
        grep "<id>$url_root/$kind/.*</id>" "$feed" |
            grep -v '/drafts/' | sed 's|\s*<id>\(.*\)</id>|\1|'
    fi
}

fetch() {
    url="$1"
    curl -sSLf "https://octothorp.es/get/pages/posted?s=$url"
    sleep "$request_pause"
}

index() {
    urls="$1"
    for url in $urls; do
        url=$(printf '%s' "$url" | sed 's|/$||')
        if grep -qF "$url" "$cache"; then
            echo Cached: "$url"
        else
            echo "Querying: $url"
            state=$(fetch "$url")
            echo Testing: "$(print "$state" | jq -r '.results.[0].uri')" = "$url"
            if
                [ "$(print "$state" | jq -r '.results.[0].uri')" = "$url" ]
            then
                echo Already indexed: "$url"
                print "$url" >> "$cache"
            else
                echo Indexing: "$url"
                response=$(curl -sSLf -X POST https://octothorp.es/index \
                    -H "Origin: https://blog.jutty.dev" \
                    -H "Content-Type: application/x-www-form-urlencoded" \
                    -d "uri=$url"
                )
                if [ "$(print "$response" | jq -r .status)" = success ]; then
                    echo Indexed: "$url"
                    print "$url" >> "$cache"
                else
                    echo Error: "$response"
                fi
            fi
        fi
    done
}

index "$(filter posts)"
index "$(filter notes)"
index "$(filter links '2026-05-01T00:00:00-03:00')"
