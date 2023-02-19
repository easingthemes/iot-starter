#!/usr/bin/env bash

echo "Mosquitto Start"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "PWD: $PWD, DIR: $SCRIPT_DIR"
echo "Add .env"
. "$SCRIPT_DIR/../.env"
cd "$SCRIPT_DIR" || exit
echo "Docker up"
docker compose \
	-f ./docker-compose.yml \
	up
