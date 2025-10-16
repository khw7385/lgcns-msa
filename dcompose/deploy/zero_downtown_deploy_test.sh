#!/bin/zsh

URL="http://localhost:9889/"

while true
do
    TIME=$(date "+%Y-%m-%d %H:%M:%S")

    INFO=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 --retry 3 --retry-delay 1  $URL 2>&1)
    EXIT_CODE=$?

    if [[ $EXIT_CODE -ne 0 ]]; then
        echo "(CURL ERROR) $TIME | exit_code=$EXIT_CODE | message=$INFO"
    else
        CODE=$(echo "${INFO}")
        if [[ $CODE -ge 200 && $CODE -lt 300 ]]; then
            echo "$TIME | HTTP $CODE"
        else
            echo "(HTTP ERROR) $TIME | HTTP $CODE"
        fi
    fi

    sleep 1
done
