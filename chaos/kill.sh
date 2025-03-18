#!/bin/bash
CONTAINER=$(docker ps --format "{{.Names}}" | shuf -n 1)
echo "Stopping container: $CONTAINER"
docker stop "$CONTAINER"
sleep 5
docker start "$CONTAINER"