#!/bin/sh
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < /config/base.hcl > /config/evac.hcl
sleep 10

# Call the original entrypoint of the base image
exec /entrypoint.sh "$@"