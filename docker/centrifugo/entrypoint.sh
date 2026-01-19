#!/bin/bash
set -e

# Create config from template
CENTRIFUGO_CONFIG_PATH="/etc/centrifugo/config.json"

# Check if template exists
if [ ! -f "/centrifugo/config.json" ]; then
    echo "Error: config.json template not found"
    exit 1
fi

# Replace environment variables in config
envsubst < /centrifugo/config.json > "$CENTRIFUGO_CONFIG_PATH"

# Start Centrifugo
exec centrifugo --config="$CENTRIFUGO_CONFIG_PATH"
