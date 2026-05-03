#!/usr/bin/env sh

set -eu

root=https://blog.jutty.dev
cache=indexed.cache
request_pause=7 # 1 second above rate limit of 10/minute

touch "$cache"
zola -r .. build
feed=$(cat ../public/atom.xml)

filter() {
    kind="$1"
    printf '%s' "$feed" | grep "<id>$root/$kind/.*</id>" |
        grep -v '/drafts/' | sed 's|\s*<id>\(.*\)</id>|\1|'
}

fetch() {
    url="$1"
    curl -sSLf "https://octothorp.es/get/pages/posted?s=$url"
    sleep "$request_pause"
}

index() {
    urls="$1"
    for url in $urls; do
        if grep -qF "$url" "$cache"; then
            echo Cached: "$url"
        else
            response=$(fetch "$url")
            length=$(printf '%s' "$response" | jq '.[] | length')

            if [ "$length" -gt 0 ]; then
                echo Already indexed: "$url"
                printf '%s\n' "$url" >> "$cache"
            else
                echo Indexing: "$url"
                response=$(curl -sSLf -X POST https://octothorp.es/index \
                    -H "Origin: https://blog.jutty.dev" \
                    -H "Content-Type: application/x-www-form-urlencoded" \
                    -d "uri=$url"
                )
                if [ "$(printf '%s' "$response" | jq -r .status)" = success ]; then
                    echo Indexed: "$url"
                    printf '%s\n' "$url" >> "$cache"
                else
                    echo Error: "$response"
                fi
            fi
        fi
    done
}

index "$(filter posts)"
index "$(filter notes)"
#links=$(filter links)
