#!/usr/bin/env sh

exclusions='^(index-user-controls|subpage-user-controls|title|taxon-title)$'

set -eu
git_root=$(cd "$(dirname "$0")"; git rev-parse --show-toplevel)
style="$git_root/static/assets/css/style.css"

diff_classes() {
    template_classes=$(mktemp -u)
    mkfifo "$template_classes"

    # TODO support multiple classes in the same class= key
    grep -Eoh 'class="[a-zA-Z0-9-]+"' "$git_root/templates/"*  |
        sed -E 's/class=|"//g' |
        grep -Ev "${exclusions:-f481b6cd58e}" |
        sort | uniq \
        > "$template_classes" &

    css_classes=$(mktemp -u)
    mkfifo "$css_classes"

    grep -Eo '\.[a-zA-Z-]+[0-9-]*' "$style" |
        sed 's/\.//g' |
        grep -v '^ttf$' |
        grep -Ev "${exclusions:-f481b6cd58e}" |
        sort | uniq \
        > "$css_classes" &

    echo "Classes diff:"
    if ! diff "$template_classes" "$css_classes" > /dev/null; then
        echo '< html | css >'
        diff --color=auto "$template_classes" "$css_classes"
    fi
    [ -z "$exclusions" ] || echo "Exclusions: $exclusions"

    rm -f "$template_classes"
    rm -f "$css_classes"

}

purge_css() {

    purged_css=$(
        purgecss \
            --content "$git_root/templates/*.html" \
            --css "$style"  \
            --rejected |
            jq '.[0].rejected'
        )

        purged_css_count=$(printf '%s' "$purged_css" | jq '. | length')

        if [ "$purged_css_count" -gt 0 ]; then
            printf '\n%s\n' purgecss:
            printf '%s' "$purged_css" | jq '.'
            exit 1
        fi
}

diff_classes

printf '\n%s\n' csskit:
csskit check "$git_root/scripts/lint.cks" "$style"

purge_css
