#!/bin/sh
if [ "$SERVICE_TYPE" == "request" ]
then
    envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < /config/request.hcl > /config/config.hcl
else
    envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < /config/response.hcl > /config/config.hcl
fi
sleep 1

# Call the original entrypoint of the base image
exec /entrypoint.sh "$@"