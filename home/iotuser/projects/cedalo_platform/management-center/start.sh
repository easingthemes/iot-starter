#!/usr/bin/env bash

echo "Start MC"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"
cd "$SCRIPT_DIR" || exit

echo "MC Start $CEDALO_MC_BROKER_ID"
CEDALO_MC_DIRECTORY_SETTINGS="${SCRIPT_DIR}/config/" CEDALO_MC_PROXY_CONFIG_DIR="${SCRIPT_DIR}/config/" node -r "$SCRIPT_DIR"/../node_modules/dotenv/config ./start.js dotenv_config_path="$SCRIPT_DIR"/../.env
