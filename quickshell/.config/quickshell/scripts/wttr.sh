#!/usr/bin/env bash

# Function to escape JSON string
escape_json() {
    printf '%s' "$1" | jq -Rs .
}

for i in {1..5}
do
    text=$(curl -s --max-time 10 --connect-timeout 5 "https://wttr.in/$1?format=1")
    if [[ $? == 0 ]] && [[ -n "$text" ]]
    then
        text=$(echo "$text" | sed -E "s/\s+/ /g")
        tooltip=$(curl -s --max-time 10 --connect-timeout 5 "https://wttr.in/$1?format=4")
        if [[ $? == 0 ]] && [[ -n "$tooltip" ]]
        then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            text_escaped=$(escape_json "$text")
            tooltip_escaped=$(escape_json "$tooltip")
            echo "{\"text\":$text_escaped, \"tooltip\":$tooltip_escaped}"
            exit
        fi
    fi
    sleep 2
done
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
