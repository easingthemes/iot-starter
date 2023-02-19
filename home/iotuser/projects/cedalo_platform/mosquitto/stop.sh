#!/usr/bin/env bash

echo "Mosquitto Stop"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"
cd "$SCRIPT_DIR" || exit
echo "Docker stop"
docker compose \
	-f ./docker-compose.yml \
	down
