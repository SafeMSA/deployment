#!/bin/bash

for ((i = 0; i < 100; i++)); do
    CONTAINERS=$(docker ps --format "{{.Names}}" | grep -E 'evac-proxy|tag' | shuf -n $(shuf -i 1-3 -n 1))
    
    for CONTAINER in $CONTAINERS; do
        echo "Stopping container: $CONTAINER"
        docker stop --timeout=1 "$CONTAINER"
    done

    SLEEP_TIME=$(shuf -i 10-60 -n 1)
    echo "Sleeping for $SLEEP_TIME seconds..."
    sleep "$SLEEP_TIME"

    for CONTAINER in $CONTAINERS; do
        echo "Starting container: $CONTAINER"
        docker start "$CONTAINER"
    done
done