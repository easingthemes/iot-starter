#!/usr/bin/env bash

echo "Mosquitto Build"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"

cd "$SCRIPT_DIR" || exit
rm "$SCRIPT_DIR"/data/dynamic-security.json
echo "Init dynsec admin user: $CEDALO_MC_BROKER_USERNAME"
mosquitto_ctrl \
  dynsec init \
  "$SCRIPT_DIR"/data/dynamic-security.json \
  "$CEDALO_MC_BROKER_USERNAME" \
  "$CEDALO_MC_BROKER_PASSWORD"
